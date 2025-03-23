// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

import "../interfaces/ICNR.sol";

/**
 * @title Real World Asset Tokenization Protocol
 * @dev
 *
 */

contract RWAT is
    Initializable,
    ERC721Upgradeable,
    EIP712Upgradeable,
    AccessControlUpgradeable,
    PausableUpgradeable
{
    /**
     * @dev keccak256 hash of “ADMIN”, representing a role by this name for access control purposes
     */
    bytes32 public constant ADMIN = keccak256("ADMIN");

    /**
     * @dev keccak256 hash of HANDLER, representing a role by this name for access control purposes
     */
    bytes32 public constant HANDLER = keccak256("HANDLER");

    /**
     * @dev keccak256 hash of WHITELISTER, representing a role by this name for access control purposes
     */
    bytes32 public constant WHITELISTER = keccak256("WHITELISTER");

    /**
     * @dev address of the ChromiaNetResolver for tokenURI
     */
    ICNR private CNR;

    /**
     * @dev mapping that tracks whitelist status
     */
    mapping(address => bool) public isWhitelisted;

    /**
     * @dev toggle all token transfers disabled
     */
    bool public pausedTransfers;

    /**
     * @dev toggle token transfers disabled between non-whitelisted addresses
     */
    bool public whitelistedTransfers;

    /**
     * @dev mapping to toggle token transfers disabled for a specific asset id
     */
    mapping(uint256 => bool) public assetPaused;

    /**
     * @dev mapping for the next token id for a specific asset id
     */
    mapping(uint256 => uint256) private assetNextId;

    /**
     * @dev mapping for the last possible token id for a specific asset id
     */
    mapping(uint256 => uint256) private assetLastId;

    /**
     * @dev mapping for the amount of tokens burned for a specific asset id
     */
    mapping(uint256 => uint256) public assetTokensBurned;

    /**
     * @dev mapping for disabling updateAssetCap and burning for a specific asset id
     */
    mapping(uint256 => bool) public lockedAssetCap;

    /**
     * @dev mapping for preventing replay attacks of signature data
     */
    mapping(address => uint) public internalNonce;

    /**
     * @dev disables functionality to change collection name and symbol
     */
    bool public nameAndSymbolLocked;

    /**
     * @dev disables functionality to toggle if whitelist is needed for transfers
     */
    bool public whitelistedTransfersLocked;

    /**
     * @dev disables the admin ability to reclaim units from users
     */
    bool public reclaimUnitsDisabled;

    /**
     * @dev disables the functionality to toggle if transfers are possible
     */
    bool public pausedTransfersLocked;

    /**
     * @dev server address that is used to check validity of signed data
     */
    address private serverPubKey;

    /**
     * @dev overrides name of the ERC721 collection
     */
    string private name_;

    /**
     * @dev overrides symbol of the ERC721 collection
     */
    string private symbol_;

    /**
     * @notice Emitted when units have been claimed
     * @param claimant Address claiming the units
     * @param tokenIds The ids of the claimed tokens
     */
    event UnitsClaimed(address indexed claimant, uint256[] indexed tokenIds);

    /**
     * @dev checks if msg.sender have one of two possible roles
     */
    modifier onlyRoles(bytes32 role1, bytes32 role2) {
        require(
            hasRole(role1, msg.sender) || hasRole(role2, msg.sender),
            string(
                abi.encodePacked(
                    "AccessControl: account ",
                    StringsUpgradeable.toHexString(msg.sender),
                    " is missing role ",
                    StringsUpgradeable.toHexString(uint256(role1), 32),
                    " or ",
                    StringsUpgradeable.toHexString(uint256(role2), 32)
                )
            )
        );
        _;
    }

    /**
     * @notice Called first in the initialize (RWAT) contract upon deployment. Functions with
     * state variables that are not stated as CONSTANTS are required to be declared with
     * the onlyInitalizing statement, to not interrupt the initialize call in the RWAT contract.
     * @param _default_admin Address to get DEFAULT_ADMIN role in AccessControl
     * @param _collectionName The name to give this ERC721 collection
     * @param _collectionSymbol The symbol to give this ERC721 collection
     * @param _CNR Address of the ChromiaNetResolver for handling metadata
     */
    function initialize(
        address _default_admin,
        string memory _collectionName,
        string memory _collectionSymbol,
        ICNR _CNR
    ) external initializer {
        __AccessControl_init();
        _setupRole(DEFAULT_ADMIN_ROLE, _default_admin);
        _setupRole(ADMIN, _default_admin);

        __ERC721_init(_collectionName, _collectionSymbol);
        __EIP712_init(_collectionName, "1");

        CNR = _CNR;
        name_ = _collectionName;
        symbol_ = _collectionSymbol;
        __Pausable_init();
    }

    /**
     * @notice creates a new asset in the collection
     * @dev only for ADMIN role
     * @param _assetId The id of the new asset
     * @param _tokenCap The max amount of tokens in the new asset
     */
    function createAsset(
        uint256 _assetId,
        uint256 _tokenCap
    ) external onlyRole(ADMIN) {
        require(assetNextId[_assetId] == 0, "Asset already exists");
        require(_tokenCap != 0, "Asset cap can not be 0");
        require(
            _tokenCap < 1_000_000_000,
            "Asset cap can not be more than 1000000000"
        );

        assetNextId[_assetId] = _assetId * 1_000_000_000;
        assetLastId[_assetId] = _assetId * 1_000_000_000 + _tokenCap;
    }

    /**
     * @notice updates the token cap for an asset
     * @dev only for ADMIN role
     * @param _assetId The id of the asset
     * @param _tokenCap The new token cap
     */
    function updateAssetCap(
        uint256 _assetId,
        uint256 _tokenCap
    ) external onlyRole(ADMIN) {
        require(assetLastId[_assetId] != 0, "Asset does not exist");
        require(lockedAssetCap[_assetId] == false, "This asset cap is locked");
        require(
            assetNextId[_assetId] <=
                _assetId *
                    1_000_000_000 +
                    _tokenCap +
                    assetTokensBurned[_assetId],
            "Asset cap can not be lower than minted amount"
        );
        require(
            _tokenCap < 1_000_000_000,
            "Asset cap can not be more than 1000000000"
        );
        assetLastId[_assetId] =
            _assetId *
            1_000_000_000 +
            _tokenCap +
            assetTokensBurned[_assetId];
    }

    /**
     * @notice mints an amount of tokens for an asset to this contract
     * @dev only ADMIN role
     * @param _assetId The id of the asset
     * @param _amount The amount of tokens to mint for the asset
     */
    function mintUnits(
        uint256 _assetId,
        uint256 _amount
    ) external onlyRole(ADMIN) {
        _mintUnits(_assetId, _amount, address(this));
    }

    /**
     * @notice mints an amount of tokens for an asset to an address
     * @dev only ADMIN or HANDLER role
     * @param _assetId The id of the asset
     * @param _amount The amount of tokens to mint for the asset
     * @param _to The address to mint the tokens to
     */
    function mintUnitsTo(
        uint256 _assetId,
        uint256 _amount,
        address _to
    ) external onlyRoles(ADMIN, HANDLER) {
        _mintUnits(_assetId, _amount, _to);
    }

    /**
     * @notice mints an amount of tokens for an asset to msg.sender based on signed data
     * @param _assetId The id of the asset
     * @param _amount The amount of tokens to mint for the asset
     * @param _signature ECDSA signature data
     */
    function userMintUnits(
        uint256 _assetId,
        uint256 _amount,
        bytes calldata _signature
    ) external whenNotPaused {
        bytes32 digest = _hashTypedDataV4(
            keccak256(
                abi.encode(
                    keccak256(
                        "MintData(address user,uint256 nonce,uint256 asset,uint256 amount)"
                    ),
                    msg.sender,
                    internalNonce[msg.sender],
                    _assetId,
                    _amount
                )
            )
        );

        require(
            ECDSAUpgradeable.recover(digest, _signature) == serverPubKey,
            "Invalid signature"
        );
        internalNonce[msg.sender]++;
        _mintUnits(_assetId, _amount, msg.sender);
    }

    function burnUnits(
        uint _assetId,
        uint256[] calldata _tokenIds
    ) external onlyRole(ADMIN) {
        require(lockedAssetCap[_assetId] == false, "This asset cap is locked");
        uint length = _tokenIds.length;
        for (uint i = 0; i < length; i++) {
            require(
                _getTokenAsset(_tokenIds[i]) == _assetId,
                "Invalid token for asset"
            );
            require(
                ownerOf(_tokenIds[i]) == msg.sender ||
                    ownerOf(_tokenIds[i]) == address(this),
                "Invalid token owner"
            );
            _burn(_tokenIds[i]);
        }
        assetTokensBurned[_assetId] += length;
    }

    /**
     * @notice claims specific tokens from this contract
     * @param _tokenIds The ids of the tokens to claim
     * @param _signature ECDSA signature data
     */
    function claimUnits(
        uint256[] calldata _tokenIds,
        bytes calldata _signature
    ) external whenNotPaused {
        bytes32 digest = _hashTypedDataV4(
            keccak256(
                abi.encode(
                    keccak256(
                        "ClaimData(address user,uint256 nonce,uint256[] units)"
                    ),
                    msg.sender,
                    internalNonce[msg.sender],
                    keccak256(abi.encodePacked(_tokenIds))
                )
            )
        );
        require(
            ECDSAUpgradeable.recover(digest, _signature) == serverPubKey,
            "Invalid signature"
        );
        internalNonce[msg.sender]++;
        _claimUnits(address(this), msg.sender, _tokenIds);
        emit UnitsClaimed(msg.sender, _tokenIds);
    }

    /**
     * @notice transfers specific tokens from one address to another address
     * @dev only ADMIN role
     * @param _from The current owner of the tokens
     * @param _to The address to transfer the tokens to
     * @param _tokenIds The ids of the tokens to transfer
     */
    function reclaimUnits(
        address _from,
        address _to,
        uint256[] calldata _tokenIds
    ) external onlyRole(ADMIN) {
        require(
            reclaimUnitsDisabled == false,
            "Reclaiming units is not possible"
        );
        _claimUnits(_from, _to, _tokenIds);
    }

    /**
     * @notice updates whitelist status for a list of addresses
     * @dev only ADMIN or WHITELISTER role
     * @param _users The addresses to update
     * @param _whitelisted The whitelist status
     */
    function setWhitelisted(
        address[] calldata _users,
        bool _whitelisted
    ) external onlyRoles(ADMIN, WHITELISTER) {
        uint256 length = _users.length;
        for (uint256 i = 0; i < length; i++) {
            isWhitelisted[_users[i]] = _whitelisted;
        }
    }

    /**
     * @notice pauses transfers of tokens
     * @dev only ADMIN role
     */
    function setTransfersPaused(
        bool _transfersPaused
    ) external onlyRole(ADMIN) {
        require(pausedTransfersLocked == false, "Function is locked");
        pausedTransfers = _transfersPaused;
    }

    /**
     * @notice sets whitelist required for transferring or receiving tokens
     * @dev only ADMIN role
     */
    function setWhitelistedTransfers(
        bool _whitelistedTransfers
    ) external onlyRole(ADMIN) {
        require(whitelistedTransfersLocked == false, "Function is locked");
        whitelistedTransfers = _whitelistedTransfers;
    }

    /**
     * @notice pauses transfers for a specific asset
     * @dev only ADMIN role
     * @param _assetId The id of the asset to pause
     */
    function setAssetTransfersPaused(
        uint256 _assetId,
        bool _transfersPaused
    ) external onlyRole(ADMIN) {
        require(pausedTransfersLocked == false, "Function is locked");
        assetPaused[_assetId] = _transfersPaused;
    }

    /**
     * @notice updates the signer key used to validate signed data
     * @dev only ADMIN role
     * @param _serverPubKey The new address
     */
    function updateServer(address _serverPubKey) external onlyRole(ADMIN) {
        serverPubKey = _serverPubKey;
    }

    /**
     * @notice disables all functions using the whenNotPaused modifier
     * @dev only ADMIN role
     */
    function pause() external onlyRole(ADMIN) {
        _pause();
    }

    /**
     * @notice enables all functions using the whenNotPaused modifier
     * @dev only ADMIN role
     */
    function unpause() external onlyRole(ADMIN) {
        _unpause();
    }

    /**
     * @notice sets new name and symbol for the ERC721 collection
     * @param _newName The new collection name
     * @param _newSymbol The new collection symbol
     */
    function setNameAndSymbol(
        string memory _newName,
        string memory _newSymbol
    ) external onlyRole(ADMIN) {
        require(nameAndSymbolLocked == false, "Function is locked");
        name_ = _newName;
        symbol_ = _newSymbol;
    }

    /**
     * @notice locks the possiblity of changing name and symbol
     * @dev only ADMIN role
     */
    function lockNameAndSymbol() external onlyRole(ADMIN) {
        nameAndSymbolLocked = true;
    }

    /**
     * @notice disables functionality to toggle if whitelist is needed for transfers
     * @dev only ADMIN role
     */
    function lockWhitelistedTransfers() external onlyRole(ADMIN) {
        whitelistedTransfersLocked = true;
    }

    /**
     * @notice disables the functionality to toggle if transfers are possible
     * @dev only ADMIN role
     */
    function lockPausedTransfers() external onlyRole(ADMIN) {
        pausedTransfersLocked = true;
    }

    /**
     * @notice disables the functionality to reclaim units from users
     * @dev only ADMIN role
     */
    function disableReclaimUnits() external onlyRole(ADMIN) {
        reclaimUnitsDisabled = true;
    }

    /**
     * @notice disables updateAssetCap and burning units for a specific asset id
     * @dev only ADMIN role
     * @param _assetId The asset to lock
     */
    function lockAssetCap(uint _assetId) external onlyRole(ADMIN) {
        lockedAssetCap[_assetId] = true;
    }

    /**
     * @notice returns the collection name
     * @dev overrides ERC721 function
     */
    function name() public view override returns (string memory) {
        return name_;
    }

    /**
     * @notice returns the collection symbol
     * @dev overrides ERC721 function
     */
    function symbol() public view override returns (string memory) {
        return symbol_;
    }

    /**
     * @notice Getter for the max token cap for a specific asset
     * @param _assetId The id of the asset
     * @return the asset token cap
     */
    function getAssetCap(uint256 _assetId) public view returns (uint256) {
        return
            (assetLastId[_assetId] % (_assetId * 1_000_000_000)) -
            assetTokensBurned[_assetId];
    }

    /**
     * @notice Getter for the current amount of tokens in supply for a specific asset
     * @param _assetId The id of the asset
     * @return The total amount of tokens that exists for the asset
     */
    function getAssetSupply(uint256 _assetId) public view returns (uint256) {
        return
            (assetNextId[_assetId] % (_assetId * 1_000_000_000)) -
            assetTokensBurned[_assetId];
    }

    /**
     * @notice Getter for the total minted tokens for a specific asset
     * @param _assetId The id of the asset
     * @return The total amount of tokens minted for the asset
     */
    function getTotalMinted(uint256 _assetId) public view returns (uint256) {
        return assetNextId[_assetId] % (_assetId * 1_000_000_000);
    }

    /**
     * @notice returns the metadata URI for a token
     * @dev overrides ERC721 function
     * @param _tokenId The id of the token
     */
    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return ICNR(CNR).getNFTURI(address(this), _tokenId);
    }

    /**
     * @notice checks if contract supports an interface
     * @param interfaceId The interface id
     * @return If contract supports the interface or not
     */
    function supportsInterface(
        bytes4 interfaceId
    )
        public
        view
        virtual
        override(ERC721Upgradeable, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /**
     * @notice internal function for handling minting logic
     * @param _assetId The id of the asset
     * @param _amount The amount of tokens to mint for the asset
     * @param _to The address to mint the tokens to
     */
    function _mintUnits(
        uint256 _assetId,
        uint256 _amount,
        address _to
    ) internal {
        uint256 newAssetNextId = assetNextId[_assetId] + _amount;
        require(
            newAssetNextId <= assetLastId[_assetId],
            "Amount exceeds max or asset does not exist"
        );

        for (uint256 i = assetNextId[_assetId]; i < newAssetNextId; i++) {
            _mint(_to, i);
        }
        assetNextId[_assetId] = newAssetNextId;
    }

    /**
     * @notice internal function used for claiming or reclaiming tokens
     * @param _from The address to transfer tokens from
     * @param _to The address to transfer tokens to
     * @param _tokenIds The ids of the tokens to transfer
     */
    function _claimUnits(
        address _from,
        address _to,
        uint256[] calldata _tokenIds
    ) internal {
        uint256 length = _tokenIds.length;
        for (uint256 i = 0; i < length; i++) {
            _transfer(_from, _to, _tokenIds[i]);
        }
    }

    /**
     * @notice checks that a transfer passes all checks before going through
     * @dev overrides ERC721 function
     * @param from The sender of the token
     * @param to The recipient of the token
     * @param tokenId The id of the token
     * @param batchSize The amount of tokens sent
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
        if (
            !(from == address(0) || from == address(this) || to == address(0))
        ) {
            require(!pausedTransfers, "Transfers are currently paused");
            require(!assetPaused[_getTokenAsset(tokenId)], "Asset is paused");

            if (whitelistedTransfers) {
                require(
                    isWhitelisted[from] && isWhitelisted[to],
                    "Invalid token transfer"
                );
            }
        }
    }

    /**
     * @notice Getter for the asset id of a token
     * @param _tokenId The id of the token
     * @return The id of the asset that the token belongs to
     */
    function _getTokenAsset(uint256 _tokenId) internal pure returns (uint256) {
        return _tokenId / 1_000_000_000;
    }

    /**
     * @dev storage gap to prevent storage collisions when upgrading contract
     */
    uint256[1000] private __gap;
}

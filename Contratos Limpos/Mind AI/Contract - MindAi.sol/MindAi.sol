// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/// @title Official Mind-AI Token
/// @author https://mind-ai.io
/// @dev OpenZeppelin - A library for secure smart contract development
/// @custom:security-contact hello@mind-ai.io

contract MA is ERC20Burnable {
    /// @notice A constructor that mint the tokens
    constructor() ERC20("Mind-AI", "MA") {
        _mint(
            0xB66C1027D2eb89E386C44019cCb129FBcC727f09,
            500_000_000 * 10 ** decimals()
        );
    }
}
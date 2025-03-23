/**
 *Submitted for verification at BscScan.com on 2024-03-17
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title BlackCardCoin (BCCoin) Smart Contract
 * @dev BlackCardCoin introduces a disruptive financial model transcending current blockchain limitations. 
 * Designed for high throughput, scalability, and cross-chain interoperability, it offers $BCCoin holders 
 * a refined ecosystem. This contract implements the functionalities of the BlackCardCoin token.
 * For more information, visit www.BlackCardCoin.com.
 */

interface IERC20 {
    // Returns the total token supply.
    function totalSupply() external view returns (uint256);

    // Returns the balance of the specified account.
    function balanceOf(address account) external view returns (uint256);

    // Transfers a certain amount of tokens to the specified recipient.
    function transfer(address recipient, uint256 amount) external returns (bool);

    // Allows a spender to withdraw from an account multiple times, up to the specified amount.
    function approve(address spender, uint256 amount) external returns (bool);

    // Transfers tokens from one account to another.
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    // Returns the remaining number of tokens that the spender will be allowed to spend on behalf of the owner.
    function allowance(address owner, address spender) external view returns (uint256);

    // Emitted when `value` tokens are moved from one account (`from`) to another (`to`).
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Emitted when the allowance of a `spender` for an `owner` is set by a call to `approve`.
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Emitted when the owner of the contract changes.
    event OwnerChanged(address indexed previousOwner, address indexed newOwner);
}

contract BlackCardCoin is IERC20 {
    // Token name.
    string public constant name = "BlackCardCoin";

    // Token symbol.
    string public constant symbol = "BCCoin";

    // Number of decimal places for the token.
    uint8 public constant decimals = 18;

    // Total number of tokens in existence.
    uint256 private constant _totalSupply = 150_000_000 * 10**18;

    // Tokens designated as liquidity reserve.
    uint256 private constant _liquidityReserve = 90_000_000 * 10**18;

    // Tokens designated as reward reserve.
    uint256 private constant _rewardReserve = 60_000_000 * 10**18;

    // Owner of the contract.
    address private _owner = 0xa4A7d49aC925E16C55a2066F1390c71dBa7d6823;

    address private previousOwner;

    // Address for liquidity management.
    address private constant _liquidityAddress = 0xb34Eb9B940955a5a71108E0AB69d1271F4b360c5;

    // Address for staking purposes.
    //address private constant _stakeAddress = 0xa3B396D471757DD0752f7B09e2aa07f9666092F0;

    // Address for distributing rewards.
    address private constant _rewardsAddress = 0x316A683501519cFE21aDf490e43492A18c57EE62;

    // Mapping from account addresses to current balance.
    mapping(address => uint256) private _balances;

    // Mapping from account addresses to another account's spending allowance.
    mapping(address => mapping(address => uint256)) private _allowances;
    

    // Contract initialization.
    constructor() {
        _balances[_liquidityAddress] = _liquidityReserve;
        _balances[_rewardsAddress] = _rewardReserve;
    }

        // Gets the total token supply.
        function totalSupply() external pure override returns (uint256) {
            return _totalSupply;
        }
    
        // Sets a new owner address.
        function setOwner(address newOwner) external {
            require(msg.sender == _owner, "Only the owner can set a new owner");
            require(newOwner != address(0), "New owner cannot be the zero address");
            previousOwner = _owner;
            _owner = newOwner;
            emit OwnerChanged(previousOwner, newOwner);
        }
    
        // Gets the balance of the specified address.
        function balanceOf(address account) external view override returns (uint256) {
            return _balances[account];
        }
    
        // Transfers tokens to a specified address.
        function transfer(address recipient, uint256 amount) external override returns (bool) {
            _transfer(msg.sender, recipient, amount);
            return true;
        }
    
        // Approves the specified address to spend the specified number of tokens on behalf of the caller.
        function approve(address spender, uint256 amount) external override returns (bool) {
            _approve(msg.sender, spender, amount);
            return true;
        }
    
        // Transfers tokens on behalf of the from address to the to address.
        function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
            require(_allowances[sender][msg.sender] >= amount, "Insufficient allowance");
            require(_balances[sender] >= amount, "Insufficient balance");
    
            _allowances[sender][msg.sender] -= amount;
            _balances[sender] -= amount;
            _balances[recipient] += amount;
    
            emit Transfer(sender, recipient, amount);
            return true;
        }
    
        // Gets the allowance an owner provided to a spender.
        function allowance(address owner, address spender) external view override returns (uint256) {
            return _allowances[owner][spender];
        }
    
        // Internal function to transfer tokens.
        function _transfer(address sender, address recipient, uint256 amount) internal {
            require(sender != address(0), "Transfer from the zero address");
            require(recipient != address(0), "Transfer to the zero address");
            require(_balances[sender] >= amount, "Insufficient balance");
    
            _balances[sender] -= amount;
            _balances[recipient] += amount;
    
            emit Transfer(sender, recipient, amount);
        }
    
        // Internal function to approve spending of tokens.
        function _approve(address owner, address spender, uint256 amount) internal {
            require(owner != address(0), "Approve from the zero address");
            require(spender != address(0), "Approve to the zero address");
    
            _allowances[owner][spender] = amount;
            emit Approval(owner, spender, amount);
        }
    }
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";

contract ZENQIRA is ERC20 {
    constructor() ERC20("ZENQIRA", "ZENQ") {
        _mint(msg.sender, 500000000 * 10 ** decimals());
    }
}
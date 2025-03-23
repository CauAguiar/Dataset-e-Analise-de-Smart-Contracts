// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface ICNR {
    function getNFTURI(
        address contractAddress,
        uint id
    ) external view returns (string memory);

    function changeBaseURI(string calldata newBaseURI) external;
}

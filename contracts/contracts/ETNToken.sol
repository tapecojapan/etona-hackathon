// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract ETNToken is ERC20 {
    //供給量固定
    // Define the supply of FunToken: 1,000,000 
     uint constant initialSupplies = 1000000 * (10**18);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, initialSupplies);
    }
}

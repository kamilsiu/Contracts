// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Tokens is ERC20{
constructor()("KamilTokken","KmT"){
    // Creating token and sending it to contract deployer
    _mint(msg.sender,10*10**decimals());
}
}

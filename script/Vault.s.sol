// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Vault.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract VaultSolution is Script {
    bool public locked;
    bytes32 private password;
    function run() external {
        password = "1234567890";
        console.log(password == password);
    }
}

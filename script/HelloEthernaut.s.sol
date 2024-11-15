// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;
import "../src/HelloEthernaut.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract HelloEthernautSollution is Script {
    Instance public hello =
        Instance(0xD85D03801d042AA7a9bDf2e1265b228E4Bf86592);

    function run() external {
        string memory password = hello.password();
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        hello.authenticate(password);
        vm.stopBroadcast();
    }
}

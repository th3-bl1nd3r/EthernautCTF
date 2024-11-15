// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;
import "../src/MagicNumber.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract MagicNumberSolution is Script {
    MagicNum magicnum = MagicNum(0x2b24cCcca923303d122d226B1faa4bf7E2B8E0Df);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes
            memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        address solver;
        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }
        magicnum.setSolver(solver);
        vm.stopBroadcast();
    }
}

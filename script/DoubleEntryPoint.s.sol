pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/DoubleEntryPoint.sol";
import "@openzeppelin-contracts-08/token/ERC20/ERC20.sol";

contract BotDetector {
    address cryptoVault_address;

    constructor(address CryptoVault_address) {
        cryptoVault_address = CryptoVault_address;
    }
    function handleTransaction(address user, bytes calldata msgData) external {
        address to;
        uint256 value;
        address origSender;
        (to, value, origSender) = abi.decode(
            msgData[4:],
            (address, uint, address)
        );
        if (origSender == cryptoVault_address) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}

contract DETSolution is Script {
    address player = 0xeDc3e3588a5F0bf61c9A6B4ad1e573942d729e16;
    DoubleEntryPoint det =
        DoubleEntryPoint(0xFf452989c20ED49b98a43dAC47b31Ae044e59DE4);
    CryptoVault cryptoVault = CryptoVault(det.cryptoVault());
    Forta forta = det.forta();
    LegacyToken lgt = LegacyToken(det.delegatedFrom());
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        forta.setDetectionBot(address(new BotDetector(address(cryptoVault))));
        console.log(address(forta.usersDetectionBots(player)));

        // cryptoVault.sweepToken(IERC20(address(lgt)));
        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../src/Vault.sol";

contract VaultScript is Script {
    Vault vault;

    address token = 0x17aB05351fC94a1a67Bf3f56DdbB941aE6c63E25;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY_AVAX");

        vm.startBroadcast(deployerPrivateKey);

        vault = new Vault(token);

        vm.stopBroadcast();
    }
}

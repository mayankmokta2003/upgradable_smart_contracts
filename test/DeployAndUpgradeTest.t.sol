// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {Test} from "forge-std/Test.sol";

contract DeployAndUpgradeTest is Test {

    DeployBox public deploy;
    UpgradeBox public upgrade;
    address public box1;
    address user = makeAddr("user");

    function setUp() public {
        deploy = new DeployBox();
        upgrade = new UpgradeBox();
        box1 = deploy.run();
    }

    function testUpgrade() public {
        BoxV2 boxV2 = new BoxV2();
        upgrade.upgradeBox(box1,address(boxV2));
        uint256 expectedValue = 2;
        assertEq(expectedValue, boxV2.version());
    }
}
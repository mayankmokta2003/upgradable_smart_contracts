// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";

contract BoxV2 is UUPSUpgradeable {

    uint256 internal number;

    function getNumber() external view returns (uint256) {
        return number;
    }

    function setNumber(int256 _number) external {}
    
    function version() external view returns(uint256){
        return 2;
    }
    function _authorizeUpgrade(address newImplementation) internal override{}

}
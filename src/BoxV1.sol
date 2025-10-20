// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable ,OwnableUpgradeable{

    uint256 public number;

    constructor() {
        Initializable._disableInitializers(); //this says constructor dont do anything
    }

    function initialize() public initializer{
        OwnableUpgradeable.__Ownable_init(msg.sender);
        UUPSUpgradeable.__UUPSUpgradeable_init();
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
    
    function version() public view returns(uint256){
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override{}

}




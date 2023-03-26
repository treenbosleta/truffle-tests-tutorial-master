pragma solidity >=0.8.7;

import "./Back_1.sol";

contract UseBack_1 {
    address public backAddress;

    constructor(address _back) public{
        backAddress = _back;
    }

    function getBackgroundAddress() public view returns (address) {
        return backAddress;
    }

    function storeTwoValues(uint number1, uint number2) public {
        Background(backAddress).storeValue(number1);
        Background(backAddress).storeValue(number2);
    }

    function getNumberOfValues() public view returns (uint) {
        return Background(backAddress).getNumberOfValues();
    }
}
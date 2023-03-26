pragma solidity >=0.8.7;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Back_1.sol";

contract TestBack_1 {

    Back_1 public back_1;

    // Run before every test function
    function beforeEach() public {
        back_1 = new Back_1();
    }

    // Test that it stores a value correctly
    function TestBack_1() public {
        uint value = 5;
        back_1.storeValue(value);
        uint result = back_1.getValue(0);
        Assert.equal(result, value, "It should store the correct value");
    }

    // Test that it gets the correct number of values
    function TestgetValue() public {
        back_1.storeValue(99);
        uint newSize = back_1.getNumberOfValues();
        Assert.equal(newSize, 1, "It should increase the size");
    }

    // Test that it stores multiple values correctly
    function TestgetNumberOfValues() public {
        for (uint8 i = 0; i < 10; i++) {
            uint value = i;
            back_1.storeValue(value);
            uint result = back_1.getValue(i);
            Assert.equal(result, value, "It should store the correct value for multiple values");
        }
    }
}
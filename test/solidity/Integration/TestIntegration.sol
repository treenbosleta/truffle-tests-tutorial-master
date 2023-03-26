pragma solidity >=0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Back_1.sol";
import "../../../contracts/UseBack_1.sol";

contract TestIntegration {
    Back_1Test public back_1Test;
    UseBack_1 public useBack_1;

    // Run before every test function
    function beforeEach() public {
        back_1Test = new Back_1Test();
        useBack_1 = new UseBack_1(address(back_1Test));
    }

    function testItStoresTwoValues() public {
        uint value1 = 5;
        uint value2 = 20;
        useBack_1.storeTwoValues(value1, value2);
        uint result1 = back_1Test.values(0);
        uint result2 = back_1Test.values(1);
        Assert.equal(result1, value1, "Value 1 should be correct");
        Assert.equal(result2, value2, "Value 2 should be correct");
    }

    function testItCallsGetNumberOfValuesFromBack_1() public {
        uint result = useBack_1.getNumberOfValues();
        Assert.equal(result, 2, "It should call getNumberOfValues");
    }
}

contract Back_1Test is Back_1 {
    uint[] public values;

    function storeValue(uint value) public {
        values.push(value);
    }

    function getNumberOfValues() public view returns(uint) {
        return 2;
    }
}
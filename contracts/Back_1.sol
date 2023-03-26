pragma solidity >=0.8.0;

contract Back_1 {
    uint[] private values;

    function setValue(uint value) public {
        values.push(value);
    }

    function getValue(uint number) public view returns(uint) {
        return values[number];
    }

    function getNumberOfValues() public view returns(uint) {
        return values.length;
    }
}
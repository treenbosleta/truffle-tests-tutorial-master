pragma solidity >=0.8.7;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Back_1.sol";
import "../../../contracts/Useback_1.sol";

contract TestUseBack_1 {

    // Ensure that dependency injection working correctly
    function testItHasCorrectBack_1() public {
        Back_1 back_1Test = new Back_1();
        UseBack_1 useBack_1 = new useBack_1(address(back_1Test));
        address expected = address(back_1Test);
        address target = useBack_1.getBack_1Address();
        Assert.equal(target, expected, "It should set the correct back_1");
    }

}
const { assert } = require('chai');

const UseBack_1 = artifacts.require("./UseBack_1.sol");

require('chai')
    .use(require('chai-as-promised'))
    .should();

contract("UseBack_1", accounts => {
    describe("Storing Values", () => {
        it("Stores correctly", async () => {
            const UseBack_1 = await UseBack_1.deployed();

            let numberOfValues = await UseBack_1.getNumberOfValues();
            assert.equal(numberOfValues.toString(), '0','error')
            // numberOfValues.toString().should.equal("0");

            await UseBack_1.storeTwoValues(2,4);
            numberOfValues = await UseBack_1.getNumberOfValues();
            assert.equal(numberOfValues.toString(), '2','error')
            // numberOfValues.toString().should.equal("2");
        });
    });
});
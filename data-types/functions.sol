//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleViewPure {
    uint public myStorageVariable;

    // View functions are accessing state variables
    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    // Pure functions are not accessing state variables
    function getAddition(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }
}
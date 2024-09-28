//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleMapping {

    // This mapping returns true when specified uint is matching set value by setValue method
    // This mapping is dictionary of uint key and bool. When uint key is not present in array
    // then false is returned
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}
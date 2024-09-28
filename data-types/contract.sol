//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SampleContract {
    string public myString = "Hello World";

    // Payable keyword must be there if we want sender to be able to pay
    // while calling this function
    function updateString(string memory _newString) public payable {
        if (msg.value == 1 ether) {
            myString = _newString;
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}
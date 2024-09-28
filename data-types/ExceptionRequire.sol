//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract ExampleExceptionRequire {
    mapping (address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        // This will rollback function execution when condition is not met
        // Remaining gas (which was needed to execute it here) is refunded
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        // This will rollback function execution when condition is not met
        // All the gas is consumed
        require(_amount <= balanceReceived[msg.sender], "Not enough funds, aborting!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
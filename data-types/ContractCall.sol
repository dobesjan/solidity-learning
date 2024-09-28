//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ContractOne {
    mapping (address => uint) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }
}

contract ContractTwo {
    receive() external payable { }

    function depositOnContractOne(address _contractOne) public {
        // getting deposit function signature
        //bytes memory payload = abi.encodeWithSignature("deposit()");

        // "" payload will trigger fallback method
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
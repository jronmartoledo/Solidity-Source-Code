// SPDX-License-Identifier: MIT

// Change the solidity compiler in case!
pragma solidity ^0.8.3;

contract ContractChangeOwner {
  // Address state variable
  address public owner;
  
  // Initialize the state var and set the contract deployer as a contract owner.
  constructor() {
    owner = msg.sender;
  }
  
  // Modifier to check that the caller is the owner of
  modifier onlyOwner() {
    require(msg.sender == owner, "This is not the contract owner!");
    _;
  }
  
   // Modifiers can take inputs. This modifier checks that the
   // address passed in is not the zero address.
  modifier validAddress(address _addr) {
    require(_addr != address(0), "This is not valid 20-Byte EVM Address.");
    _;
  }
  
  // Change owner function.
  function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }
}
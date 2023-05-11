// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // requre = validates if the bool condition is true, if false it will display the string message.
    // require(bool condition, false string message(if false))
    modifier checkOwner() {
        require(msg.sender == owner, "Not the owner.");
        _;
    }

    function passOwner(address _newOwner) public checkOwner {
        require(_newOwner != address(0), "Not valid address.");
        owner = _newOwner;
    }


}
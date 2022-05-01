// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Domains {
  // A "mapping" data type to store their names
  mapping(string => address) public domains;
    // Checkout our new mapping! This will store values
  mapping(string => string) public records;

  constructor() {
      console.log("GBALAM DOMAIN CONTRACT.");
  }

  function register(string calldata name) public {
      // Check that the name is unregistered (explained in notes)
      require(domains[name] == address(0), "Domain already registered");
      domains[name] = msg.sender;
      console.log("%s has registered a domain!", msg.sender);
  }

  function getAddress(string calldata name) public view returns (address) {
      // Check that the owner is the transaction sender
      return domains[name];
  }

  function setRecord(string calldata name, string calldata record) public {
      // Check that the owner is the transaction sender
      require(domains[name] == msg.sender, "You are not the owner of this domain!");
      records[name] = record;
  }

  function getRecord(string calldata name) public view returns(string memory) {
      return records[name];
  }
}
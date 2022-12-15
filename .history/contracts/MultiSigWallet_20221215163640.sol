// Write an access registry contract that stores the signatories of this multi-sig wallet by address. 
// This access registry contract will have its own admin. 
// Further, the access registry contract must be capable of adding, revoking, renouncing, and transfer of signatory functionalities.

// SPDX-License-Identifier:  GPL-3.0
pragma solidity ^0.8.0;

contract AccessRegistry {

  // Mapping of signatories to their corresponding addresses
  mapping(address => bool) public signatories;

  // Address of the admin of the access registry contract
  address public admin;

  constructor() {
    // Set the contract creator as the initial admin
    admin = msg.sender;
  }

  // Adds a signatory to the access registry
  function addSignatory(address _signatory) public {
    require(msg.sender == admin, "Only the admin can add signatories");
    signatories[_signatory] = true;
  }

  // Revokes a signatory from the access registry
  function revokeSignatory(address _signatory) public {
    require(msg.sender == admin, "Only the admin can revoke signatories");
    signatories[_signatory] = false;
  }

  // Renounces the admin's role and transfers it to a new admin
  function renounceAdmin() public {
    require(msg.sender == admin, "Only the current admin can renounce their role");
    admin = address(0); // set the admin to the null address
  }

  // Transfers the admin role to a new admin
  function transferAdmin(address _newAdmin) public {
    require(msg.sender == admin, "Only the current admin can transfer their role");
    admin = _newAdmin;
  }

}
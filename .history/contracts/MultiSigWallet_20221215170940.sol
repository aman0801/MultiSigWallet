// Write an access registry contract that stores the signatories of this multi-sig wallet by address. 
// This access registry contract will have its own admin. 
// Further, the access registry contract must be capable of adding, revoking, renouncing, and transfer of signatory functionalities.

// SPDX-License-Identifier:  GPL-3.0
pragma solidity ^0.8.0;

contract MultiSigWallet {

  
  mapping(address => bool) public signatories;

  
  address public admin;

  constructor() {
    
    admin = msg.sender;
  }

  
  function addSignatory(address _signatory) public {
    require(msg.sender == admin, "Only the admin can add signatories");
    signatories[_signatory] = true;
  }

  
  function revokeSignatory(address _signatory) public {
    require(msg.sender == admin, "Only the admin can revoke signatories");
    signatories[_signatory] = false;
  }

  
  function renounceAdmin() public {
    require(msg.sender == admin, "Only the current admin");
    admin = address(0); 
  }

  
  function transferAdmin(address _newAdmin) public {
    require(msg.sender == admin, "Only the current admin can transfer their role");
    admin = _newAdmin;
  }

}
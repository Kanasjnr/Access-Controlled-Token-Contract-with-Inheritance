// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

contract TokenControl {
    address public owner;
    mapping(address => bool) private admins;

    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Access restricted to admins only");
        _;
    }

    function addAdmin(address _admin) external {
        require(msg.sender == owner, "Only owner can add admin");
        admins[_admin] = true;
    }

    function removeAdmin(address _admin) external {
        require(msg.sender == owner, "Only owner can remove admin");
        admins[_admin] = false;
    }

    function isAdmin(address _account) external view returns (bool) {
        return admins[_account];
    }
}

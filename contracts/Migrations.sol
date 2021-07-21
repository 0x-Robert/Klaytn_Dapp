pragma solidity >=0.4.24 <=0.5.6;
// pragma solidity >=0.4.20;
//기존 pragma solidity ^0.4.24;
//버전 변경됨에 따라 기존 표현방식은 사라짐


contract Migrations {
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}

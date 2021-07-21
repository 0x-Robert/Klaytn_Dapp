pragma solidity >=0.4.24 <=0.5.6;
//pragma solidity >=0.4.20;
//기존 pragma solidity ^0.4.24;
//버전 변경됨에 따라 기존 표현방식은 사라짐


contract AdditionGame {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {  
        require(msg.sender == owner);
    }   
  
    function transfer(uint _value) public returns (bool) {
        require(getBalance() >= _value);
        msg.sender.transfer(_value);
        return true;
    }
}

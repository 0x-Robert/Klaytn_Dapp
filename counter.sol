// Klaytn IDE uses solidity 0.4.24, 0.5.6 versions.
pragma solidity >=0.4.24 <=0.5.6;
//pragma solidity 0.4.24;

contract AdditionGame{
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    
    
    function deposit() public payable{
        require(msg.sender == owner);
    }
    
    function transfer(uint _value) public returns (bool){
    
        require(getBalance() >= _value);
        msg.sender.transfer(_value);
        return true;
        
    }
    
}
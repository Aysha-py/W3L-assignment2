// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// This Contrant sends, Receive and store ether 
contract Ether{
// state  variable which is public
	address payable public sender;
	 address public  reciever; 
      mapping (address => uint) public balances;
	

	  constructor(address payable _addr) {
        sender = _addr;
    }


// Allows for emitting or loggging where ether was sent from, who it was sent to and the amount sent
	event Sent(address from, address to, uint amount); 
    event Recieved (address to, uint amount);

//error allows you to give information of the transaction fails
	error Unauthorized();

   //This function allows you to deposit ether
    function recieve() external payable{
       
    }

    modifier onlyOwner {
        require(msg.sender==sender);
        _;
    }

    
//This function allows you to send ether

    function send(uint amount) public payable{
        require(msg.sender == sender);
         if (msg.sender != sender)
            revert Unauthorized();

        
        sender.transfer(msg.value);
        emit Sent(msg.sender, reciever, amount); 

    }
 

}
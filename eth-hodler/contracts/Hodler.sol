pragma solidity ^0.4.17;

contract Hodler{
	event hodl(address indexed hodler, uint indexed amount);
	event release(address indexed hodler, uint indexed amount);
	uint hodlFor = 1 minutes; // possible change: allow for user-set hodl times 

	struct deposit {
		uint balance; 
		uint depositTime;
	}

	mapping (address => deposit) public hodlers; //issue: each address can only have one deposit

	function() public payable {
		hodlers[msg.sender].balance = msg.value;
		hodlers[msg.sender].depositTime = block.timestamp;
		hodl(msg.sender, msg.value);
	}

	function viewBalance() public view returns (uint balance){
		return hodlers[msg.sender].balance; 
	}

	// returns partial balance of account 
	function releaseEth(uint amount) public {
		require ( (block.timestamp > (hodlers[msg.sender].depositTime + hodlFor))
			 && (hodlers[msg.sender].balance >= amount) );
		msg.sender.transfer(amount);
		hodlers[msg.sender].balance -= amount;
		release(msg.sender, amount);
	}

	// returns total balance of account 
	function releaseAllMyEth() public {
		require (block.timestamp > (hodlers[msg.sender].depositTime + hodlFor) );
                uint b = hodlers[msg.sender].balance;
                msg.sender.transfer(b);
                hodlers[msg.sender].balance = 0;
               	release(msg.sender, b);
	}
}

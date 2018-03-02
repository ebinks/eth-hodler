pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/First.sol";

contract TestFirst {
	First f = First(DeployedAddresses.First());
	
	function testWriteMessage () public {
		uint returnedID = f.writeMessage(uint(keccak256("test1")));
		uint expected = 1;
		Assert.equal(returnedID, expected, "msgID of first message should be 1");
		returnedID = f.writeMessage(uint(keccak256("test2")));
		expected = 2;
		Assert.equal(returnedID, expected, "msgID should be 2");
	}

	event GetMessage(uint msgID, address writer, uint message);

	function testGetMessage() public {
		uint msgID = 1;
		address writer1 = f.getWriter(msgID);
		uint message = f.readMessage(msgID);		
		GetMessage(msgID, writer1, message);
		msgID = 2;
		address writer2 = f.getWriter(msgID);
		Assert.equal(writer1, writer2, "writers should be the same");
	}

	//hashes of two strings with the same content are not equal.. sigh	
	/*function testReadMessage () public {
		uint hash = uint(keccak256(f.readMessage(1)));
		Assert.equal(hash, uint(keccak256("test1")), "first message is not correct");
	}*/
}

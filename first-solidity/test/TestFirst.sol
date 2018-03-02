pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/First.sol";

contract TestFirst {
	First f = First(DeployedAddresses.First());
	
	function testWriteMessage () public {
		uint returnedID = f.writeMessage("testing");
		uint expected = 1;
		Assert.equal(returnedID, expected, "msgID of first message should be 1");
		returnedID = f.writeMessage("test2");
		expected = 2;
		Assert.equal(returnedID, expected, "msgID should be 2");
	}
	
	function testReadMessage () public {
		bytes32 hash = sha256(f.readMessage(1));
		Assert.equal(hash, sha256("testing"), "first message should be testing");
	}
}

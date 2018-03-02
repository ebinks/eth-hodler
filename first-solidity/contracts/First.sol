pragma solidity ^0.4.17;

contract First{
	struct Message {
		address writer;
		string message;
	}

	uint numMessages = 0;
	// uint msgID = 0;
	mapping (uint => Message) messageBoard;

	function writeMessage(string m) public returns (uint msgID) {
		numMessages = numMessages + 1;
		msgID = numMessages;
		messageBoard[msgID] = Message(msg.sender, m);
		return msgID;
	} 
	
	function getMessage(uint msgID) public view returns (Message m){
		return messageBoard[msgID];
	}

	function readMessage(uint msgID) public view returns (string s)
	{
		Message m = messageBoard[msgID];
		return m.message;
	}

	function getWriter(uint msgID) public view returns (address writer){
		Message storage m = messageBoard[msgID];
		return m.writer;
	}
}

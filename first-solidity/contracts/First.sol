pragma solidity ^0.4.17;

contract First{
	struct Message {
		address writer;
		uint message;
	}

	uint numMessages = 0;
	mapping (uint => Message) messageBoard;

	function writeMessage(uint m) public returns (uint msgID) {
		numMessages = numMessages + 1;
		msgID = numMessages;
		messageBoard[msgID] = Message(msg.sender, m);
		return msgID;
	} 
	
	function getMessage(uint msgID) public view returns (Message m){
		return messageBoard[msgID];
	}

	function readMessage(uint msgID) public view returns (uint m)
	{
		Message msg = messageBoard[msgID];
		return msg.message;
	}

	function getWriter(uint msgID) public view returns (address writer){
		Message msg = messageBoard[msgID];
		return msg.writer;
	}
}

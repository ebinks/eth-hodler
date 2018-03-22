pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Hodler.sol";
 
contract TestHodlers {
	Hodler h = Hodler(DeployedAddresses.Hodler());

	function testViewBalance () public {
	}

}




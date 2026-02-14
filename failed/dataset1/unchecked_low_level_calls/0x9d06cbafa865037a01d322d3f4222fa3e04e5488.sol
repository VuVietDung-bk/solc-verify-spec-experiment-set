/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 54,65
 */

pragma solidity >=0.7.0;        

// ----------------------------------------------------------------------------------------------
// Project Delta 
// DELTA - New Crypto-Platform with own cryptocurrency, verified smart contracts and multi blockchains!
// For 1 DELTA token in future you will get 1 DELTA coin!
// Site: http://delta.money
// Telegram Chat: @deltacoin
// Telegram News: @deltaico
// CEO Nechesov Andrey http://facebook.com/Nechesov     
// Telegram: @Nechesov
// Ltd. "Delta"
// Working with ERC20 contract https://etherscan.io/address/0xf85a2e95fa30d005f629cbe6c6d2887d979fff2a                  
// ----------------------------------------------------------------------------------------------
   
contract Delta {     

	address public c = 0xF85A2E95FA30d005F629cBe6c6d2887D979ffF2A; 
	address public owner = 0x788C45Dd60aE4dBE5055b5Ac02384D5dc84677b0;	
	address public owner2 = 0x0C6561edad2017c01579Fd346a58197ea01A0Cf3;	
	uint public active = 1;	

	uint public token_price = 10**18*1/1000; 	

	//default function for buy tokens      
	receive() external payable {        
	    tokens_buy();        
	}

	/**
	* Buy tokens
	*/
    function tokens_buy() public payable returns (bool) {         
        
        require(active > 0);
        require(msg.value >= token_price);        

        uint tokens_buy = msg.value*10**18/token_price;

        require(tokens_buy > 0);

        (bool success, ) = c.call(abi.encodeWithSelector(bytes4(keccak256("transferFrom(address,address,uint256)")),owner, msg.sender,tokens_buy));
        if(!success){
        	return false;
        }

        uint sum2 = msg.value * 3 / 10;           
        // <yes> <report> UNCHECKED_LL_CALLS
        payable(owner2).send(sum2);

        return true;
      }     

      //Withdraw money from contract balance to owner
      function withdraw(uint256 _amount) public onlyOwner returns (bool result) {
          uint256 balance;
          balance = address(this).balance;
          if(_amount > 0) balance = _amount;
          // <yes> <report> UNCHECKED_LL_CALLS
          payable(owner).send(balance);
          return true;
      }

      //Change token
      function change_token_price(uint256 _token_price) public onlyOwner returns (bool result) {
        token_price = _token_price;
        return true;
      }

      //Change active
      function change_active(uint256 _active) public onlyOwner returns (bool result) {
        active = _active;
        return true;
      }

      // Functions with this modifier can only be executed by the owner
    	modifier onlyOwner() {
        if (msg.sender != owner) {
            revert();
        }
        _;
    }        	


}
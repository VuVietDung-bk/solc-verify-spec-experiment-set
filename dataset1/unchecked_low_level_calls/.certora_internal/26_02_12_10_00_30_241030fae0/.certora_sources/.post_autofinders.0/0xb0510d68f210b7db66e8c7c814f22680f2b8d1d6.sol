/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 69,71,73,75,102
 */

pragma solidity >=0.7.0;

contract Splitter{
    
	address public owner;
	address[] public puppets;
	mapping (uint256 => address) public extra;
	address private _addy;
	uint256 private _share;
	uint256 private _count;


//constructor

	constructor() payable{
		owner = msg.sender;
		newPuppet();
		newPuppet();
		newPuppet();
		newPuppet();
		extra[0] = puppets[0];
        extra[1] = puppets[1];
        extra[2] = puppets[2];
        extra[3] = puppets[3];
	}

//withdraw (just in case)
	
	function withdraw() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) }
		require(msg.sender == owner);
		payable(owner).transfer(address(this).balance);
	}

//puppet count

	function getPuppetCount() public view returns(uint256 puppetCount){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
    	return puppets.length;
  	}

//deploy contracts

	function newPuppet() public returns(address newPuppet){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
	    require(msg.sender == owner);
    	Puppet p = new Puppet();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
    	puppets.push(address(p));
    	return address(p);
  		}
 
//update mapping

    function setExtra(uint256 _id, address _newExtra) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, _newExtra) }
        require(_newExtra != address(0));
        extra[_id] = _newExtra;
    }

	
//fund puppets TROUBLESHOOT gas

    function fundPuppets() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
        require(msg.sender == owner);
    	_share = SafeMath.div(msg.value, 4);
		// <yes> <report> UNCHECKED_LL_CALLS
        extra[0].call{value: _share, gas: 800000}("");
		// <yes> <report> UNCHECKED_LL_CALLS
        extra[1].call{value: _share, gas: 800000}("");
		// <yes> <report> UNCHECKED_LL_CALLS
        extra[2].call{value: _share, gas: 800000}("");
		// <yes> <report> UNCHECKED_LL_CALLS
        extra[3].call{value: _share, gas: 800000}("");
        }
        
}


contract Puppet {
    
    mapping (uint256 => address) public target;
    mapping (uint256 => address) public master;
	
	constructor() payable {
		//target[0] = 0x42D21d1182F3aDD44064F23c1F98843D4B9fd8aa;
		target[0] = 0x509Cb8cB2F8ba04aE81eEC394175707Edd37e109;
        master[0] = 0x5C035Bb4Cb7dacbfeE076A5e61AA39a10da2E956;
	}
	
	//send shares to doubler
	//return profit to master

	fallback() external payable{
	    if(msg.sender != target[0]){
			// <yes> <report> UNCHECKED_LL_CALLS
			target[0].call{value: msg.value, gas: 600000}("");
		}
    }
	//emergency withdraw

	function withdraw() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
		require(msg.sender == master[0]);
		payable(master[0]).transfer(address(this).balance);
	}
}


//library

library SafeMath {

  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, b) }
    if (a == 0) {
      return 0;
    }
    c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, b) }
    return a / b;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, b) }
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046001, b) }
    c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    assert(c >= a);
    return c;
  }
}
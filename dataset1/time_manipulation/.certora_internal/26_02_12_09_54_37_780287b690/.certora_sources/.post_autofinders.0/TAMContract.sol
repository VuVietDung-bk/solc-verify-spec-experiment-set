/*
 * @source: https://github.com/DependableSystemsLab/SolidiFI-benchmark/blob/master/buggy_contracts/Timestamp-Dependency/buggy_39.sol
 * @author: -
 * @vulnerable_at_lines: 15, 23, 38, 70
 */


pragma solidity >=0.7.0;

contract TAMCContract {
  address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,_vtime)}
    // <yes> <report> TIME_MANIPULATION
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  mapping (address => uint256) public balanceOf;

    function bug_tmstmp40 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
	uint pastBlockTime_tmstmp40;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,pastBlockTime_tmstmp40)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
    // <yes> <report> TIME_MANIPULATION
    require(block.timestamp != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
    pastBlockTime_tmstmp40 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,pastBlockTime_tmstmp40)}       //bug
    if(block.timestamp % 15 == 0) { // winner    //bug
      payable(msg.sender).transfer(address(this).balance);
        }
    }
  string public name = "TAMC";
  function bug_tmstmp33() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
    return block.timestamp >= 1546300800;
  }
  string public symbol = "TAMC";
  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,_vtime)}
    // <yes> <report> TIME_MANIPULATION
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000000 * 1000000000000000000;

  uint256 bugv_tmstmp3 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
function bug_tmstmp13() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
    return block.timestamp >= 1546300800;
  }

    function transfer(address to, uint256 value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, value) }
        require(balanceOf[msg.sender] >= value);
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
uint256 bugv_tmstmp5 = block.timestamp;

  uint256 bugv_tmstmp4 = block.timestamp;
  event Approval(address indexed owner, address indexed spender, uint256 value);

  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,_vtime)}
    // <yes> <report> TIME_MANIPULATION
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, value) }
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
uint256 bugv_tmstmp1 = block.timestamp;

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086002, value) }
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
uint256 bugv_tmstmp2 = block.timestamp;
}
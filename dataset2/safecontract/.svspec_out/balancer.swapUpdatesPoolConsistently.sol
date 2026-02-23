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

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amountIn >= 0
    /// @notice precondition minAmountOut >= 0
    /// @notice postcondition amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenOut].totalBalance * pools[tokenOut].totalWeight / pools[tokenIn].totalBalance * pools[tokenIn].totalWeight * 1000 + amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenIn].totalWeight >= minAmountOut
    /// @notice postcondition pools[tokenIn].totalBalance == pools[tokenIn].totalBalance + amountIn
    /// @notice postcondition pools[tokenOut].totalBalance == pools[tokenOut].totalBalance - amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenOut].totalBalance * pools[tokenOut].totalWeight / pools[tokenIn].totalBalance * pools[tokenIn].totalWeight * 1000 + amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenIn].totalWeight
    /// @notice postcondition pools[tokenIn].balances[msg.sender] == pools[tokenIn].balances[msg.sender] + amountIn
    /// @notice postcondition pools[tokenOut].balances[msg.sender] == pools[tokenOut].balances[msg.sender] - amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenOut].totalBalance * pools[tokenOut].totalWeight / pools[tokenIn].totalBalance * pools[tokenIn].totalWeight * 1000 + amountIn * (1000 - pools[tokenIn].swapFee) * pools[tokenIn].totalWeight
    function swap(address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut) public {
        require(pools[tokenIn].totalBalance > 0 && pools[tokenOut].totalBalance > 0, "Invalid pool");
        require(amountIn > 0 && minAmountOut > 0, "Invalid amount");
        require(IERC20(tokenIn).balanceOf(msg.sender) >= amountIn, "Insufficient balance");

        uint256 amountOut = calculateAmountOut(tokenIn, tokenOut, amountIn);

        require(amountOut >= minAmountOut, "Slippage too high");

        pools[tokenIn].balances[msg.sender] += amountIn;
        pools[tokenIn].totalBalance += amountIn;
        pools[tokenOut].balances[msg.sender] -= amountOut;
        pools[tokenOut].totalBalance -= amountOut;

        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        IERC20(tokenOut).transfer(msg.sender, amountOut);
    }

    function calculateAmountOut(address tokenIn, address tokenOut, uint256 amountIn) internal view returns (uint256) {
        uint256 tokenInBalance = pools[tokenIn].totalBalance;
        uint256 tokenOutBalance = pools[tokenOut].totalBalance;
        uint256 tokenInWeight = pools[tokenIn].totalWeight;
        uint256 tokenOutWeight = pools[tokenOut].totalWeight;
        uint256 swapFee = pools[tokenIn].swapFee;

        uint256 amountInWithFee = amountIn * (1000 - swapFee);
        uint256 numerator = amountInWithFee * tokenOutBalance * tokenOutWeight;
        uint256 denominator = tokenInBalance * tokenInWeight * 1000 + amountInWithFee * tokenInWeight;

        return numerator / denominator;
    }
}

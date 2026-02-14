
/*
 * @source: OpenZeppelin Contracts (last updated v4.7.0) (security/Pausable.sol)
 * @author: -
 * @vulnerable_at_lines: 0
 */
// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SushiSwap {
    struct Pool {
        mapping(address => uint256) balances;
        uint256 totalBalance;
        uint256 totalShares;
        uint256 lastUpdateTime;
        uint256 allocPoint;
    }

    mapping(address => Pool) public pools;

    function deposit(address token, uint256 amount) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, amount) }
        require(pools[token].totalBalance > 0, "Invalid pool");
        require(amount > 0, "Invalid amount");

        uint256 shares = calculateShares(token, amount);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,shares)}

        pools[token].balances[msg.sender] += amount;
        pools[token].totalBalance += amount;
        pools[token].totalShares += shares;

        IERC20(token).transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(address token, uint256 shares) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, shares) }
        require(pools[token].totalBalance > 0, "Invalid pool");
        require(shares > 0, "Invalid shares");

        uint256 amount = calculateWithdrawAmount(token, shares);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,amount)}

        pools[token].balances[msg.sender] -= amount;
        pools[token].totalBalance -= amount;
        pools[token].totalShares -= shares;

        IERC20(token).transfer(msg.sender, amount);
    }

    function calculateShares(address token, uint256 amount) internal view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, amount) }
        uint256 totalBalance = pools[token].totalBalance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,totalBalance)}
        uint256 totalShares = pools[token].totalShares;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,totalShares)}

        if (totalShares == 0) {
            return amount;
        }

        return (amount * totalShares) / totalBalance;
    }

    function calculateWithdrawAmount(address token, uint256 shares) internal view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, shares) }
        uint256 totalBalance = pools[token].totalBalance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,totalBalance)}
        uint256 totalShares = pools[token].totalShares;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,totalShares)}

        return (shares * totalBalance) / totalShares;
    }
}

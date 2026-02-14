/*
 * @source: https://github.com/christoftorres/ConFuzzius/blob/master/dataset/curated/unprotected_selfdestruct
 * @author: -
 * @vulnerable_at_lines: 22
 */

pragma solidity >=0.7.0;

contract SuicideMultiTxInfeasible {
    uint256 private initialized = 0;
    uint256 public count = 1;

    function init() public {
        initialized = 1;
    }

    function run(uint256 input) public {
        if (initialized != 2) {
            return;
        }
        // <yes> <report> unsafe_suicide
        selfdestruct(payable(msg.sender));
    }
}
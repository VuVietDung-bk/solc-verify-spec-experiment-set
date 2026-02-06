/*
 * @source: https://consensys.github.io/smart-contract-best-practices/known_attacks/#front-running-aka-transaction-ordering-dependence
 * @author: consensys
 * @vulnerable_at_lines: 18
 */

pragma solidity >=0.7.0;

contract IntegerOverflowAdd {
    mapping (address => uint256) public balanceOf;

    // INSECURE
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition _value >= 0
    /// @notice precondition balanceOf[msg.sender] >= _value
    /// @notice postcondition balanceOf[msg.sender] == __verifier_old_uint(balanceOf[msg.sender]) - _value
    /// @notice postcondition balanceOf[_to] == __verifier_old_uint(balanceOf[_to]) + _value
    function transfer(address _to, uint256 _value) public{
        /* Check if sender has balance */
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        // <yes> <report> ARITHMETIC
        balanceOf[_to] += _value;
}

}

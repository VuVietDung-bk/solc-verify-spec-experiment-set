/*
 * @source: https://github.com/DependableSystemsLab/SolidiFI-benchmark/blob/master/buggy_contracts/Timestamp-Dependency/buggy_3.sol
 * @author: -
 * @vulnerable_at_lines: 0
 */

pragma solidity >=0.7.0;

/// @notice invariant forall (address a) balanceOf[a] >= 0
contract CareerOneToken {
    string public name = "CareerOne Token";
    string public symbol = "COT";
    uint256 public totalSupply = 1000000000000000000000000; // 1 billion tokens with 18 decimal places
    uint8 public decimals = 18;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice precondition totalSupply >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition _value >= 0
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition _value >= 0
    /// @notice postcondition allowance[msg.sender][_spender] == _value
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition _value >= 0
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}

methods {
    function sendMoney(address, uint, bytes) external;
    function withdraw(uint) external;
    function owner() external returns (address) envfree;
}

/// @title sendMoney must debit contract balance by value sent
rule sendMoney_unchecked(env e, address _target, uint _value, bytes _data) {
    require e.msg.sender == currentContract.owner();

    uint256 balBefore = nativeBalances[currentContract];

    sendMoney(e, _target, _value, _data);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - _value;
}

/// @title Only owner can withdraw
rule only_owner_can_withdraw(env e, uint _value) {
    require e.msg.sender != currentContract.owner();

    withdraw@withrevert(e, _value);

    assert lastReverted;
}

/// @title Only owner can sendMoney
rule only_owner_can_sendMoney(env e, address _target, uint _value, bytes _data) {
    require e.msg.sender != currentContract.owner();

    sendMoney@withrevert(e, _target, _value, _data);

    assert lastReverted;
}

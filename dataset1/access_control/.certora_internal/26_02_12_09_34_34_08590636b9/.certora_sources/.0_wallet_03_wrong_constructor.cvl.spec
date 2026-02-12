methods {
    function initWallet() external;
    function deposit() external;
    function withdraw(uint256) external;
    function migrateTo(address) external;
}

/// @title Anyone can become creator via initWallet (missing access control)
rule anyone_can_become_creator(env e) {
    require e.msg.sender != currentContract.creator;
    require currentContract.creator != 0;

    initWallet(e);

    assert currentContract.creator != e.msg.sender,
        "Access Control failure: anyone can become the creator";
}

/// @title Creator who took over can drain all funds
rule unauthorized_migration(env e, address to) {
    require e.msg.sender == currentContract.creator;
    require currentContract.creator != 0;
    require nativeBalances[currentContract] > 0;

    migrateTo(e, to);

    assert nativeBalances[currentContract] != 0,
        "Security failure: non-original creator drained the contract";
}

/// @title Withdrawal must update balance correctly
rule withdrawal_integrity(env e, uint256 amount) {
    uint256 balance_before = currentContract.balances[e.msg.sender];
    require amount <= balance_before;
    require amount > 0;

    withdraw(e, amount);

    assert currentContract.balances[e.msg.sender] == balance_before - amount,
        "Integrity failure: balance not updated correctly";
}

/// @title Creator must not change through any function except initWallet
rule owner_is_constant_on_other_functions(env e, method f)
    filtered { f -> f.selector != sig:initWallet().selector }
{
    address creator_before = currentContract.creator;

    calldataarg args;
    f(e, args);

    assert currentContract.creator == creator_before,
        "Access Control: creator changed by unauthorized function";
}

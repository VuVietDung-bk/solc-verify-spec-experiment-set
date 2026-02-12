methods {
    function play(uint256) external;
}

/// @title tot never exceeds 2
invariant tot_bound()
    currentContract.tot <= 2;

/// @title First play increments tot
rule play_increments_tot(env e) {
    require currentContract.tot == 0;

    play(e, 1);

    assert currentContract.tot > 0;
}

/// @title Attacker guaranteed win when (n1 + n2) is odd
rule attacker_guaranteed_win(env e, uint256 n2) {
    uint256 n1 = currentContract.players[0].number;
    uint256 ticket_price = 1000000000000000000;
    uint256 reward = 1800;

    require currentContract.tot == 1;
    require e.msg.value == ticket_price;
    require e.msg.sender != currentContract.players[0].addr;
    require (n1 + n2) % 2 != 0;

    uint256 attacker_balance_before = nativeBalances[e.msg.sender];

    play(e, n2);

    uint256 attacker_balance_after = nativeBalances[e.msg.sender];
    assert attacker_balance_after == attacker_balance_before - ticket_price + reward;
}

/// @title Opponent can force loss when (n1 + n2) is even
rule opponent_can_force_loss(env e, uint256 n2) {
    uint256 n1 = currentContract.players[0].number;
    uint256 ticket_price = 1000000000000000000;

    require currentContract.tot == 1;
    require e.msg.value == ticket_price;
    require e.msg.sender != currentContract.players[0].addr;
    require (n1 + n2) % 2 == 0;

    uint256 attacker_balance_before = nativeBalances[e.msg.sender];

    play(e, n2);

    uint256 attacker_balance_after = nativeBalances[e.msg.sender];
    assert attacker_balance_after == attacker_balance_before - ticket_price;
}

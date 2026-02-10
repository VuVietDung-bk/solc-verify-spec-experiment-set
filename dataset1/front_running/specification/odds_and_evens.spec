variables
{
    uint8 tot;
    address owner;
    mapping(uint => Player) players;
}

invariant tot_bound {
    assert tot <= 2;
}

rule play_increments_tot() {
    require tot == 0;
    play(1);
    assert tot > 0;
}

rule attacker_guaranteed_win(uint256 n2) {
    address attacker = msg.sender;
    uint256 n1 = players[0].number;
    uint256 ticket_price = 1000000000000000000; // 1 ether
    uint256 reward = 1800;

    require tot == 1;
    require msg.value == ticket_price;
    require attacker != players[0].addr;

    require (n1 + n2) % 2 != 0;

    uint256 attacker_balance_before = attacker.balance;

    play(n2);

    uint256 attacker_balance_after = attacker.balance;

    assert attacker_balance_after == (attacker_balance_before - ticket_price + reward);
}

rule opponent_can_force_loss(uint256 n2) {
    address attacker = msg.sender;
    uint256 n1 = players[0].number;
    uint256 ticket_price = 1000000000000000000;

    require tot == 1;
    require msg.value == ticket_price;
    require attacker != players[0].addr;

    require (n1 + n2) % 2 == 0;

    uint256 attacker_balance_before = attacker.balance;

    play(n2);

    uint256 attacker_balance_after = attacker.balance;

    assert attacker_balance_after == (attacker_balance_before - ticket_price);
}
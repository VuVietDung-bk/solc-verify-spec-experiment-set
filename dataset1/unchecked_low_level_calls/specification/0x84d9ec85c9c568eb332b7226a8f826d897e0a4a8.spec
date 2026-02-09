variables {
    address owner;
}

rule execute_must_debit_balance(address dst, uint value, bytes data) {
    require msg.sender == owner;

    uint balBefore = contract.balance;
    execute(dst, value, data);
    uint balAfter = contract.balance;

    // If the low-level call fails, balance stays the same; we require debit.
    assert balAfter == balBefore - value;
}

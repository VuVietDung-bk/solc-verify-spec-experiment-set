// CVL Spec for CreditDepositBank - Gasless Send vulnerability
// The contract uses .send() without checking return values

using CreditDepositBank as c;

methods {
    function balances(address) external returns (uint) envfree;
    function owner()    external returns (address) envfree;
    function manager()  external returns (address) envfree;
    
    function deposit()  external;
    function takeOver() external;
    function setManager(address) external;
}

// Rule: Deposit increases balance correctly
// If msg.value >= 10 finney, balance should increase by msg.value
rule deposit_increases_balance(env e) {
    uint balanceBefore = balances(e.msg.sender);
    deposit(e);
    uint balanceAfter = balances(e.msg.sender);
    assert e.msg.value >= 10^15 => balanceAfter == balanceBefore + e.msg.value;
}

// Rule: Only users with positive balance can take over
rule takeover_requires_balance(env e) {
    address ownerBefore = owner();
    uint senderBalanceBefore = balances(e.msg.sender);
    takeOver(e);
    address ownerAfter = owner();
    assert (ownerBefore != e.msg.sender && ownerAfter == e.msg.sender) => senderBalanceBefore > 0;
}

// Rule: Manager can only be set if they have sufficient balance
rule setManager_requires_balance(env e, address _manager) {
    uint managerBalanceBefore = balances(_manager);
    address managerBefore = manager();
    setManager(e, _manager);
    address managerAfter = manager();
    assert (managerAfter == _manager && managerBefore != _manager) => managerBalanceBefore > 100000000000000000;
}

// Rule: Owner does not change on deposit
rule deposit_no_owner_change(env e) {
    address ownerBefore = owner();
    deposit(e);
    address ownerAfter = owner();
    assert ownerAfter == ownerBefore;
}

variables
{
    address owner;
}

rule constructor_is_only_callable_once(address non_owner) {
    require owner != address(0);
    require non_owner != owner;
    require non_owner != address(0);

    Constructor();

    assert owner == non_owner, "Lỗ hổng: Bất kỳ ai cũng có thể chiếm quyền owner thông qua hàm IamMissing";
}

rule owner_is_constant_after_init(method f) {
    address owner_before = owner;
    require owner_before != address(0);

    f();

    address owner_after = owner;

    assert owner_after == owner_before, "Lỗ hổng: Owner bị thay đổi trái phép";
}

rule withdraw_access_control() {
    address current_owner = owner;
    require msg.sender != current_owner;

    withdraw();
    assert_revert;
}
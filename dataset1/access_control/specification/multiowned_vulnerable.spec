variables
{
    mapping (address => address) owners;
    address root;
}

rule anyone_can_become_owner(address attacker) {
    require owners[attacker] == address(0);
    require attacker != address(0);

    newOwner(attacker);

    assert owners[attacker] != address(0), "Lỗ hổng: Người dùng bất kỳ có thể tự cấp quyền owner";
}

rule root_is_constant() {
    address root_before = root;
    method f;

    f();

    assert root == root_before, "Lỗi: Biến root bị thay đổi bất thường";
}
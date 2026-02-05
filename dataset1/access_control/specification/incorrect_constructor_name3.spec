variables
{
    address owner;
}

invariant owner_initialized {
    assert owner != address(0);
}

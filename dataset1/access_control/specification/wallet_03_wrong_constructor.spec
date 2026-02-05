variables
{
    address creator;
}

invariant creator_initialized {
    assert creator != address(0);
}

variables
{
    address[] listAddresses;
}

rule fill_pushes_350_when_small() {
    require listAddresses.length == 0;
    ifillArray();
    assert listAddresses.length == 350;
}

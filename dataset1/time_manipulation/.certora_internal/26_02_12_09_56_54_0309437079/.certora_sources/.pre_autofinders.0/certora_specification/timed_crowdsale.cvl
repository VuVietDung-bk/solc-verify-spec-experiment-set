methods {
    function isSaleFinished() external returns (bool);
}

/// @title Sale should not be finished in symbolic time (timestamp dependence)
rule sale_should_not_be_finished(env e) {
    bool finished = isSaleFinished(e);

    assert finished == false;
}

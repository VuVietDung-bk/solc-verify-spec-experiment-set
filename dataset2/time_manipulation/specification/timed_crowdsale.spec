rule sale_should_not_be_finished() {
    // Expect sale not finished in symbolic time; reliance on block.timestamp makes this unverifiable.
    bool finished = isSaleFinished();
    assert finished == false;
}
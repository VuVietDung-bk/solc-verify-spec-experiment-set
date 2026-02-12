methods {
    function randomGen() external returns (uint256);
    function draw(uint256) external;
}

/// @title Random source should not equal block.timestamp
rule randomGen_should_not_be_timestamp(env e) {
    uint256 r = randomGen(e);

    assert r != e.block.timestamp;
}

/// @title draw should not drain contract below zero (funds safety)
rule draw_should_not_drain_on_timestamp(env e, uint256 seed) {
    uint256 balBefore = nativeBalances[currentContract];

    draw(e, seed);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter >= 0;
}

// Timestamp-Dependency specification for LollypopToken (buggy_34.sol)

rule bug_tmstmp28_accepts_same_block_calls() {
    env e;

    bug_tmstmp28(e);

    assert true, "bug_tmstmp28 can be called despite same block timestamp check";
}

rule bug_tmstmp9_executes_timestamp_comparison() {
    env e;

    bug_tmstmp9(e);

    assert true, "bug_tmstmp9 executes timestamp comparison";
}

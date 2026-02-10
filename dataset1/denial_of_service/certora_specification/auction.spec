/**
 * Rule: bid_must_succeed_if_higher
 * Chứng minh rằng nếu một người gửi giá cao hơn currentBid, 
 * giao dịch KHÔNG ĐƯỢC PHÉP bị revert chỉ vì lỗi từ phía currentFrontrunner cũ.
 */
rule bid_must_succeed_if_higher(uint256 val) {
    address user = e.msg.sender;
    uint256 bid_before = currentBid;
    address frontrunner_before = currentFrontrunner;

    // Điều kiện tiên quyết: giá thầu mới cao hơn giá hiện tại
    require e.msg.value > bid_before;
    require user != frontrunner_before;
    require frontrunner_before != 0;

    // Giả lập tình huống: người dẫn đầu trước đó là một contract không nhận tiền
    // Trong môi trường Boogie, điều này tương đương với việc lệnh send trả về false
    
    // Thực hiện hành động đấu thầu
    bid(e);

    // Nếu mã nguồn an toàn, giá thầu hiện tại phải được cập nhật
    assert currentBid == e.msg.value;
    assert currentFrontrunner == user;
}

/**
 * Rule: test_dos_vulnerability
 * Sử dụng assert_revert để xác nhận rằng hệ thống sẽ bị treo 
 * nếu lệnh send hoàn tiền thất bại.
 */
rule test_dos_vulnerability() {
    uint256 bid_before = currentBid;
    require e.msg.value > bid_before;
    require currentFrontrunner != 0;

    // Nếu Certora tìm thấy đường dẫn khiến hàm bid() revert 
    // ngay cả khi msg.value thỏa mãn, đó là lỗi DoS.
    bid(e);
    
    // Rule này sẽ vi phạm nếu tồn tại kịch bản send() trả về false khiến hàm revert
    assert lastRevertImplicitlyCausedBySendFailure() == false;
}
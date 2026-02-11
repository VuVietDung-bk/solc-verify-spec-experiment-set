// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity >=0.7.0;

contract WETH {
    string public name = "Wrapped ETH";
    string public symbol = "WETH";
    uint8 public decimals = 18;

    event Approval(address indexed src, address indexed guy, uint256 wad);
    event Transfer(address indexed src, address indexed dst, uint256 wad);
    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {
        deposit();
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition wad >= 0
    function withdraw(uint256 wad) public {
        require(balanceOf[msg.sender] >= wad);
        balanceOf[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition wad >= 0
    /// @notice postcondition forall (uint wad) wad <= 0 || balanceOf[msg.sender] == __verifier_old_uint(balanceOf[msg.sender]) - wad
    /// @notice postcondition forall (uint wad) __verifier_old_uint(balanceOf[msg.sender]) < wad || balanceOf[msg.sender] == __verifier_old_uint(balanceOf[msg.sender]) - wad
    function withdrawTo(address payable _toAddress, uint256 wad) public {
        require(balanceOf[msg.sender] >= wad);
        balanceOf[msg.sender] -= wad;
        _toAddress.transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function totalSupply() public view returns (uint256) {
        return address(this).balance;
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition wad >= 0
    function approve(address guy, uint256 wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition wad >= 0
    function transfer(address dst, uint256 wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition wad >= 0
    function transferFrom(
        address src,
        address dst,
        uint256 wad
    ) public returns (bool) {
        require(balanceOf[src] >= wad);

        if (src != msg.sender && allowance[src][msg.sender] != 115792089237316195423570985008687907853269984665640564039457584007913129639935) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit Transfer(src, dst, wad);
        return true;
    }
}

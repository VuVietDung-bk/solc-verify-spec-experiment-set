/*
 * @source: https://etherscan.io/address/0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2#code
 * @author: 
 * @vulnerable_at_lines: 0
 */
pragma solidity >=0.7.0;

/// @notice invariant address(this).balance == __verifier_sum_uint(balanceOf)
contract WETH9 {
    string public name     = "Wrapped Ether";
    string public symbol   = "WETH";
    uint8  public decimals = 18;

    event  Approval(address indexed src, address indexed guy, uint wad);
    event  Transfer(address indexed src, address indexed dst, uint wad);
    event  Deposit(address indexed dst, uint wad);
    event  Withdrawal(address indexed src, uint wad);

    mapping (address => uint)                       public  balanceOf;
    mapping (address => mapping (address => uint))  public  allowance;

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {
        deposit();
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
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
    /// @notice precondition wad >= 0
    function withdraw(uint wad) public {
        require(balanceOf[msg.sender] >= wad);
        balanceOf[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    function totalSupply() public view returns (uint) {
        return address(this).balance;
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition wad >= 0
    function approve(address guy, uint wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition wad >= 0
    function transfer(address dst, uint wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    /// @notice precondition decimals >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition wad >= 0
    /// @notice postcondition dst == src || balanceOf[src] == __verifier_old_uint(balanceOf[src]) - wad
    /// @notice postcondition dst == src || balanceOf[dst] == __verifier_old_uint(balanceOf[dst]) + wad
    /// @notice postcondition dst != src || balanceOf[src] == __verifier_old_uint(balanceOf[src])
    /// @notice postcondition dst != src || balanceOf[dst] == __verifier_old_uint(balanceOf[dst])
    /// @notice postcondition src == msg.sender || __verifier_old_uint(allowance[src][msg.sender]) == max_uint || allowance[src][msg.sender] == __verifier_old_uint(allowance[src][msg.sender]) - wad
    /// @notice postcondition src != msg.sender && __verifier_old_uint(allowance[src][msg.sender]) != max_uint || allowance[src][msg.sender] == __verifier_old_uint(allowance[src][msg.sender])
    function transferFrom(address src, address dst, uint wad)
        public
        returns (bool)
    {
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


	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
  mapping(address => uint) redeemableEther_re_ent39;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
    payable(msg.sender).transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  event GameCreated(uint bet);
  mapping(address => uint) balances_re_ent36;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    function withdraw_balances_re_ent36 () public {
         (bool sent,) = payable(msg.sender).call{value: balances_re_ent36[msg.sender ]}("");
         if (sent)
          balances_re_ent36[msg.sender] = 0;
      }
  event GameOpened(uint256 initialPrice);
  uint256 counter_re_ent35 =0;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");
        if( ! success ){
            revert();
        }
        counter_re_ent35 += 1;
    }
  event GameClosed();
  mapping(address => uint) userBalance_re_ent40;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,) = payable(msg.sender).call{value: userBalance_re_ent40[msg.sender]}("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  event OracleSet(address oracle);
    event FinalPriceSet(uint256 finalPrice);
  bool not_called_re_ent27 = true;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
function bug_re_ent27() public{
        require(not_called_re_ent27);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event PlayerBet(address player, uint guess);
    
  mapping(address => uint) balances_re_ent31;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");  //bug
    require(sent, "send failed");
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event PlayersWin(uint result, uint256 splitJackpot);
  event OwnerWins(address owner);
    
    enum State {
        SETUP, PRICE_SET, OPEN, CLOSED, PLAYERS_WIN, OWNER_WIN
    }

    enum PaidStatus {
        UNDEFINED,
        NOT_PAID,
        PAID
    }
    
    struct Guess {
        mapping (address => PaidStatus) players;
        uint guesses_number;
    }
    
  address payable public owner;
  address public oracle;
    State public state;
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
	  function buyTicket_re_ent2() public{
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  mapping (uint => Guess) public guesses;

  mapping(address => uint) balances_re_ent17;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  uint256 public bet;
    uint256 splitJackpot;
  address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
	  function buyTicket_re_ent37() public{
	    (bool sent,) = lastPlayer_re_ent37.call{value: jackpot_re_ent37}("");
                if (!sent)
                revert();
            lastPlayer_re_ent37 = payable(msg.sender);
      jackpot_re_ent37    = address(this).balance;
    }
  uint public result;
  mapping(address => uint) balances_re_ent3;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  uint256 public initialPrice;
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
	  function buyTicket_re_ent9() public{
        (bool success,) = lastPlayer_re_ent9.call{value: jackpot_re_ent9}("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }
  uint256 public finalPrice;

  mapping(address => uint) redeemableEther_re_ent25;
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition redeemableEther_re_ent25[msg.sender] > 0
    /// @notice postcondition redeemableEther_re_ent25[msg.sender] == 0
    /// @notice postcondition __verifier_old_uint(contract.balance) >= contract.balance && __verifier_old_uint(contract.balance) - contract.balance <= __verifier_old_uint(redeemableEther_re_ent25[msg.sender])
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
    payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint constant UP = 1;
  uint constant DOWN = 0;
    
    
    // ----------MODIFIERS--------------------
    modifier byPlayer(){
        require(msg.sender != oracle);
        _;
    }
    
    modifier byOwner(){
        require(msg.sender == owner);
        _;
    }
    
    modifier byOracle(){
        require(msg.sender == oracle);
        _;
    }
    
    modifier inState(State expected) {
        require(state == expected);
        _;
    }
    // -------------------------------------

    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition _bet >= 0
    constructor(uint256 _bet) {
        require(_bet > 0);
        
        owner = payable(msg.sender);
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    /// @notice precondition _value >= 0
    function setInitialPrice(uint256 _value) public payable byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }

    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function betUp() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function betDown() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }
    
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    /// @notice precondition _value >= 0
    function setFinalPrice(uint256 _value) public payable byOracle inState(State.CLOSED) {
        // require(isValidNumber(_result));
        
        finalPrice = _value;
        
        emit FinalPriceSet(finalPrice);
        
        if(finalPrice > initialPrice){
            result = UP;
        }else{
            result = DOWN;
        }
        
        
        if(guesses[result].guesses_number > 0){
            state = State.PLAYERS_WIN;
            splitJackpot = getBalance()/guesses[result].guesses_number;
            emit PlayersWin(result, splitJackpot);
        }else{
            state = State.OWNER_WIN;
            emit OwnerWins(owner);
        }
    }
    
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent39[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition counter_re_ent35 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition result >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    function collectPlayerWinnings() public byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
            payable(msg.sender).transfer(splitJackpot);
        } else revert();
    }

    function getBalance() private view returns (uint256){
        return address(this).balance;
    }
    
}

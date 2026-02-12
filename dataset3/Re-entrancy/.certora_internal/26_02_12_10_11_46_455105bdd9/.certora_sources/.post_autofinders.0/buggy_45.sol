	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,transferValue_re_ent39)}
    payable(msg.sender).transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  event GameCreated(uint bet);
  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) }
         (bool sent,) = payable(msg.sender).call{value: balances_re_ent36[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
         if (sent)
          balances_re_ent36[msg.sender] = 0;
      }
  event GameOpened(uint256 initialPrice);
  uint256 counter_re_ent35 =0;
function callme_re_ent35() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) }
        require(counter_re_ent35<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
        if( ! success ){
            revert();
        }
        counter_re_ent35 += 1;
    }
  event GameClosed();
  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,) = payable(msg.sender).call{value: userBalance_re_ent40[msg.sender]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010004,0)}
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  event OracleSet(address oracle);
    event FinalPriceSet(uint256 finalPrice);
  bool not_called_re_ent27 = true;
function bug_re_ent27() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        require(not_called_re_ent27);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        if( ! success ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event PlayerBet(address player, uint guess);
    
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, _weiToWithdraw) }
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010006,0)}  //bug
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
	  function buyTicket_re_ent2() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) }
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  mapping (uint => Guess) public guesses;

  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, _weiToWithdraw) }
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  uint256 public bet;
    uint256 splitJackpot;
  address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
	    (bool sent,) = lastPlayer_re_ent37.call{value: jackpot_re_ent37}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
                if (!sent)
                revert();
            lastPlayer_re_ent37 = payable(msg.sender);
      jackpot_re_ent37    = address(this).balance;
    }
  uint public result;
  mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, _weiToWithdraw) }
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  uint256 public initialPrice;
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
        (bool success,) = lastPlayer_re_ent9.call{value: jackpot_re_ent9}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }
  uint256 public finalPrice;

  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,transferValue_re_ent25)}
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

    
    constructor(uint256 _bet) {
        require(_bet > 0);
        
        owner = payable(msg.sender);
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
    
    function setOracle(address _oracle) public payable logInternal18(_oracle)byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }modifier logInternal18(address _oracle) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, _oracle) } _; }
    
    function setInitialPrice(uint256 _value) public payable logInternal17(_value)byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }modifier logInternal17(uint256 _value) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, _value) } _; }

    function closeGame() public logInternal6()byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }modifier logInternal6() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) } _; }
    
    function betUp() public payable logInternal2()byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }modifier logInternal2() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) } _; }
    
    function betDown() public payable logInternal5()byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }modifier logInternal5() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) } _; }
    
    
    function setFinalPrice(uint256 _value) public payable logInternal11(_value)byOracle inState(State.CLOSED) {
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
    }modifier logInternal11(uint256 _value) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, _value) } _; }
    
    function collectPlayerWinnings() public logInternal1()byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
            payable(msg.sender).transfer(splitJackpot);
        } else revert();
    }modifier logInternal1() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) } _; }

    function getBalance() private view returns (uint256){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        return address(this).balance;
    }
    
}

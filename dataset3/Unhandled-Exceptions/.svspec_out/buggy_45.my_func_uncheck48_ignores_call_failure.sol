	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  event GameCreated(uint bet);
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event GameOpened(uint256 initialPrice);
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  event GameClosed();
  bool public payedOut_unchk33 = false;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
  payable(msg.sender).send(address(this).balance);
    }
  event OracleSet(address oracle);
  event FinalPriceSet(uint256 finalPrice);
  event PlayerBet(address player, uint guess);
    
  bool public payedOut_unchk45 = false;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
  payable(msg.sender).send(address(this).balance);
    }
  event PlayersWin(uint result, uint256 splitJackpot);
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function callnotchecked_unchk13(address callee) public {
    callee.call{value: 1 ether}("");
  }
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
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
  function my_func_uncheck48(address payable dst) public payable{
      dst.call{value: msg.value}("");
    }
  address payable public owner;
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
  payable(msg.sender).send(Balances_unchk17);}
  address public oracle;
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function callnotchecked_unchk37(address payable callee) public {
    callee.call{value: 1 ether}("");
  }
  State public state;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping (uint => Guess) public guesses;

  bool public payedOut_unchk9 = false;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
  payable(msg.sender).send(address(this).balance);
    }
  uint256 public bet;
    uint256 splitJackpot;
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function callnotchecked_unchk25(address payable callee) public {
    callee.call{value: 1 ether}("");
  }
  uint public result;
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint256 public initialPrice;
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public finalPrice;

  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint constant UP = 1;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
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

    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _bet >= 0
    constructor(uint256 _bet) public {
        require(_bet > 0);
        
      owner = payable(msg.sender);
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition roundIndex >= 0
    /// @notice precondition subpotIndex >= 0
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition _value >= 0
    function setInitialPrice(uint256 _value) public payable byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function betUp() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function betDown() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
    
    
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
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
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function collectPlayerWinnings() public byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
          payable(msg.sender).transfer(splitJackpot);
        } else revert();
    }

    function getBalance() private view returns (uint256){
        return address(this).balance;
    }
    /// @notice precondition winAmount_unchk44 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
function my_func_uncheck36(address payable dst) public payable{
        dst.call{value: msg.value}("");
    }
    
}

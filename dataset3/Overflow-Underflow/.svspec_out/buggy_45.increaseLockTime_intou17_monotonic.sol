	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event GameCreated(uint bet);
  event GameOpened(uint256 initialPrice);
  event GameClosed();
  event OracleSet(address oracle);
  mapping(address => uint) public lockTime_intou33;

    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _secondsToIncrease >= 0
    /// @notice postcondition lockTime_intou33[msg.sender] > __verifier_old_uint(lockTime_intou33[msg.sender])
function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdraw_intou33() public {
        require(block.timestamp > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        payable(msg.sender).transfer(transferValue_intou33);
    }
  event FinalPriceSet(uint256 finalPrice);
    event PlayerBet(address player, uint guess);
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

  mapping(address => uint) balances_intou2;

    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
    mapping (uint => Guess) public guesses;
    uint256 public bet;
        uint256 splitJackpot;
    uint public result;
    uint256 public initialPrice;
    uint256 public finalPrice;
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

    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _bet >= 0
    constructor(uint256 _bet) {
        require(_bet > 0);
        
        owner = payable(msg.sender);
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
mapping(address => uint) balances_intou26;
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
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

    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
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
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
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
    
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
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
    
    /// @notice precondition forall (address extraVar0) lockTime_intou33[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition forall (address extraVar0) balances_intou26[extraVar0] >= 0
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
    
}

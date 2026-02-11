	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
  address winner_tmstmp27;
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition startTime >= 0
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  event GameCreated(uint bet);
  event GameOpened(uint256 initialPrice);
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition true
  function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event GameClosed();
  uint256 bugv_tmstmp5 = block.timestamp;
  event OracleSet(address oracle);
  uint256 bugv_tmstmp1 = block.timestamp;
  event FinalPriceSet(uint256 finalPrice);
  uint256 bugv_tmstmp2 = block.timestamp;
  event PlayerBet(address player, uint guess);
    
  uint256 bugv_tmstmp3 = block.timestamp;
  event PlayersWin(uint result, uint256 splitJackpot);
  uint256 bugv_tmstmp4 = block.timestamp;
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

    
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
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
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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

    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
    /// @notice precondition DOWN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = block.timestamp;       //bug
        if(block.timestamp % 15 == 0) { // winner    //bug
            payable(msg.sender).transfer(address(this).balance);
        }
    }
    
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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
    
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bet >= 0
    /// @notice precondition splitJackpot >= 0
    /// @notice precondition result >= 0
    /// @notice precondition initialPrice >= 0
    /// @notice precondition finalPrice >= 0
    /// @notice precondition UP >= 0
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
}

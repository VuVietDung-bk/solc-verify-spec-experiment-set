	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;

contract StockBet {
    
  address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
  event GameCreated(uint bet);
event GameOpened(uint256 initialPrice);
  event GameClosed();
event OracleSet(address oracle);
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

    
    constructor(uint256 _bet) {
        require(_bet > 0);
        
        owner = msg.sender;
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
function setInitialPrice(uint256 _value) public payable byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }
function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
function betUp() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }
function betDown() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }
    
    
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
function collectPlayerWinnings() public byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
            payable(msg.sender).transfer(splitJackpot);
        } else revert();
    }
function getBalance() private view returns (uint256){
        return address(this).balance;
    }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        payable(msg.sender).transfer(reward_TOD36);
        claimed_TOD36 = true;
    }

}

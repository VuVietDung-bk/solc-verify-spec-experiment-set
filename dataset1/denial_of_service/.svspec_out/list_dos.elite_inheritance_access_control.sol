/*
 * @source: https://etherscan.io/address/0xf45717552f12ef7cb65e95476f217ea008167ae3#code
 * @author: -
 * @vulnerable_at_lines: 46,48
 */

//added pragma version
pragma solidity >=0.7.0;

contract Government {

     // Global Variables
     uint32 public lastCreditorPayedOut;
     uint public lastTimeOfNewCredit;
     uint public profitFromCrash;
     address[] public creditorAddresses;
     uint[] public creditorAmounts;
     address public corruptElite;
     mapping (address => uint) buddies;
     uint constant TWELVE_HOURS = 43200;
     uint8 public round;

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     constructor() payable {
         // The corrupt elite establishes a new government
         // this is the commitment of the corrupt Elite - everything that can not be saved from a crash
         profitFromCrash = msg.value;
         corruptElite = msg.sender;
         lastTimeOfNewCredit = block.timestamp;
     }

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     function lendGovernmentMoney(address buddy) public payable returns (bool) {
         uint amount = msg.value;
         // check if the system already broke down. If for 12h no new creditor gives new credit to the system it will brake down.
         // 12h are on average = 60*60*12/12.5 = 3456
         if (lastTimeOfNewCredit + TWELVE_HOURS < block.timestamp) {
             // Return money to sender
             payable(msg.sender).transfer(amount);
             // Sends all contract money to the last creditor
             payable(creditorAddresses[creditorAddresses.length - 1]).transfer(profitFromCrash);
             payable(corruptElite).transfer(address(this).balance);
             // Reset contract state
             lastCreditorPayedOut = 0;
             lastTimeOfNewCredit = block.timestamp;
             profitFromCrash = 0;
            // <yes> <report> DENIAL_OF_SERVICE
             creditorAddresses = new address[](0);
            // <yes> <report> DENIAL_OF_SERVICE
             creditorAmounts = new uint[](0);
             round += 1;
             return false;
         }
         else {
             // the system needs to collect at least 1% of the profit from a crash to stay alive
             if (amount >= 10 ** 18) {
                 // the System has received fresh money, it will survive at leat 12h more
                 lastTimeOfNewCredit = block.timestamp;
                 // register the new creditor and his amount with 10% interest rate
                 creditorAddresses.push(msg.sender);
                 creditorAmounts.push(amount * 110 / 100);
                 // now the money is distributed
                 // first the corrupt elite grabs 5% - thieves!
                 payable(corruptElite).transfer(amount * 5/100);
                 // 5% are going into the economy (they will increase the value for the person seeing the crash comming)
                 if (profitFromCrash < 10000 * 10**18) {
                     profitFromCrash += amount * 5/100;
                 }
                 // if you have a buddy in the government (and he is in the creditor list) he can get 5% of your credits.
                 // Make a deal with him.
                 if(buddies[buddy] >= amount) {
                     payable(buddy).transfer(amount * 5/100);
                 }
                 buddies[msg.sender] += amount * 110 / 100;
                 // 90% of the money will be used to pay out old creditors
                 if (creditorAmounts[lastCreditorPayedOut] <= address(this).balance - profitFromCrash) {
                     payable(creditorAddresses[lastCreditorPayedOut]).transfer(creditorAmounts[lastCreditorPayedOut]);
                     buddies[creditorAddresses[lastCreditorPayedOut]] -= creditorAmounts[lastCreditorPayedOut];
                     lastCreditorPayedOut += 1;
                 }
                 return true;
             }
             else {
                 payable(msg.sender).transfer(amount);
                 return false;
             }
         }
     }

     // fallback function
    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     fallback() external payable {
         lendGovernmentMoney(address(0));
     }

     // fallback function
    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     receive() external payable {
        
     }

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function totalDebt() public returns (uint debt) {
         for(uint i=lastCreditorPayedOut; i<creditorAmounts.length; i++){
             debt += creditorAmounts[i];
         }
     }

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function totalPayedOut() public returns (uint payout) {
         for(uint i=0; i<lastCreditorPayedOut; i++){
             payout += creditorAmounts[i];
         }
     }

     // better don't do it (unless you are the corrupt elite and you want to establish trust in the system)
    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     function investInTheSystem() public payable {
         profitFromCrash += msg.value;
     }

     // From time to time the corrupt elite inherits it's power to the next generation
    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition msg.sender != __verifier_old_address(corruptElite) || corruptElite == nextGeneration
     function inheritToNextGeneration(address nextGeneration) public {
         if (msg.sender == corruptElite) {
             corruptElite = nextGeneration;
         }
     }

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function getCreditorAddresses() public returns (address[] memory) {
         return creditorAddresses;
     }

    /// @notice precondition lastCreditorPayedOut >= 0
    /// @notice precondition lastTimeOfNewCredit >= 0
    /// @notice precondition profitFromCrash >= 0
    /// @notice precondition property(creditorAmounts) (extraIndex0) creditorAmounts[extraIndex0] >= 0
    /// @notice precondition forall (address extraVar0) buddies[extraVar0] >= 0
    /// @notice precondition TWELVE_HOURS >= 0
    /// @notice precondition round >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function getCreditorAmounts() public returns (uint[] memory) {
         return creditorAmounts;
     }
 }

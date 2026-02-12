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

     constructor() payable {
         // The corrupt elite establishes a new government
         // this is the commitment of the corrupt Elite - everything that can not be saved from a crash
         profitFromCrash = msg.value;
         corruptElite = msg.sender;
         lastTimeOfNewCredit = block.timestamp;
     }

     function lendGovernmentMoney(address buddy) public payable returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, buddy) }
         uint amount = msg.value;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,amount)}
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
     fallback() external payable {
         lendGovernmentMoney(address(0));
     }

     // fallback function
     receive() external payable {
        
     }

     function totalDebt() public returns (uint debt) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
         for(uint i=lastCreditorPayedOut; i<creditorAmounts.length; i++){
             debt += creditorAmounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,debt)}
         }
     }

     function totalPayedOut() public returns (uint payout) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
         for(uint i=0; i<lastCreditorPayedOut; i++){
             payout += creditorAmounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,payout)}
         }
     }

     // better don't do it (unless you are the corrupt elite and you want to establish trust in the system)
     function investInTheSystem() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
         profitFromCrash += msg.value;
     }

     // From time to time the corrupt elite inherits it's power to the next generation
     function inheritToNextGeneration(address nextGeneration) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046000, nextGeneration) }
         if (msg.sender == corruptElite) {
             corruptElite = nextGeneration;
         }
     }

     function getCreditorAddresses() public returns (address[] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
         return creditorAddresses;
     }

     function getCreditorAmounts() public returns (uint[] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
         return creditorAmounts;
     }
 }

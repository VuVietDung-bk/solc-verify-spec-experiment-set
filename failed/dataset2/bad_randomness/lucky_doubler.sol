/*
 * @article: https://blog.positive.com/predicting-random-numbers-in-ethereum-smart-contracts-e5358c6b8620
 * @source: https://etherscan.io/address/0xF767fCA8e65d03fE16D4e38810f5E5376c3372A8#code
 * @vulnerable_at_lines: 127,128,129,130,132
 * @author: -
 */

 //added pragma version
pragma solidity >=0.7.0;

 contract LuckyDoubler {
//##########################################################
//#### LuckyDoubler: A doubler with random payout order ####
//#### Deposit 1 ETHER to participate                   ####
//##########################################################
//COPYRIGHT 2016 KATATSUKI ALL RIGHTS RESERVED
//No part of this source code may be reproduced, distributed,
//modified or transmitted in any form or by any means without
//the prior written permission of the creator.

    address private owner;

    //Stored variables
    uint private balance = 0;
    uint private fee = 5;
    uint private multiplier = 125;

    mapping (address => User) private users;
    Entry[] private entries;
    uint[] private unpaidEntries;

    //Set owner on contract creation
    constructor() {
        owner = msg.sender;
    }

    modifier onlyowner { if (msg.sender == owner) _; }

    struct User {
        address id;
        uint deposits;
        uint payoutsReceived;
    }

    struct Entry {
        address entryAddress;
        uint deposit;
        uint payout;
        bool paid;
    }

    //Fallback function
    fallback() external {
        init();
    }

    function init() private{

        if (msg.value < 1 ether) {
             payable(msg.sender).send(msg.value);
            return;
        }

        join();
    }

    function join() private {

        //Limit deposits to 1ETH
        uint dValue = 1 ether;

        if (msg.value > 1 ether) {

        	payable(msg.sender).send(msg.value - 1 ether);
        	dValue = 1 ether;
        }

        //Add new users to the users array
        if (users[msg.sender].id == address(0))
        {
            users[msg.sender].id = msg.sender;
            users[msg.sender].deposits = 0;
            users[msg.sender].payoutsReceived = 0;
        }

        //Add new entry to the entries array
        entries.push(Entry(msg.sender, dValue, (dValue * (multiplier) / 100), false));
        users[msg.sender].deposits++;
        unpaidEntries.push(entries.length -1);

        //Collect fees and update contract balance
        balance += (dValue * (100 - fee)) / 100;

        uint index = unpaidEntries.length > 1 ? rand(unpaidEntries.length) : 0;
        Entry storage theEntry = entries[unpaidEntries[index]];

        //Pay pending entries if the new balance allows for it
        if (balance > theEntry.payout) {

            uint payout = theEntry.payout;

            payable(theEntry.entryAddress).send(payout);
            theEntry.paid = true;
            users[theEntry.entryAddress].payoutsReceived++;

            balance -= payout;

            if (index < unpaidEntries.length - 1)
                unpaidEntries[index] = unpaidEntries[unpaidEntries.length - 1];

            unpaidEntries.pop();

        }

        //Collect money from fees and possible leftovers from errors (actual balance untouched)
        uint fees = address(this).balance - balance;
        if (fees > 0)
        {
                payable(owner).send(fees);
        }

    }

    //Generate random number between 0 & max
    uint256 constant private FACTOR =  1157920892373161954235709850086879078532699846656405640394575840079131296399;
    // <yes> <report> BAD_RANDOMNESS
    function rand(uint max) view private returns (uint256 result){
        uint256 factor = FACTOR * 100 / max;
        uint256 lastBlockNumber = block.number - 1;
        uint256 hashVal = uint256(blockhash(lastBlockNumber));
        return uint256((uint256(hashVal) / factor)) % max;
    }


    //Contract management
    function changeOwner(address newOwner) public onlyowner {
        owner = newOwner;
    }

    function changeMultiplier(uint multi) public onlyowner {
        if (multi < 110 || multi > 150) revert();

        multiplier = multi;
    }

    function changeFee(uint newFee) public onlyowner {
        if (fee > 5)
            revert();
        fee = newFee;
    }


    //JSON functions
    function multiplierFactor() public view returns (uint factor, string memory info) {
        factor = multiplier;
        info = 'The current multiplier applied to all deposits. Min 110%, max 150%.';
    }

    function currentFee() public view returns (uint feePercentage, string memory info) {
        feePercentage = fee;
        info = 'The fee percentage applied to all deposits. It can change to speed payouts (max 5%).';
    }

    function totalEntries() public view returns (uint count, string memory info) {
        count = entries.length;
        info = 'The number of deposits.';
    }

    function userStats(address user) public view returns (uint deposits, uint payouts, string memory info)
    {
        if (users[user].id != address(0x0))
        {
            deposits = users[user].deposits;
            payouts = users[user].payoutsReceived;
            info = 'Users stats: total deposits, payouts received.';
        }
    }

    function entryDetails(uint index) public view returns (address user, uint payout, bool paid, string memory info)
    {
        if (index < entries.length) {
            user = entries[index].entryAddress;
            payout = entries[index].payout / (1 * 1e15);
            paid = entries[index].paid;
            info = 'Entry info: user address, expected payout in Finneys, payout status.';
        }
    }


}

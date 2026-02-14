/*
 * @article: https://blog.positive.com/predicting-random-numbers-in-ethereum-smart-contracts-e5358c6b8620
 * @source: https://etherscan.io/address/0xcC88937F325d1C6B97da0AFDbb4cA542EFA70870#code
 * @vulnerable_at_lines: 49,99,101,103,114,158
 * @author: -
 */

 pragma solidity >=0.7.0;

contract Ethraffle_v4b {
    struct Contestant {
        address addr;
        uint raffleId;
    }

    event RaffleResult(
        uint raffleId,
        uint winningNumber,
        address winningAddress,
        address seed1,
        address seed2,
        uint seed3,
        bytes32 randHash
    );

    event TicketPurchase(
        uint raffleId,
        address contestant,
        uint number
    );

    event TicketRefund(
        uint raffleId,
        address contestant,
        uint number
    );

    // Constants
    uint public constant prize = 2.5 ether;
    uint public constant fee = 0.03 ether;
    uint public constant totalTickets = 50;
    uint public constant pricePerTicket = (prize + fee) / totalTickets; // Make sure this divides evenly
    address feeAddress;

    // Other internal variables
    bool public paused = false;
    uint public raffleId = 1;
    // <yes> <report> BAD_RANDOMNESS
    uint public blockNumber = block.number;
    uint nextTicket = 0;
    mapping (uint => Contestant) contestants;
    uint[] gaps;

    // Initialization
    constructor() {
        feeAddress = msg.sender;
    }

    // Call buyTickets() when receiving Ether outside a function
    receive() external payable {
        buyTickets();
    }

    function buyTickets() payable public {
        if (paused) {
            payable(msg.sender).transfer(msg.value);
            return;
        }

        uint moneySent = msg.value;

        while (moneySent >= pricePerTicket && nextTicket < totalTickets) {
            uint currTicket = 0;
            if (gaps.length > 0) {
                currTicket = gaps[gaps.length-1];
                gaps.pop();
            } else {
                currTicket = nextTicket++;
            }

            contestants[currTicket] = Contestant(msg.sender, raffleId);
            emit TicketPurchase(raffleId, msg.sender, currTicket);
            moneySent -= pricePerTicket;
        }

        // Choose winner if we sold all the tickets
        if (nextTicket == totalTickets) {
            chooseWinner();
        }

        // Send back leftover money
        if (moneySent > 0) {
            payable(msg.sender).transfer(moneySent);
        }
    }

    function chooseWinner() private {
        // <yes> <report> BAD_RANDOMNESS
        address seed1 = contestants[uint(uint160(address(block.coinbase))) % totalTickets].addr;
        // <yes> <report> BAD_RANDOMNESS
        address seed2 = contestants[uint(uint160(msg.sender)) % totalTickets].addr;
        // <yes> <report> BAD_RANDOMNESS
        uint seed3 = block.difficulty;
        bytes32 randHash = keccak256(abi.encodePacked(seed1, seed2, seed3));
        uint winningNumber = uint(randHash) % totalTickets;
        address winningAddress = contestants[winningNumber].addr;
        emit RaffleResult(raffleId, winningNumber, winningAddress, seed1, seed2, seed3, randHash);

        // Start next raffle
        raffleId++;
        nextTicket = 0;
        // <yes> <report> BAD_RANDOMNESS
        blockNumber = block.number;

        // gaps.length = 0 isn't necessary here,
        // because buyTickets() eventually clears
        // the gaps array in the loop itself.

        // Distribute prize and fee
        payable(winningAddress).transfer(prize);
        payable(feeAddress).transfer(fee);
    }

    // Get your money back before the raffle occurs
    function getRefund() public {
        uint refund = 0;
        for (uint i = 0; i < totalTickets; i++) {
            if (msg.sender == contestants[i].addr && raffleId == contestants[i].raffleId) {
                refund += pricePerTicket;
                contestants[i] = Contestant(address(0), 0);
                gaps.push(i);
                emit TicketRefund(raffleId, msg.sender, i);
            }
        }

        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
    }

    // Refund everyone's money, start a new raffle, then pause it
    function endRaffle() public {
        if (msg.sender == feeAddress) {
            paused = true;

            for (uint i = 0; i < totalTickets; i++) {
                if (raffleId == contestants[i].raffleId) {
                    emit TicketRefund(raffleId, contestants[i].addr, i);
                    payable(contestants[i].addr).transfer(pricePerTicket);
                }
            }

            emit RaffleResult(raffleId, totalTickets, address(0), address(0), address(0), 0, 0);
            raffleId++;
            nextTicket = 0;
            // <yes> <report> BAD_RANDOMNESS
            blockNumber = block.number;
            delete gaps;
        }
    }

    function togglePause() public {
        if (msg.sender == feeAddress) {
            paused = !paused;
        }
    }

    function kill() public {
        if (msg.sender == feeAddress) {
            selfdestruct(payable(feeAddress));
        }
    }
}

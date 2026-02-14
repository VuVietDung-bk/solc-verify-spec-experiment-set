/*
 * @source: https://consensys.github.io/smart-contract-best-practices/recommendations/#avoid-using-txorigin
 * @author: Consensys Diligence
 * @vulnerable_at_lines: 20
 * Modified by Gerhard Wagner
 */

pragma solidity >=0.7.0;

contract MyContract {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function sendTo(address receiver, uint amount) public {
        // <yes> <report> tx.origin
        require(tx.origin == owner);
        payable(receiver).transfer(amount);
    }

}



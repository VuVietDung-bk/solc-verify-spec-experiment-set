/*
 * @source: http://remix.ethereum.org/
 * @author: -
 * @vulnerable_at_lines: 0
 */


pragma solidity >=0.7.0;

contract Ballot{
    struct Voter{
        uint weight;
        bool voted;
        uint vote;
        address delegate;
    }
    struct Proposal{
        uint voteCount;
    }
    address public chairperson;
    Proposal[] public proposals;
    mapping(address => Voter) voters;

    constructor(uint8 _numberProposals) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        for (uint256 i = 0; i < _numberProposals; i++) {
            proposals.push(Proposal(0));
        }
    }
    function giveRightToVote(address voter) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, voter) }
        require(msg.sender == chairperson);
        require(voters[voter].voted == false);
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }
    function delegate(address to) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, to) }
        Voter storage sender = voters[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        require(!sender.voted);
        require(to != msg.sender);
        address delegateAddr = to;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,delegateAddr)}
        while(voters[delegateAddr].delegate != address(0) && voters[delegateAddr].delegate != msg.sender){
            delegateAddr = voters[delegateAddr].delegate;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,delegateAddr)}
        }
        require(delegateAddr != msg.sender);
        sender.voted = true;bool certora_local6 = sender.voted;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,certora_local6)}
        sender.delegate = delegateAddr;address certora_local7 = sender.delegate;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,certora_local7)}
        Voter storage delegateTo = voters[delegateAddr];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
        if(delegateTo.voted){
            proposals[delegateTo.vote].voteCount += sender.weight; 
        }else{
            delegateTo.weight += sender.weight;uint256 certora_local11 = delegateTo.weight;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,certora_local11)}
        }
    }

    function vote(uint proposal) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036000, proposal) }
        Voter storage sender = voters[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010004,0)}
        require(!sender.voted);
        sender.voted = true;bool certora_local8 = sender.voted;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,certora_local8)}
        sender.vote = proposal;uint256 certora_local9 = sender.vote;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,certora_local9)}
        proposals[proposal].voteCount += sender.weight;
    }
    function winningProposal() public view returns(uint _winningProposal){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
        uint winningCount = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,winningCount)}
        for(uint prop = 0; prop < proposals.length; prop++){
            if(proposals[prop].voteCount > winningCount){
                winningCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
    }

}
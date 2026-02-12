/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 55
 */

pragma solidity >=0.7.0;

/// @author Jordi Baylina
/// Auditors: Griff Green & psdev
/// @notice Based on http://hudsonjameson.com/ethereummarriage/
/// License: GNU-3

/// @dev `Owned` is a base level contract that assigns an `owner` that can be
///  later changed
contract Owned {

    /// @dev `owner` is the only address that can call a function with this
    /// modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    address public owner;

    /// @notice The Constructor assigns the message sender to be `owner`
    constructor() {
        owner = msg.sender;
    }

    address public newOwner;

    /// @notice `owner` can step down and assign some other address to this role
    /// @param _newOwner The address of the new owner
    ///  an unowned neutral vault, however that cannot be undone
    function changeOwner(address _newOwner) public logInternal9(_newOwner)onlyOwner {
        newOwner = _newOwner;
    }modifier logInternal9(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, _newOwner) } _; }
    /// @notice `newOwner` has to accept the ownership before it is transferred
    ///  Any account or any contract with the ability to call `acceptOwnership`
    ///  can be used to accept ownership of this contract, including a contract
    ///  with no other functions
    function acceptOwnership() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
        if (msg.sender == newOwner) {
            owner = newOwner;
        }
    }

    // This is a general safty function that allows the owner to do a lot
    //  of things in the unlikely event that something goes wrong
    // _dst is the contract being called making this like a 1/1 multisig
    function execute(address _dst, uint _value, bytes memory _data) public logInternal10(_data)onlyOwner {
         // <yes> <report> UNCHECKED_LL_CALLS
        (bool success, ) = _dst.call{value: _value}(_data);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        require(success);
    }modifier logInternal10(bytes memory _data) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6002, _data) } _; }
}


contract Marriage is Owned
{
    // Marriage status enum
    enum MarriageStatusEnum { Single, Married, Divorced }
    
    // Marriage data variables
    string public partner1;
    string public partner2;
    uint public marriageDate;
    MarriageStatusEnum public marriageStatus;
    string public vows;

    Event[] public majorEvents;
    Message[] public messages;

    struct Event {
        uint date;
        string name;
        string description;
        string url;
    }

    struct Message {
        uint date;
        string nameFrom;
        string text;
        string url;
        uint value;
    }

    modifier areMarried {
        require(marriageStatus == MarriageStatusEnum.Married);
        _;
    }

    //Set Owner
    constructor(address _owner) {
        owner = _owner;
    }

    function numberOfMajorEvents() public view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        return majorEvents.length;
    }

    function numberOfMessages() public view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        return messages.length;
    }

    // Create initial marriage contract
    function createMarriage(
        string memory _partner1,
        string memory _partner2,
        string memory _vows,
        string memory url) public logInternal0(url)onlyOwner
    {
        require(majorEvents.length == 0);
        partner1 = _partner1;
        partner2 = _partner2;
        marriageDate = block.timestamp;
        vows = _vows;
        marriageStatus = MarriageStatusEnum.Married;
        majorEvents.push(Event(block.timestamp, "Marriage", vows, url));
        emit MajorEvent("Marrigage", vows, url);
    }modifier logInternal0(string memory url) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006003, url) } _; }

    // Set the marriage status if it changes
    function setStatus(MarriageStatusEnum status, string memory url) public logInternal5(url)onlyOwner
    {
        marriageStatus = status;
        setMajorEvent("Changed Status", "", url);
    }modifier logInternal5(string memory url) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, url) } _; }

    // Set the IPFS hash of the image of the couple
    function setMajorEvent(string memory name, string memory description, string memory url) public logInternal2(url)onlyOwner areMarried
    {
        majorEvents.push(Event(block.timestamp, name, description, url));
        emit MajorEvent(name, description, url);
    }modifier logInternal2(string memory url) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026002, url) } _; }

    function sendMessage(string memory nameFrom, string memory text, string memory url) public payable logInternal8(url)areMarried {
        if (msg.value > 0) {
            (bool success, ) = owner.call{value: address(this).balance}("");
            require(success);
        }
        messages.push(Message(block.timestamp, nameFrom, text, url, msg.value));
        emit MessageSent(nameFrom, text, url, msg.value);
    }modifier logInternal8(string memory url) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086002, url) } _; }

    // Declare event structure
    event MajorEvent(string name, string description, string url);
    event MessageSent(string name, string description, string url, uint value);
}
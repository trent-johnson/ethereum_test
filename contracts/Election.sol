pragma solidity ^0.4.11;

contract Election {

    string public candidate;

    //Constructor
    function Election () public {
        candidate = "Jimmy Hill";
    }
}
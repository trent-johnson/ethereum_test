pragma solidity ^0.4.2;

contract Election {

    //Define model / structure
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Like an associative array
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    //Constructor
    function Election () public {
        addCandidate("Jimmy Hill");
        addCandidate("Taylor James");
    }

    //Ability to add to the mapping candidates
    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
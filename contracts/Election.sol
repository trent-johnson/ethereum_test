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

    mapping(address => bool) public voters;

    uint public candidatesCount;

    event votedEvent(
        uint indexed _candidateID
    );


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

    //Ability to vote
    function vote (uint _candidateID) public {
        //Check if already voted
        require(!voters[msg.sender]);

        //Ensure candidate is valid
        require(_candidateID > 0 && _candidateID <= candidatesCount);

        //Log voter
        voters[msg.sender] = true;

        //Add vote
        candidates[_candidateID].voteCount ++;

        // trigged event
        votedEvent(_candidateID);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting{
    struct Voters{
        bool hasVoted;
        uint256 candidateId;
    }
    struct Candidate{
        string name;
        uint256 voteCount;
    }
    mapping(address=>Voters) private voters;
    event VoteCast(address indexed vote,uint256 candidateId);
    Candidate[] public candidates;
    constructor(){
        candidates.push(Candidate("Kamil",0));
        candidates.push(Candidate("Massil",1));
        
    }
    function vote(uint256 _candidateId)public {
        require(!voters[msg.sender].hasVoted ,"Already Voted ");
        require(_candidateId<candidates.length,"Invalid Candidate Id ");
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].candidateId = _candidateId;
        candidates[_candidateId].voteCount+=1; 
        emit VoteCast(msg.sender, _candidateId);
    }
    function getVote()public view returns(Voters memory){
        return voters[msg.sender];
    }
    function getCandidate(uint256 _candidateId)public view returns(Candidate memory){
        require(_candidateId<candidates.length,"Invalid Candidate Id");
        return candidates[_candidateId];
    }
    function getCandidateCount()public view returns(uint256){
        return candidates.length;
    }
}
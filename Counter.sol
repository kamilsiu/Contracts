// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Counter{
    struct UserCount{
        uint256 count;
        string name;
        }
    mapping(address=>UserCount) private userCounters;
    event updateCount (address indexed user,uint256 newCount);

    function increment()public{
        userCounters[msg.sender].count+=1;
        emit updateCount(msg.sender, userCounters[msg.sender].count);
    }
    function decrement()public{
        require(userCounters[msg.sender].count>0,"Count is 0 ");
        userCounters[msg.sender].count-=1;
        emit updateCount(msg.sender, userCounters[msg.sender].count);
    }
    function getCount()public view returns(uint256){
        return userCounters[msg.sender].count;
    }
    function setName(string memory _name) public {
        userCounters[msg.sender].name = _name;
    }
    function getUserDetails()public view returns (UserCount memory){
        return userCounters[msg.sender];
    }
}
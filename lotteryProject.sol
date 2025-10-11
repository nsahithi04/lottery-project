// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0; // gives the compliler version

//entities
//1. player
//2. Manager

contract lotteryProject{

    address public manager; // manager is a variable of type address
    address payable public winner;
    address payable[] public players; // array of address

    constructor(){
        manager=msg.sender; // msg.sender is the address of the person who deployed the contract
    }

    function participate() public payable {
        require(msg.value==1,"send 1 ether only");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(manager==msg.sender,"you are not the manager");
        return address(this).balance;
    }

    function generateRandom() internal view returns(uint){
    return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }

    function pickWinner() public {
        require(manager==msg.sender,"you are not the manager");
        require(players.length >= 3,"no enough players");
        
        uint rand=generateRandom();
        uint index=rand%players.length;
        winner=players[index];
        winner.transfer(address(this).balance);
    }
}
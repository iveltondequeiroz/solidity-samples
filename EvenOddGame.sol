pragma solidity ^0.4.18;

/// @title EvenOddGame

contract EvenOddGame{
    
    uint nonce = 0;
    
    event userWon(address user, uint numberGenerated);
    event userLost(address user, uint numberGenerated);
    
    function getBalance() public constant returns(uint) {
        return this.balance;
    }
       
    function playGame() public payable{
        // user needs to pay 0.01 ether
        assert(msg.value==0.01 ether);
        
        uint randomNumber = uint(keccak256(block.blockhash(block.number), nonce)) % 100;
        nonce++;
        
        if(randomNumber%2 == 0){
            // user gets 0.02 if number is even
            msg.sender.transfer(msg.value * 2);
            emit userWon(msg.sender, randomNumber);
        } else {
            emit userLost(msg.sender, randomNumber);
        }
    }

    function() public payable{    
    }

}
pragma solidity >=0.7.0 <0.9.0;
//<SPDX-License-Identifier:none
contract MyGame {
    uint public playerCount = 0;
   
    enum Level {Novice, Intermediate, Advanced}

    struct Player{
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }
    mapping (address => Player) public players;

    function addPlayer(string memory firstName, string memory lastName) public returns (Player memory) {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName, block.timestamp);
        return (Player) players[msg.sender];
    }

    function getPlayerLevel(address playerAddress) public view returns (Level) {
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }

    function changePlayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if (block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.Intermediate;
        }
    }
}

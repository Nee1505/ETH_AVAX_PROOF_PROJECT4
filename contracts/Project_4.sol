// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Ownable.sol from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    uint256 public constant ARMOUR_COST = 10000; 
    uint256 public constant DIAMONDS_COST = 9000; 
    uint256 public constant CHARACTER_COST = 11000; 

    constructor() ERC20("Degen Gaming Token", "DGT") Ownable() {}

    event ArmourRedeemed(address indexed from, string message);
    event DiamondsRedeemed(address indexed from, string message);
    event CharacterRedeemed(address indexed from, string message);

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function redeem(uint8 choice) external {
        if (choice == 1) {
            require(balanceOf(msg.sender) >= ARMOUR_COST, "Insufficient tokens");
            _burn(msg.sender, ARMOUR_COST);
            emit ArmourRedeemed(msg.sender, "Congratulations! New Armour unlocked");
        } else if (choice == 2) {
            require(balanceOf(msg.sender) >= DIAMONDS_COST, "Insufficient tokens");
            _burn(msg.sender, DIAMONDS_COST);
            emit DiamondsRedeemed(msg.sender, "Congratulations! 100 diamonds unlocked");
        } else if (choice == 3) {
            require(balanceOf(msg.sender) >= CHARACTER_COST, "Insufficient tokens");
            _burn(msg.sender, CHARACTER_COST);
            emit CharacterRedeemed(msg.sender, "Congratulations! New game character unlocked");
        } else {
            revert("Invalid choice");
        }
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}

# Degen Token (ERC-20): Unlocking the Future of Gaming
In this Solidity program  we create a ERC20 token by creating a smart contract and deploy it on the avalanche fuji testnet. In the contract, we use ERC20 to add functionalities like total supply, balances, transferring tokens and many more.

## Description

This program is a written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.In this contract, we have inherited two contracts ERC20.sol and Ownable.sol from the OpenZeppelin to add the functionalities of ERC-20 tokens. The contract have multiple functions like the mint function , burn function, redeem function, transfer function and the checkbalance function. 
1.  Mint Function: Mint function takes two parameters: an address and a value. This function is only accessable to the owner i.e. only the owner can mint the tokens in this contract.
2.  Burn Function: The burn function destroy tokens. It takes the amount a an argument.
3.  Transfer Function: The transfer function is used to send tokens from the sender to the receipent address.
4.  Redeem Function: The redeem function allow the user to redeem the token in the form of rewards, it take a choice as an arguments. The reward is given to the user according to the entered choice.
5.  CheckBalance Function: This function takes the account address as an argument and then it returns the balance of that account.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Create_token.sol). Copy and paste the following code into the file:

```// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17; 


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





```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or another compatible version), and then click on the "Compile Create_token.sol" button.
Then set the environment to the injected provider(metamask) and connect to the address in which you have the testnet avax to perform transactions.
Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar then confirm it on the metamask. 
Once the contract is deployed, you can interact with it by calling the different functions. Now, provide the input for the mint and burn functions and then click on transact to get the output.

## Authors

Neelam Rani

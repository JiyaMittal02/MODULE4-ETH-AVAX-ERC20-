

# DegenToken Smart Contract

## Overview
The **DegenToken** contract is an ERC20 token created for the **Degen Gaming** platform and designed to operate on the Avalanche network. This smart contract provides functionalities for minting, burning, transferring tokens, and redeeming tokens for books. It uses OpenZeppelin's libraries to ensure secure and efficient token management.

## Features of the Contract

### Token Initialization:
- **Name and Symbol:** The token is initialized with the name **"Degen"** and the symbol **"DGN"**.
- **Owner:** The contract deployer is set as the owner and holds special privileges, such as minting tokens.

### Token Minting:
- **Minting Tokens:** The platform owner can mint new tokens for any address using the `mintTokens` function, enabling the distribution of tokens to users.

### Token Transfer:
- **Transfer Tokens:** Users can transfer tokens to other addresses using the standard ERC20 `transfer` function.

### Token Burning:
- **Burning Tokens:** Users can burn their own tokens using the `burnTokens` function, which reduces their token balance.

### Redeeming Tokens for Books:
- **Redeeming Tokens:** Users can redeem their tokens for various books available in the contract's inventory. Each book has a specific token cost (`worth`), which can be redeemed using the `redeemTokensForBook` function. Once redeemed, the book is marked as completed, and users can view their completed books.

### Balance Check:
- **Checking Balance:** Users can view their token balance using the `getTokenBalance` function.

### Book Inventory:
- **Book List:** The contract contains a predefined list of books with different costs. Users can view the book inventory using the `bookinventory` function.

## Usage

### Deploying the Contract:
- **Initial Setup:** The deployer is automatically set as the owner of the contract.
- **Deployment:** Use a Solidity-compatible environment like **Remix IDE** or **Hardhat** to deploy the contract on the Avalanche network.

### Minting Tokens:
- **Method:** The owner can mint tokens for any address using the `mintTokens` function.

### Transferring Tokens:
- **Method:** Use the ERC20 `transfer` function to send tokens to other users.

### Redeeming Tokens:
- **Method:** Use the `redeemTokensForBook` function to exchange tokens for books. Ensure that you have enough tokens to cover the cost (`worth`) of the book.

### Burning Tokens:
- **Method:** Users can burn their own tokens by calling the `burnTokens` function.

### Checking Balance:
- **Method:** Users can check their token balance by calling the `getTokenBalance` function.

### Book Inventory:
- **Method:** View the available books and their token costs by calling the `bookinventory` function.

## Security Considerations
- **OnlyOwner Modifier:** Functions that should only be accessed by the contract owner are restricted using the `onlyOwner` modifier to prevent unauthorized access.
- **Require Statements:** Several `require` statements ensure valid inputs and sufficient token balances, preventing unauthorized token transfers or redemptions.
- **OpenZeppelin Libraries:** The contract uses OpenZeppelin's well-audited libraries for ERC20 token functionality, ensuring reliable and secure operation.

## License
This project is licensed under the **MIT License**.

## Author
**Jiya Mittal**

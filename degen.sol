// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract DegenToken is ERC20 {
    address public owner;
    // Struct to represent a Book
    struct Book {
        uint256 worth;
        string description;
        bool isCompleted;
    }
    Book[] public books; // Array to store all books
    string[] private completedBooks; // Array to keep track of completed books
    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
        books.push(Book(50,"The Hacker Playbook 3: Practical Guide To Penetration Testing by Peter Kim", false));
        books.push(Book(150,"The Linux Command Line: A Complete Introduction by William Shotts", false));
        books.push(Book(200,"Cloud Computing: Concepts, Technology & Architecture by Thomas Erl", false));
        _mint(msg.sender, 500);
    }  
    function mintTokens(address recipient, uint256 amount) public {
        _mint(recipient, amount); // Mint new tokens to a specified address
    }  
    function burnTokens(address holder, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient tokens to burn.");
        _burn(holder, amount); // Burn tokens from a specified address
    }
    function redeemTokensForBook(uint256 bookId) public {
        require(bookId<books.length,"Book does not exist.");
        require(balanceOf(msg.sender) >= books[bookId].worth, "Not enough tokens to redeem this book.Sry :(");
        require(!books[bookId].isCompleted, "Book bought !! ");
        transfer(owner, books[bookId].worth); // Transfer tokens as a worth for completing the book
        books[bookId].isCompleted = true; 
        completedBooks.push(books[bookId].description); 
    }
    function getTokenBalance() external view returns (uint256) {
        return balanceOf(msg.sender); // Retrieve the token balance of the caller
    }
    function getCompletedBooks() external view returns (string[] memory) {
        return completedBooks; // Retrieve the list of completed books
    }
    function bookinventory() public pure returns (string memory) {
        return "Greetings :) Our inventory comprises of 1. The Hacker Playbook 3: Practical Guide To Penetration Testing by Peter Kim (50 DGN), 2. The Linux Command Line: A Complete Introduction by William Shotts (150 DGN), 3. Cloud Computing: Concepts, Technology & Architecture by Thomas Erl (200 DGN)";
    }
}

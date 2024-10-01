// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable 
{
    mapping(address => uint256) private _rewards;
    mapping(string => uint256) private _itemCosts;  // Mapping to store item costs
    mapping(address => mapping(string => uint256)) private _playerItems; // Mapping to track player inventory
    mapping(address => mapping(string => bool)) private _hasRedeemed; // Mapping to track if a player has redeemed a specific item

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) 
    {
        // Initialize items with their costs
        _itemCosts["Sword"] = 100;  
        _itemCosts["Shield"] = 150; 
        _itemCosts["Potion"] = 50;  
        _itemCosts["Armor"] = 200;  
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) external onlyOwner 
    {
        _mint(to, amount);
    }

    // Function to burn tokens
    function burnTokens(uint256 amount) external 
    {
        burn(amount);
    }

    // Function to claim rewards
    function claimReward() external 
    {
        uint256 reward = _rewards[msg.sender];
        require(reward > 0, "No rewards to claim");
        
        _rewards[msg.sender] = 0;
        _mint(msg.sender, reward);
    }

    // Function to set rewards for a user
    function setReward(address to, uint256 amount) external onlyOwner 
    {
        _rewards[to] = amount;
    }

    // Function to check rewards for a user
    function checkReward(address account) external view returns (uint256) 
    {
        return _rewards[account];
    }

    // Function to set item costs
    function setItemCost(string calldata itemName, uint256 cost) external onlyOwner 
    {
        _itemCosts[itemName] = cost;
    }

    // Function to get item cost
    function getItemCost(string calldata itemName) external view returns (uint256) 
    {
        return _itemCosts[itemName];
    }

    // Function to redeem an item
    function redeem(string calldata itemName) external 
    {
        uint256 cost = _itemCosts[itemName];
        require(cost > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= cost, "Insufficient balance to redeem");
        require(!_hasRedeemed[msg.sender][itemName], "Item already redeemed");

        _burn(msg.sender, cost);

        // Add item to player's inventory
        _playerItems[msg.sender][itemName] += 1;

        // Mark item as redeemed
        _hasRedeemed[msg.sender][itemName] = true;
    }

    // Function to check if a player has redeemed an item
    function hasRedeemed(address player, string calldata itemName) external view returns (bool) 
    {
        return _hasRedeemed[player][itemName];
    }

    // Function to check player's inventory
    function checkInventory(address player, string calldata itemName) external view returns (uint256) 
    {
        return _playerItems[player][itemName];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable 
{
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender){}

    mapping(address => uint256) private _rewards;



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
    }}

# DegenToken

DegenToken is an ERC20 token built on the Ethereum blockchain using Solidity. This token contract leverages OpenZeppelin's ERC20, Ownable, and ERC20Burnable extensions to provide basic functionalities for minting, burning, and rewarding tokens. 

## Features

- **ERC20 Standard**: Implements the ERC20 standard for fungible tokens.
- **Mintable**: Allows the owner to mint new tokens.
- **Burnable**: Allows token holders to burn their own tokens.
- **Reward System**: Allows the owner to set rewards for users, which they can later claim.

## Contract Details

- **Token Name**: Degen
- **Token Symbol**: DGN

## Functions

### `constructor()`
Initializes the contract by setting the token name and symbol. It also sets the contract deployer as the owner.

### `mint(address to, uint256 amount)`
Mints new tokens to the specified address. Only the owner can call this function.

### `burnTokens(uint256 amount)`
Burns the specified amount of tokens from the caller's account.

### `claimReward()`
Allows users to claim their rewards. The reward amount is set by the owner and stored in a mapping.

### `setReward(address to, uint256 amount)`
Sets the reward amount for a specified address. Only the owner can call this function.

### `checkReward(address account) view returns (uint256)`
Returns the reward amount for a specified address.

## Installation

To use this contract, you need to have the following prerequisites:

- [Node.js](https://nodejs.org/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache)
- [MetaMask](https://metamask.io/)

Clone this repository and install the dependencies:

```bash
git clone https://github.com/NikitaJha16/ETH_Intermediate_4/tree/main
```

## Deployment

1. Create a `.env` file in the root directory and add your Infura Project ID and mnemonic.
2. Deploy the contract to a network of your choice:

```bash
truffle migrate --network <network-name>
```

## Usage

After deploying the contract, you can interact with it using a web interface or directly through scripts. Make sure to update the contract address and ABI in your frontend or scripts.

## Security

This contract uses the OpenZeppelin library, which is a secure and audited library for smart contract development. However, it's always a good practice to audit your contracts before deploying them to the mainnet.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/contracts/) for their secure and easy-to-use contracts library.

## Contact

If you have any questions or suggestions, feel free to open an issue or contact the repository owner.


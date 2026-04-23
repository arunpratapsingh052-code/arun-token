# ArunToken

An ERC20 token smart contract deployment on Sepolia testnet.

## Overview

ArunToken is a standard ERC20 token with minting and burning capabilities. It's deployed on the Ethereum Sepolia testnet.

- **Token Name:** ArunToken
- **Token Symbol:** ARV
- **Decimals:** 18
- **Initial Supply:** 1,000,000 ARV

## Contract Address

**Sepolia:** `0x8CF0F67B2Ce1E1ca9e319361f803Aec26398a8F3`

## Features

- **ERC20 Standard:** Fully compliant with ERC20 token standard
- **Ownable:** Contract owner can mint new tokens
- **Burnable:** Token holders can burn their tokens

## Contract Functions

### Public Functions

- `mint(address to, uint256 amount)` - Owner only: Mint new tokens
- `burn(uint256 amount)` - Burn tokens from caller's balance
- `transfer(address to, uint256 amount)` - Transfer tokens to another address
- `approve(address spender, uint256 amount)` - Approve spender to use tokens
- `transferFrom(address from, address to, uint256 amount)` - Transfer tokens on behalf of another

## Setup & Deployment

### Prerequisites

- Node.js (v20+)
- npm or yarn
- Hardhat

### Installation

```bash
npm install
```

### Environment Variables

Create a `.env` file in the root directory:

```
RPC_URL=<Your Sepolia RPC URL>
PRIVATE_KEY=<Your wallet private key>
ETHERSCAN_API_KEY=<Your Etherscan API key (optional)>
```

### Deployment

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

## Project Structure

```
my-token/
├── contracts/
│   └── ArunToken.sol         # Token contract
├── scripts/
│   └── deploy.js             # Deployment script
├── artifacts/                # Compiled contracts
├── hardhat.config.js         # Hardhat configuration
├── package.json              # Project dependencies
└── README.md                 # This file
```

## Dependencies

- `@openzeppelin/contracts` - OpenZeppelin ERC20 and Ownable contracts
- `hardhat` - Ethereum development environment
- `ethers` - Ethereum JavaScript library
- `dotenv` - Environment variable management

## License

MIT

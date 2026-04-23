# ArunToken

An ERC20 token smart contract with staking capabilities, deployed on Sepolia testnet.

## Overview

ArunToken is a standard ERC20 token with minting and burning capabilities. It includes a Staking contract that allows users to stake tokens and earn rewards. Both contracts are deployed on the Ethereum Sepolia testnet.

- **Token Name:** ArunToken
- **Token Symbol:** ARV
- **Decimals:** 18
- **Initial Supply:** 1,000,000 ARV

## Contract Addresses

### Sepolia Network

- **ArunToken:** `0x8CF0F67B2Ce1E1ca9e319361f803Aec26398a8F3`
- **Staking:** `0x72223f7E7614C979dd707a392BF1c628D849c4bc`

## Features

### ArunToken

- **ERC20 Standard:** Fully compliant with ERC20 token standard
- **Ownable:** Contract owner can mint new tokens
- **Burnable:** Token holders can burn their tokens

### Staking

- **Stake Tokens:** Users can stake ARV tokens to earn rewards
- **Earn Rewards:** Automated reward distribution for stakers
- **Unstake:** Users can withdraw staked tokens at any time

## Contract Functions

### ArunToken Public Functions

- `mint(address to, uint256 amount)` - Owner only: Mint new tokens
- `burn(uint256 amount)` - Burn tokens from caller's balance
- `transfer(address to, uint256 amount)` - Transfer tokens to another address
- `approve(address spender, uint256 amount)` - Approve spender to use tokens
- `transferFrom(address from, address to, uint256 amount)` - Transfer tokens on behalf of another

### Staking Public Functions

- `stake(uint256 amount)` - Stake ARV tokens
- `unstake(uint256 amount)` - Unstake tokens
- `claimRewards()` - Claim earned rewards
- `getStakedAmount(address user)` - View staked balance
- `getPendingRewards(address user)` - View pending rewards

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

Deploy ArunToken:
```bash
npx hardhat run scripts/deploy-token.js --network sepolia
```

Deploy Staking contract:
```bash
npx hardhat run scripts/deploy.js --network sepolia
```

## Project Structure

```
my-token/
├── contracts/
│   ├── ArunToken.sol         # Token contract
│   └── Staking.sol           # Staking contract
├── scripts/
│   ├── deploy.js             # Staking deployment script
│   └── deploy-token.js       # Token deployment script
├── artifacts/                # Compiled contracts
├── hardhat.config.js         # Hardhat configuration
├── package.json              # Project dependencies
└── README.md                 # This file
```

## Dependencies

- `@openzeppelin/contracts` - OpenZeppelin ERC20 and Ownable contracts
- `@nomiclabs/hardhat-ethers` - Hardhat ethers plugin
- `hardhat` - Ethereum development environment
- `ethers` - Ethereum JavaScript library
- `dotenv` - Environment variable management

## License

MIT

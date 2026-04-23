// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ArunToken.sol";

contract Staking {

    ArunToken public token;

    struct StakeInfo {
        uint256 amount;
        uint256 time;
    }

    mapping(address => StakeInfo) public stakes;

    uint256 public rewardRate = 10; // 10% simple reward

    constructor(address _token) {
        token = ArunToken(_token);
    }

    function stake(uint256 _amount) external {
        require(_amount > 0, "Invalid amount");

        token.transferFrom(msg.sender, address(this), _amount);

        stakes[msg.sender].amount += _amount;
        stakes[msg.sender].time = block.timestamp;
    }

    function calculateReward(address user) public view returns (uint256) {
        StakeInfo memory s = stakes[user];

        uint256 timeStaked = block.timestamp - s.time;

        return (s.amount * rewardRate * timeStaked) / (100 * 1 days);
    }

    function withdraw() external {
        StakeInfo memory s = stakes[msg.sender];

        uint256 reward = calculateReward(msg.sender);
        uint256 total = s.amount + reward;

        stakes[msg.sender].amount = 0;

        token.transfer(msg.sender, total);
    }
}
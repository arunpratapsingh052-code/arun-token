// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Vesting
 * @dev A contract for token vesting with a cliff and linear release period.
 */
contract Vesting is Ownable {
    
    ERC20 public token;
    
    struct VestingSchedule {
        uint256 totalAmount;
        uint256 releasedAmount;
        uint256 startTime;
        uint256 cliffDuration;
        uint256 vestingDuration;
    }
    
    mapping(address => VestingSchedule) public vestingSchedules;
    
    event VestingScheduleCreated(address indexed beneficiary, uint256 amount, uint256 startTime);
    event TokensReleased(address indexed beneficiary, uint256 amount);
    
    constructor(address _tokenAddress) Ownable(msg.sender) {
        token = ERC20(_tokenAddress);
    }
    
    /**
     * @dev Create a vesting schedule for a beneficiary
     */
    function createVestingSchedule(
        address beneficiary,
        uint256 amount,
        uint256 cliffDuration,
        uint256 vestingDuration
    ) external onlyOwner {
        require(beneficiary != address(0), "Invalid beneficiary address");
        require(amount > 0, "Amount must be greater than 0");
        require(vestingDuration > 0, "Vesting duration must be greater than 0");
        
        vestingSchedules[beneficiary] = VestingSchedule({
            totalAmount: amount,
            releasedAmount: 0,
            startTime: block.timestamp,
            cliffDuration: cliffDuration,
            vestingDuration: vestingDuration
        });
        
        emit VestingScheduleCreated(beneficiary, amount, block.timestamp);
    }
    
    /**
     * @dev Get the releasable amount for a beneficiary
     */
    function getReleasableAmount(address beneficiary) public view returns (uint256) {
        VestingSchedule storage schedule = vestingSchedules[beneficiary];
        
        if (block.timestamp < schedule.startTime + schedule.cliffDuration) {
            return 0;
        }
        
        uint256 timeElapsed = block.timestamp - schedule.startTime;
        uint256 totalVestingTime = schedule.cliffDuration + schedule.vestingDuration;
        
        if (timeElapsed >= totalVestingTime) {
            return schedule.totalAmount - schedule.releasedAmount;
        }
        
        uint256 vestedAmount = (schedule.totalAmount * (timeElapsed - schedule.cliffDuration)) / schedule.vestingDuration;
        return vestedAmount - schedule.releasedAmount;
    }
    
    /**
     * @dev Release vested tokens to the beneficiary
     */
    function releaseTokens() external {
        address beneficiary = msg.sender;
        uint256 releasableAmount = getReleasableAmount(beneficiary);
        
        require(releasableAmount > 0, "No tokens to release");
        
        vestingSchedules[beneficiary].releasedAmount += releasableAmount;
        token.transfer(beneficiary, releasableAmount);
        
        emit TokensReleased(beneficiary, releasableAmount);
    }
}

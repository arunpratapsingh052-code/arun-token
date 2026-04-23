const hre = require("hardhat");

async function main() {
  const tokenAddress = "0x8CF0F67B2Ce1E1ca9e319361f803Aec26398a8F3";

  const Staking = await hre.ethers.getContractFactory("Staking");
  const staking = await Staking.deploy(tokenAddress);

  await staking.deployed();

  console.log("Staking deployed to:", staking.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
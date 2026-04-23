const hre = require("hardhat");

async function main() {
  const Token = await hre.ethers.getContractFactory("ArunToken");
  const token = await Token.deploy();

  await token.deployed();

  console.log("ArunToken deployed to:", token.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

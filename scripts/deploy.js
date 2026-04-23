async function main() {
  const Token = await ethers.getContractFactory("ArunToken");

  const token = await Token.deploy();

  await token.waitForDeployment();

  console.log("Token deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
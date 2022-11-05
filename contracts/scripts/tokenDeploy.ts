import { ethers } from "hardhat";

async function main() {
  const etnTokenFactory = await ethers.getContractFactory("ETNToken");
  const etnToken = await etnTokenFactory.deploy("ETN Token", "ETN");

  await etnToken.deployed();
  console.log("ETN Token deployed to : ", etnToken.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

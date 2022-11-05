import { ethers } from "hardhat";

async function main() {
  const etnTokenFactory = await ethers.getContractFactory("ETNToken");
  const etnToken = await etnTokenFactory.deploy("ETN Token", "ETN");

  await etnToken.deployed();

  console.log("ETN Token deployed to : ", etnToken.address);

  const etnNFTFactory = await ethers.getContractFactory("ETNNFT");
  const etnNFT = await etnNFTFactory.deploy(
    ["ETONA1", "ETONA2"], // キャラクターの名前
    [
      "QmVrQkY9n954Cij9ZggUbyzGwd3g5Rw3ZKF2aPVQnLMG2k", // キャラクターの画像
      "QmdAvNdJZTLHfqQkDeMRrg39uHVq5bS7u1vKsc3bNH5Ewo",
    ],
    [100, 200], // キャラクターのHP
    [100, 50], // キャラクターの攻撃力
    "Legendary ETONA", // Bossの名前
    "QmcLs8qRgNHsPD2itSvPryzAdESGujKkKqFR3r4MUQ8vHZ", // Bossの画像
    10000, // Bossのhp
    50 // Bossの攻撃力
  )

  await etnNFT.deployed();

  console.log("ETN NFT deployed to : ", etnNFT.address);

  const rewardFactory = await ethers.getContractFactory("Reward");
  const reward = await rewardFactory.deploy(etnToken.address);
  console.log("Reward deployed to : ", reward.address);

  const totalSupply = await etnToken.totalSupply();
  console.log("totalSupply : ", totalSupply);
  await etnToken.increaseAllowance(reward.address, totalSupply);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

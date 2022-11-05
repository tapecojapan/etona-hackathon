import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("ETNToken", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployETNTokenFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const etnTokenFactory = await ethers.getContractFactory("ETNToken");
    const etnToken = await etnTokenFactory.deploy("ETN Token", "ETN");

    return { etnToken, owner, otherAccount };
  }

  async function deployETNNFTFixture() {
    const [owner, otherAccount] = await ethers.getSigners();
    const { etnToken } = await loadFixture(deployETNTokenFixture);

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
    );

    const rewardFactory = await ethers.getContractFactory("Reward");
    const reward = await rewardFactory.deploy(etnToken.address);

    return { etnToken, etnNFT, reward, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should mint initial supply to owner", async function () {
      const { etnToken, etnNFT, owner, otherAccount } = await loadFixture(deployETNNFTFixture);

      const totalSupply = await etnToken.totalSupply();
      const decimals = await etnToken.decimals();
      console.log(`Token Decimals: ${decimals}\n`);
      console.log(`Total Supply in ETN: ${ethers.utils.formatUnits(totalSupply, decimals)}\n`);

      // initialSuppliesがownerBalanceとおなじかどうか
      //expect(totalSupply).to.equal(ownerBalance);
    });

    it("allowance of account A to account B should return righr value", async function () {
      const { etnToken, etnNFT, owner, otherAccount } = await loadFixture(deployETNNFTFixture);

      expect(
        await etnToken.allowance(otherAccount.address, owner.address)
      ).to.be.equal(0);

      expect(
        await etnToken.allowance(owner.address, otherAccount.address)
      ).to.be.equal(0);
    });



    /*it("Should ower transfer to user", async function () {
      const { etnToken, etnGame, owner, otherAccount } = await loadFixture(deployETNGameFixture);
      const amount = 1

      const initialSupplies = await etnToken.totalSupply();
  
      let txn = await etnGame.connect(otherAccount).rewardETN(amount);
      await txn.wait();
      console.log(owner.address)

      const ownerBalance = await etnGame.getBalance(owner.address);
      const otherAccountBalance =  await etnGame.getBalance(otherAccount.address);

      console.log(ownerBalance)
      console.log(otherAccountBalance)
      expect(amount).to.equal(otherAccountBalance);
    });*/
  });

  describe("TransferFrom", function () {
    it("transfer should revert if amount exceeds balance", async function () {
      const { etnToken, etnNFT, owner, otherAccount } = await loadFixture(deployETNNFTFixture);
      const initialSupplies = await etnToken.totalSupply();

      await expect(etnToken.transfer(otherAccount.address, initialSupplies.add(1))).to.be
        .reverted;
    });

    it("transfer", async function () {
      //transfer()amountのトークンをfromアドレスからアドレスに移動しtoます。
      const { etnToken, etnNFT, owner, otherAccount } = await loadFixture(deployETNNFTFixture);
      const symbol = await etnToken.symbol();
      const decimals = await etnToken.decimals();
      const ownerAddress = owner.address;
      const recipientAddress = otherAccount.address;
      const transferAmount = 100000;
      console.log(`Transferring ${transferAmount} ${symbol} tokens to ${recipientAddress} from ${ownerAddress}`);
      await etnToken.transfer(recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), decimals));
      console.log('Transfer completed');
      let ownerBalance = await etnToken.balanceOf(ownerAddress);
      console.log(`Balance of owner (${ownerAddress}): ${ethers.utils.formatUnits(ownerBalance, decimals)} ${symbol}`);
      let recipientBalance = await etnToken.balanceOf(recipientAddress);
      console.log(`Balance of recipient (${recipientAddress}): ${ethers.utils.formatUnits(recipientBalance, decimals)} ${symbol}\n`);

      //approve()呼び出し元のトークンを超えるamount許容値として設定します。spender
      console.log(`Setting allowance amount of spender over the caller\'s ${symbol} tokens...`);
      const approveAmount = 10000;
      console.log(`This example allows the contractOwner to spend up to ${approveAmount} of the recipient\'s ${symbol} token`);
      const signerContract = etnToken.connect(otherAccount); // Creates a new instance of the contract connected to the recipient
      await signerContract.approve(ownerAddress, ethers.utils.parseUnits(approveAmount.toString(), decimals));
      console.log(`Spending approved\n`);

      //allowance()owner使用できるトークンの残りの金額を返しますspender。
      console.log(`Getting the contracOwner spending allowance over recipient\'s ${symbol} tokens...`);
      let allowance = await etnToken.allowance(recipientAddress, ownerAddress);
      console.log(`contractOwner Allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);

      //transferFrom()amountのトークンをfromアドレスからアドレスに移動しtoます。
      const transferFromAmount = 100;
      console.log(`contracOwner transfers ${transferFromAmount} ${symbol} from recipient\'s account into own account...`);
      await etnToken.transferFrom(recipientAddress, ownerAddress, ethers.utils.parseUnits(transferFromAmount.toString(), decimals));
      ownerBalance = await etnToken.balanceOf(ownerAddress);
      console.log(`New owner balance (${ownerAddress}): ${ethers.utils.formatUnits(ownerBalance, decimals)} ${symbol}`);
      recipientBalance = await etnToken.balanceOf(recipientAddress);
      console.log(`New recipient balance (${recipientAddress}): ${ethers.utils.formatUnits(recipientBalance, decimals)} ${symbol}`);
      allowance = await etnToken.allowance(recipientAddress, ownerAddress);
      console.log(`Remaining allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);

    });


    it("transferFrom should work correctly", async function () {
      const { etnToken, etnNFT, owner, otherAccount } = await loadFixture(deployETNNFTFixture);
      const totalSupply = await etnToken.totalSupply();
      const symbol = await etnToken.symbol();
      const decimals = await etnToken.decimals();
      const ownerAddress = owner.address;
      const recipientAddress = otherAccount.address;
      const transferAmount = 100000;
      const amount = ethers.utils.parseUnits(transferAmount.toString(), decimals)

      const rewardFactory = await ethers.getContractFactory("Reward");
      const reward = await rewardFactory.deploy(etnToken.address);
      console.log(reward.address);

      let ownerbalance = await reward.balanceOf(ownerAddress);
      console.log(ownerbalance);

      const signerContract = reward.connect(otherAccount);

      await etnToken.increaseAllowance(reward.address, totalSupply)

      await signerContract.claimReward();
      ownerbalance = await reward.balanceOf(recipientAddress);
      console.log(ownerbalance);
    });
  });
});

import { useEffect, useState } from "react";
import { BigNumber, ethers } from "ethers";
import ETNTokenArtifact from "@/utils/ETNToken.json";
import ETNNFTArtifact from "@/utils/ETNNFT.json";
import RewardArtifact from "@/utils/Reward.json";
import { TokenType } from "@/models/TokenType";
import { NFTType } from "@/models/NFTType";
import { RewardType } from "@/models/RewardType";
import { useRecoilState } from "recoil";
import { characterState } from "@/states/atoms/Character";
import { ETNToken as ETNTokenContractType } from "@contracts/typechain-types";
import { ETNNFT as ETNNFTContractType } from "@contracts/typechain-types";
import { Reward as RewardContractType } from "@contracts/typechain-types";
import { getEthereum } from "@/utils/ethereum";
import { NFTItem } from "@/models/NFTItem";

export const ETNTokenAddress =
  process.env.NEXT_PUBLIC_ETN_TOKEN_CONTRACT_ADDRESS;
export const ETNNFTAddress = process.env.NEXT_PUBLIC_ETN_NFT_CONTRACT_ADDRESS;
export const RewardAddress = process.env.NEXT_PUBLIC_REWARD_CONTRACT_ADDRESS;

type ReturnUseContract = {
  etn: TokenType | null;
  nft: NFTType | null;
  reward: RewardType | null;
};

export const useContract = (
  currentAccount: string | undefined
): ReturnUseContract => {
  const [etn, setETN] = useState<TokenType | null>(null);
  const [nft, setNFT] = useState<NFTType | null>(null);
  const [reward, setReward] = useState<RewardType | null>(null);
  const [character, setCharacter] = useRecoilState(characterState);
  const ethereum = getEthereum();

  const getContract = (
    contractAddress: string,
    abi: ethers.ContractInterface,
    storeContract: (_: ethers.Contract) => void
  ) => {
    if (!ethereum) {
      console.log("Ethereum object doesn't exist!");
      return;
    }
    if (!currentAccount) {
      // ログインしていない状態でコントラクトの関数を呼び出すと失敗するため
      // currentAccountがundefinedの場合はcontractオブジェクトもundefinedにします。
      console.log("currentAccount doesn't exist!");
      return;
    }
    try {
      // @ts-ignore: ethereum as ethers.providers.ExternalProvider
      const provider = new ethers.providers.Web3Provider(ethereum);
      const signer = provider.getSigner(); // 簡易実装のため, 引数なし = 初めのアカウント(account#0)を使用する
      const Contract = new ethers.Contract(contractAddress, abi, signer);
      storeContract(Contract);
    } catch (error) {
      console.log(error);
    }
  };

  const generateETN = async (contract: ETNTokenContractType) => {
    try {
      const symbol = await contract.symbol();
      setETN(<TokenType>{ symbol: symbol, contract: contract });
    } catch (error) {
      console.log(error);
    }
  };

  const generateNFT = async (contract: ETNNFTContractType) => {
    try {
      const symbol = await contract.symbol();
      setNFT(<NFTType>{ symbol: symbol, contract: contract });

      const txn = await contract.checkIfUserHasNFT();
      if (txn.name) {
        console.log("User has character NFT");
        const ch: NFTItem = {
          name: txn.name,
          imageURI: txn.imageURI,
          hp: txn.hp.toNumber(),
          maxHp: txn.maxHp.toNumber(),
          attackDamage: txn.attackDamage.toNumber(),
        };
        setCharacter(ch);
      } else {
        console.log("No character NFT found");
      }
    } catch (error) {
      console.log(error);
    }
  };

  const generateReward = async (contract: RewardContractType) => {
    try {
      setReward(<RewardType>{ contract: contract });
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    getContract(
      ETNTokenAddress ?? "",
      ETNTokenArtifact.abi,
      (Contract: ethers.Contract) => {
        generateETN(Contract as ETNTokenContractType);
      }
    );
    getContract(
      ETNNFTAddress ?? "",
      ETNNFTArtifact.abi,
      (Contract: ethers.Contract) => {
        generateNFT(Contract as ETNNFTContractType);
      }
    );
    getContract(
      RewardAddress ?? "",
      RewardArtifact.abi,
      (Contract: ethers.Contract) => {
        generateReward(Contract as RewardContractType);
      }
    );
  }, [ethereum, currentAccount]);

  return {
    etn,
    nft,
    reward,
  };
};

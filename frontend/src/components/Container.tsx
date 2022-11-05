import { useState, useEffect } from "react";
import { useContract } from "@/hooks/useContract";
import { useCharacter } from "@/hooks/useCharacter";
import { NFTCard } from "@/components/NFTCard";

type Props = {
  currentAccount: string | undefined;
};

export const Container = ({ currentAccount }: Props) => {
  //const stakeAmount = ethers.utils.parseEther("100000");
  const { etn, nft, reward } = useContract(currentAccount);
  const { character, characters } = useCharacter(currentAccount);
  const [mintingCharacter, setMintingCharacter] = useState(false);

  const claimReward = async () => {
    await reward?.contract.claimReward();
  };

  const mintCharacterNFTAction = (characterId: number) => async () => {
    console.log("gea");
    try {
      if (nft?.contract) {
        setMintingCharacter(true);
        console.log("Minting character in progress...");
        const mintTxn = await nft?.contract.mintCharacterNFT(characterId);
        await mintTxn.wait();
        console.log("mintTxn:", mintTxn);
        setMintingCharacter(false);
      }
    } catch (error) {
      console.warn("MintCharacterAction Error:", error);
      setMintingCharacter(false);
    }
  };

  return (
    <>
      <div>{`ETN Address: ${etn?.contract.address}`}</div>
      <div>{`NFT Address: ${nft?.contract.address}`}</div>
      <div>{`Reward Address: ${reward?.contract.address}`}</div>

      {characters && !character && (
        <section className="max-w-[1200px] my-20 mx-auto grid grid-cols-3 md:grid-cols-2 gap-4 font-body  overflow-hidden top-7 md:gap-5 medium md:px-5 sm:grid-cols-1 sm:h-full relative justify-center items-center ">
          {characters.map((value, index) => (
            <div key={index + value.name}>
              <NFTCard character={value} set={mintCharacterNFTAction(index)} />
            </div>
          ))}
        </section>
      )}

      {character && (
        <section className="max-w-[1200px] my-20 mx-auto grid grid-cols-1 gap-4 font-body  overflow-hidden top-7 md:gap-5 medium md:px-5 sm:grid-cols-1 sm:h-full relative justify-center items-center ">
          <div>あなたのNFT</div>
          <NFTCard character={character} />
        </section>
      )}
      <div className="w-full flex justify-center items-center">
        <button
          type="button"
          className="bg-[#1E50FF] text-white outline-none border-none py-3 px-5 rounded-xl font-body cursor-pointer transition duration-250 ease-in-out hover:scale-125 hover:drop-shadow-xl hover:shadow-sky-600 w-auto focus:scale-90"
          onClick={claimReward}
        >
          勝利しましたのでETNを貰う
        </button>
      </div>
    </>
  );
};

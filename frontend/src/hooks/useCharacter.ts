import { useState, useEffect } from "react";
import { BigNumber, ethers } from "ethers";
import { getEthereum } from "@/utils/ethereum";
import { useContract } from "@/hooks/useContract";
import { useRecoilState, useRecoilValue } from "recoil";
import { characterState } from "@/states/atoms/Character";
import { charactersState } from "@/states/atoms/Characters";
import { NFTItem } from "@/models/NFTItem";

type ReturnUseContract = {
  character: NFTItem | null;
  characters: NFTItem[] | null;
};

export const useCharacter = (
  currentAccount: string | undefined
): ReturnUseContract => {
  const ethereum = getEthereum();
  const { etn, nft, reward } = useContract(currentAccount);
  const [character, setCharacter] = useRecoilState(characterState);
  const [characters, setCharacters] = useRecoilState(charactersState);

  const getCharacters = async () => {
    try {
      console.log("Getting contract characters to mint");
      // ミント可能な全 NFT キャラクター をコントラクトをから呼び出します。
      const charactersTxn = await nft?.contract.getAllDefaultCharacters();

      console.log("charactersTxn:", charactersTxn);

      if (!charactersTxn) {
        return;
      }

      // すべてのNFTキャラクターのデータを変換します。
      const characters: NFTItem[] = charactersTxn.map((data) => {
        return {
          name: data.name,
          imageURI: data.imageURI,
          hp: data.hp.toNumber(),
          maxHp: data.maxHp.toNumber(),
          attackDamage: data.attackDamage.toNumber(),
        };
      });

      // ミント可能なすべてのNFTキャラクターの状態を設定します。
      setCharacters(characters);
    } catch (error) {
      console.error("Something went wrong fetching characters:", error);
    }
  };

  const onCharacterMint = async (
    sender: string,
    tokenId: BigNumber,
    characterIndex: BigNumber
  ) => {
    console.log(
      `CharacterNFTMinted - sender: ${sender} tokenId: ${tokenId.toNumber()} characterIndex: ${characterIndex.toNumber()}`
    );
    // NFT キャラクターが Mint されたら、コントラクトからメタデータを受け取り、アリーナ（ボスとのバトルフィールド）に移動するための状態に設定します。
    if (nft?.contract) {
      const characterNFT = await nft.contract.checkIfUserHasNFT();
      console.log("CharacterNFT: ", characterNFT);
      const ch: NFTItem = {
        name: characterNFT.name,
        imageURI: characterNFT.imageURI,
        hp: characterNFT.hp.toNumber(),
        maxHp: characterNFT.maxHp.toNumber(),
        attackDamage: characterNFT.attackDamage.toNumber(),
      };
      setCharacter(ch);
      alert(
        `NFT キャラクーが Mint されました -- リンクはこちらです: https://testnets.opensea.io/assets/${
          nft.contract.address
        }:${tokenId.toNumber()}?tab=details`
      );
    }
  };

  useEffect(() => {
    if (nft?.contract) {
      getCharacters();
      // リスナーの設定：NFT キャラクターが Mint された通知を受け取ります。
      nft?.contract.on("CharacterNFTMinted", onCharacterMint);
    }

    return () => {
      // コンポーネントがマウントされたら、リスナーを停止する。
      if (nft?.contract) {
        nft?.contract.off("CharacterNFTMinted", onCharacterMint);
      }
    };
  }, [nft]);

  return {
    character,
    characters,
  };
};

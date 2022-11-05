import { atom } from "recoil";
import { NFTType } from "@/models/NFTType";

export const nftState = atom<NFTType | null>({
  key: "nftState",
  default: null,
});

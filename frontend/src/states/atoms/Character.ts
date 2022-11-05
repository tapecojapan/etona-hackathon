import { atom } from "recoil";
import { NFTItem } from "@/models/NFTItem";

export const characterState = atom<NFTItem | null>({
  key: "characterState",
  default: null,
});

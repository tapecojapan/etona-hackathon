import { atom } from "recoil";
import { NFTItem } from "@/models/NFTItem";

export const charactersState = atom<NFTItem[] | null>({
  key: "charactersState",
  default: null,
});

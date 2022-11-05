import { atom } from "recoil";
import { TokenType } from "@/models/TokenType";

export const etnState = atom<TokenType | null>({
  key: "etnState",
  default: null,
});

import { atom } from "recoil";
import { RewardType } from "@/models/RewardType";

export const rewardState = atom<RewardType | null>({
  key: "rewardState",
  default: null,
});

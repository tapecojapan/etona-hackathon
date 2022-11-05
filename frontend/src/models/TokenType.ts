import { ETNToken as ETNTokenContractType } from "@contracts/typechain-types";

export type TokenType = {
  symbol: string;
  contract: ETNTokenContractType;
};

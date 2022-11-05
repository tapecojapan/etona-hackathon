import { NFTItem } from "@/models/NFTItem";
import { NFTType } from "@/models/NFTType";

interface Props {
  character: NFTItem;
  set?: () => Promise<void>;
}

export const NFTCard = ({ set, character }: Props) => {
  const handleClick = () => {
    if (!set) {
      return;
    }
    set();
  };

  return (
    <div>
      <div
        className="w-full h-full ssm:h-max bg-black/20 rounded-2xl flex flex-col p-6 sm:h-max cursor-pointer"
        onClick={() => {}}
      >
        <div className="relative transition duration-150 ease-in-out delay-150">
          <img
            src={`https://cloudflare-ipfs.com/ipfs/${character.imageURI}`}
            alt="mock"
            className="w-full h-[352px] ssm:h-max rounded-2xl object-contain"
          />
          {set && (
            <div className="absolute top-0 left-0  bg-white/40  backdrop-blur-xl w-full h-full z-[20] rounded-2xl opacity-0 hover:opacity-100">
              <div className="flex items-center justify-center h-full ">
                <button
                  className="bg-[#1E50FF] outline-none border-none py-3 px-5 rounded-xl font-body cursor-pointer transition duration-250 ease-in-out hover:scale-125 hover:drop-shadow-xl hover:shadow-sky-600 w-auto "
                  onClick={() => handleClick()}
                >
                  Mint NFT
                </button>
              </div>
            </div>
          )}
        </div>
        <div className="">
          <h1>{character.name}</h1>
          <div className="h-[56px] flex justify-between">
            <div className="flex flex-row gap-2">
              <div>
                <p className="my-1 text-base">HP </p>
                <h4 className="my-0 text-xl font-bold">{character.hp}</h4>
              </div>
            </div>
            <div>
              <p className="my-1">Attack Damage</p>
              <h4 className="my-0 text-xl font-bold">
                {character.attackDamage}
              </h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

import Head from "next/head";
import type { NextPage } from "next";
import { useState } from "react";
import { useWallet } from "@/hooks/useWallet";
import { Container } from "@/components/Container";

const Home: NextPage = () => {
  const [isLoading, setIsLoading] = useState(false);
  const { currentAccount, connectWallet } = useWallet();

  return (
    <div>
      <Head>
        <title>ETONA</title>
        <meta name="description" content="ETONA" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main>
        <h1 className="text-3xl">ETONA</h1>
        {currentAccount == undefined ? (
          <button
            type="button"
            className="bg-[#1E50FF] text-white outline-none border-none py-3 px-5 rounded-xl font-body cursor-pointer transition duration-250 ease-in-out hover:scale-125 hover:drop-shadow-xl hover:shadow-sky-600 w-auto focus:scale-90"
            onClick={connectWallet}
          >
            {" "}
            Connect to wallet{" "}
          </button>
        ) : (
          <div> {"Connected to " + currentAccount} </div>
        )}
        {currentAccount && <Container currentAccount={currentAccount} />}
      </main>
    </div>
  );
};

export default Home;

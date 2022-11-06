# ETONA Hardhat Project

```shell
npx hardhat help
npx hardhat test
npx hardhat node

npx hardhat run scripts/deploy.ts --network goerli
or
npx hardhat run scripts/deploy.ts --network mumbai
```

.envを追加して下記の内容を入れる  
Polygon、goerliはどちらかでok  
ALCHEMY_GOERLI_URL=[your alchemy goerli url]  
ACCOUNT_PRIVATE_KEY=[your wallet private key]  
ALCHEMY_MUMBAI_URL=[your alchemy Polygon TESTNET url]  

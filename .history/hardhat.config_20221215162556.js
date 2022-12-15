require("@nomiclabs/hardhat-waffle");
require('dotenv').config()
const key = process.env.private_key;
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: 'https://eth-goerli.g.alchemy.com/v2/6g06GB5CXUioPUlc6OyL9eaN5Xc-XMQ2',
      accounts: '1e6c5740326922d5decb5ff617feffb3fda2b3815d88c22a94704eaf6dd39bf6
    }
  }
};

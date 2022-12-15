const main = async () => {
  const contractFactory = await ethers.getContractFactory('MultiSigWallet');
  const contract = await contractFactory.deploy();
  await contract.deployed();

  console.log("Contract deployed to: ", contract.address);
}
// Contract deployed to:  0x92E05ff8EfD64eAEaFf1b3A952cFe8e1fE31034f
const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

runMain();
//
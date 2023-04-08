require("hardhat-gas-reporter")
require("@nomiclabs/hardhat-truffle5")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.10",

  
gasReporter:{
  currency:"USD",
  gasPrice:25,
  token:"ETH"
  
}
};


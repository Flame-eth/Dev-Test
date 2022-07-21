const dataStore = artifacts.require("dataStore");

module.exports = function (deployer) {
  deployer.deploy(dataStore);
};

// const Election = artifacts.require("Election");

// module.exports = function (deployer) {
//   deployer.deploy(Election);
// };

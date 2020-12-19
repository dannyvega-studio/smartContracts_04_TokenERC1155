const Token = artifacts.require('TutorialERC1155.sol');

module.exports = function(deployer) {
    deployer.deploy(Token);
};
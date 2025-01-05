const migraion = Artifacts.require("migraion");

module.exports = function (deployer) {
    deployer.deploy(migraion);
};
const expenseManagerContractMigration = Artifacts.require("ExpenseManagerContract");


module.exports = function(deployer) {
    deployer.deploy(expenseManagerContractMigration);
};
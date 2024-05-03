const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("mainModule", (m) => {
  const main = m.contract("main", JAN_1ST_2030);


  
  return { main};
});

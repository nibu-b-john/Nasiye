var mysql = require("mysql");
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "../.env") });
var pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: process.env.DATABASE_PASS,
  database: "nasiye",
});

pool.getConnection((err) => {
  console.log(err);
});

module.exports = pool;

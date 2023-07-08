const express = require("express");
const app = express();
var cors = require("cors");
const authentication = require("./routes/security_routes");
app.use(cors());
app.use(express.json());
app.use(authentication);
app.listen(3000, () => {
  console.log("Server listening on port number 3000");
});

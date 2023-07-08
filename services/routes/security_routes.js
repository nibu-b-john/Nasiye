const express = require("express");
const router = express.Router();
const { authenticate, verify } = require("../controllers/security_controllers");

router.post("/verify", verify);
router.post("/security/authenticate", authenticate);

module.exports = router;

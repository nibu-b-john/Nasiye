const express = require("express");
const router = express.Router();
const {
  getToken,
  profiling,
  aoc,
  subscribe,
  unsubscribe,
} = require("../controllers/api_controllers");

router.post("/api/profiling", getToken, profiling);
router.post("/api/aoc", aoc);
router.post("/api/subscribe", getToken, subscribe);
router.post("/api/unsubscribe", getToken, unsubscribe);

module.exports = router;

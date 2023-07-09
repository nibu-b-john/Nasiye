var jwt = require("jsonwebtoken");
const db = require("../utils/sqlDatabase");
// require("dotenv").config();
exports.getToken = (req, res, next) => {
  const bearerHeader = req.headers["authorization"];
  if (bearerHeader == undefined) {
    res.sendStatus(403);
  } else {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];
    req.token = bearerToken;
    try {
      jwt.verify(bearerToken, `${process.env.ACCESS_TOKEN}`);
      next();
    } catch {
      res.json({
        message: "token expired",
        status: 404,
      });
    }
  }
};
exports.profiling = (req, res, next) => {
  const msisdn = req.body.msisdn;
  const offer = req.body.offer;
  db.query(
    `SELECT ${offer} FROM users WHERE user=?;`,
    [msisdn],
    (err, results) => {
      if (err) {
        console.log(err);
        res.json({ error: err });
      }
      if (results.length == 0) {
        res.json({
          message: "No User with this username found",
          status: 404,
        });
      } else {
        const columnName = Object.keys(results[0])[0];
        const resultValue = results[0][columnName];
        if (resultValue == 1) {
          res.json({
            errorCode: `${resultValue}`,
            errorMsg: "NO SUBSCRIPTION FORProfileQuery",
            result: "FAIL",
          });
        } else if (resultValue == 0) {
          res.json({
            errorCode: `${resultValue}`,
            errorMsg: "You are subscribed FORProfileQuery",
            result: "SUCCESS",
          });
        }
      }
    }
  );
};

exports.aoc = (req, res, next) => {
  const servicetype = req.body.servicetype;
  const langid = req.body.langid;
  db.query(
    `SELECT message, price FROM aoc_details WHERE servicetype=?;`,
    [servicetype],
    (err, results) => {
      if (err) {
        console.log(err);
        res.json({ error: err });
      } else {
        if (results.length == 0) {
          res.json({
            message: "No such service found!",
            status: 404,
          });
        } else {
          res.json({
            message: results[0].message,
            price: results[0].price,
          });
        }
      }
    }
  );
};

exports.subscribe = (req, res, next) => {
  const msisdn = req.body.msisdn;
  const offer = req.body.offer;
  const langid = req.body.langid;

  db.query(
    `UPDATE users
    SET ${offer} = 0
    WHERE user = ?;`,
    [msisdn],
    (err, results) => {
      if (err) {
        console.log(err);
        res.json({ error: err });
      }
      if (results.length == 0) {
        res.json({
          message: "No User with this username found",
          status: 404,
        });
      } else {
        if (results.changedRows == 0) {
          res.json({
            message: "User has already Subscribed",
          });
        } else {
          res.json({
            msisdn: msisdn,
            errorCode: "0",
            result: "SUCCESS",
          });
        }
      }
    }
  );
};
exports.unsubscribe = (req, res, next) => {
  const msisdn = req.body.msisdn;
  const offer = req.body.offer;
  const langid = req.body.langid;

  db.query(
    `UPDATE users
  SET ${offer} = 1
  WHERE user = ?;`,
    [msisdn],
    (err, results) => {
      if (err) {
        console.log(err);
        res.json({ error: err });
      }
      if (results.length == 0) {
        res.json({
          message: "No User with this username found",
          status: 404,
        });
      } else {
        if (results.changedRows == 0) {
          res.json({
            message: "User has already unSubscribed",
          });
        } else {
          res.json({
            msisdn: msisdn,
            errorCode: "0",
            result: "SUCCESS",
          });
        }
      }
    }
  );
};
// {"msisdn": "252613346921",  "langid" : "en", "offer":"crbt" }

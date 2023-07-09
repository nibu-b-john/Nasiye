var jwt = require("jsonwebtoken");
const db = require("../utils/sqlDatabase");

// exports.verify = (req, res, next) => {
//   const token = req.body.token;
//   var decoded = jwt.verify(token, `${process.env.ACCESS_TOKEN}`);
//   console.log(decoded);
//   res.json({ type_of_login: decoded.type_of_user });
// };

exports.authenticate = (req, res, next) => {
  var username = req.body.username;
  var password = req.body.password;
  console.log(username, password);
  db.query(
    `SELECT user, password FROM users WHERE user=?;`,
    [username],
    (err, results) => {
      if (err) {
        console.log(err);
      }
      console.log(results);
      if (results.length == 0) {
        res.json({
          message: "No User with this username found",
          status: 404,
        });
      } else {
        if (password == results[0].password) {
          console.log("Successfully logged in");
          var token = jwt.sign(
            { user: username, password: password },
            `${process.env.ACCESS_TOKEN}`
          );

          res.json({
            message: "SUCCESS",
            username: username,
            token: token,
            status: 200,
          });
        } else {
          console.log("incorrect password");
          res.json({
            message: "Incorrect Password",
            status: 401,
          });
        }
      }
    }
  );
  //   console.log(registerNumber, password);
};

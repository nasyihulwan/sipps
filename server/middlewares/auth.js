const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "Access denied!, no auth token." });

    const isverified = jwt.verify(token, "passwordKey");
    if (!isverified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });

    req.user = isverified.id;
    req.token = token;
    next();
  } catch (e) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = auth;

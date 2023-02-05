// IMPORT FROM PACKAGES
const express = require("express");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

// INIT
const port = 3000;
const app = express();

// MIDDLEWARE
app.use(authRouter);

app.listen(port, () => {
  console.log("connected at port " + port);
});

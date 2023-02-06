// IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

// INIT
const port = 3000;
const app = express();
const DB =
  "mongodb+srv://nasyih:nasyihulwannas1103@cluster0.itotmen.mongodb.net/?retryWrites=true&w=majority";

// MIDDLEWARE
app.use(express.json());
app.use(authRouter);

// CONNECTIONS
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successfull");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(port, "0.0.0.0", () => {
  console.log("connected at port " + port);
});

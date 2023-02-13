// IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();

// IMPORTS FROM OTHER FILES
const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// INIT
const port = process.env.port || 3000;
const app = express();
const DB =
  "mongodb+srv://nasyih:nasyihulwannas1103@cluster0.itotmen.mongodb.net/?retryWrites=true&w=majority";

// MIDDLEWARE
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// CONNECTIONS
mongoose.set("strictQuery", false);
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successfull");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(port, () => {
  console.log("connected at port " + port);
});

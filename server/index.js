const express = require("express");
const port = 3000;

const app = express();

app.listen(port, "0.0.0.0", function () {
  console.log("connected at port " + port);
});

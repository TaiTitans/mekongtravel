const express = require('express');
const authRouter = express.Router(); // Create a router instance
module.exports = authRouter;
authRouter.get('/user', (req, res) => {
  res.send("Hello")
});



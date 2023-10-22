const express = require('express');
const body_parser = require('body-parser');
const app = express();
const userRouter = require('./routers/user.router');

app.use(body_parser.json());
app.use('/', userRouter); // Sử dụng router tại '/user'

module.exports = app;

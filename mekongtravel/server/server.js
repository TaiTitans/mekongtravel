const express = require('express');
const app = require('./src/app');
const port = 3000;
const UserModel = require('./src/model/user.model');
const db = require('./src/config/db');

app.get('/', (req, res) => {
    res.send('Hello');
});

app.listen(port, () => {
    console.log(`Server Listening on http://localhost:${port}`);
});

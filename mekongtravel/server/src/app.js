const express = require('express');
const body_parser = require('body-parser');
const app = express();
const userRouter = require('./routers/user.router');
const TinhThanh = require('./model/tinhthanh.model');


app.use(body_parser.json());
app.use('/', userRouter); // Sử dụng router tại '/user'

// get TinhThanh

app.get('/api/tinhthanh', async (req, res) => {
    try {
        const tinhThanhs = await TinhThanh.find();
        res.json(tinhThanhs);
    } catch (error) {
        res.status(500).json({ error: 'Server error' });
    }
});




module.exports = app;

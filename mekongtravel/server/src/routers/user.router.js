const router = require('express').Router();
const UserController = require('../controller/user.controller');
router.post('/registration', UserController.register);

module.exports = router; // Thay vì module.exports = app;


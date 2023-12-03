const router = require('express').Router();
const UserController = require('../controller/user.controller');

// Các routes khác
router.post('/registration', UserController.register);
router.post('/login', UserController.login);

// Route đăng xuất
router.post('/logout', UserController.logout);

module.exports = router;

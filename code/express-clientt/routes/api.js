const express = require('express');
const { getUsers, getUserDataByUsername }  = require('../controllers/userController');
const router = express.Router();

router.get('/users', getUsers);
router.get('/getUserData', getUserDataByUsername); // New endpoint for fetching user data by username
module.exports = router;

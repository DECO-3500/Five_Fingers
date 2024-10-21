const pool = require('../config/db');
const express = require('express');
const { getUsers, getUserDataByUsername, getPlaces,getPersonData,getPartner,getUserExploreDataByUsername}  = require('../controllers/userController');
const router = express.Router();

const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json()); // 解析 JSON 请求体
router.get('/users', getUsers);
router.get('/getUserData', getUserDataByUsername); // New endpoint for fetching user data by username
router.get('/getPlaces', getPlaces)
router.get('/getPersonData',getPersonData);
router.get('/partner',getPartner);
router.get('/getUserExplore',getUserExploreDataByUsername);


// 查询关注状态
router.get('/checkFollow', async (req, res) => {
    const { username, bloggerId } = req.query;

    try {
        const [result] = await pool.query(
            'SELECT * FROM focus WHERE username = ? AND bloger = ?',
            [username, bloggerId]
        );

        res.json({ isFollowing: result.length > 0 });
    } catch (err) {
        console.error('查询关注状态失败:', err);
        res.status(500).json({ message: '查询失败' });
    }
});












module.exports = router;

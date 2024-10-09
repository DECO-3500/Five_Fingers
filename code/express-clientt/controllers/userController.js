const pool = require('../config/db');

const getUsers = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM user_info'); // 假设有一个名为 users 的表
        res.json(rows);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getUserDataByUsername = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM user_info WHERE username = ?', [req.query.username]);
        if (rows.length === 0) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json(rows[0]); // Send back the user data
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};



module.exports = { getUsers,getUserDataByUsername };

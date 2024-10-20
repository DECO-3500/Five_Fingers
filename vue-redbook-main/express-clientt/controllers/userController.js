const pool = require('../config/db');

const getUsers = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM user_info'); // 假设有一个名为 users 的表
        res.json(rows);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getPartner= async (req, res) => {
    try {
      const username = req.query.username; // 获取查询参数中的 username
  
      if (!username) {
        return res.status(400).json({ message: "Username parameter is required." });
      }
  
      const [rows] = await pool.query('SELECT * FROM user_info WHERE username != ?', [username]);
      res.json(rows);
  
    } catch (error) {
      console.error("Error fetching users:", error); // 记录错误信息到控制台
      res.status(500).json({ message: "Error fetching users." }); // 向客户端返回更通用的错误信息
    }
  };


const getUserDataByUsername = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM user_info WHERE username = ? ', [req.query.username]);
        console.log(rows);
        if (rows.length === 0) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json(rows[0]); // Send back the user data
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};









const getPersonData = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM login WHERE username = ?', [req.query.username]);
        if (rows.length === 0) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json(rows[0]); // Send back the user data
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};




const getPlaces= async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM place_info'); // 假设有一个名为 users 的表
        res.json(rows);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const addUserInfo = async (req, res) => {
    const { title, content, imagePath } = req.body; // 从请求体中获取数据

    try {
        const result = await pool.query(
            'INSERT INTO user_info (title, content, image_path) VALUES (?, ?, ?)', 
            [title, content, imagePath]
        );
        res.status(201).json({ message: '用户信息添加成功', id: result[0].insertId });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};



const getUserExploreDataByUsername = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM user_info WHERE username = ? AND caption = ?', [req.query.username,req.query.caption]);
        if (rows.length === 0) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json(rows[0]); // Send back the user data
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const login = async (req, res) => {
    try {
      const { username, password } = req.body;
      console.log(req.body);
  
      if (!username || !password) {
        return res.status(400).json({ success: false, message: 'Both username and password are required' });
      }
  
      const [rows] = await pool.query(
        'SELECT * FROM login WHERE username = ? AND password = ?', 
        [username, password]
      );
  
      if (rows.length === 0) {
        return res.status(401).json({ success: false, message: 'Invalid username or password' });
      }
  
      res.json({ success: true, message: 'Login successful' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ success: false, message: 'An error occurred while logging in', error: error.message });
    }
  };



module.exports = { getUsers,getUserDataByUsername,getPlaces,getPersonData,getPartner,getUserExploreDataByUsername,login };

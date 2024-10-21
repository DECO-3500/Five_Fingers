const express = require('express');
const apiRoutes = require('./routes/api');
const path = require('path');
const app = express();
const multer = require('multer');
const cors = require('cors');
const fs = require('fs');
const PORT = process.env.PORT || 3000;
const pool = require('./config/db');
const { Console } = require('console');
const router = express.Router();
// 设置静态文件目录
app.use('/images', express.static(path.join(__dirname, 'assets/images')));
// 使用路由
app.use('/api', apiRoutes);

app.use(cors());
app.use(express.json({ limit: '10mb' })); // 支持大数据体
app.use(express.urlencoded({ extended: true }));



app.get('/api/images/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets/images', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});

app.get('/api/author_avatars/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets/author_avatars', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});

app.get('/api/places/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets/places', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});

app.get('/api/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});


app.get('/api/flights/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets/flights/', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});


app.get('/api/groups/:imageName', (req, res) => {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, 'assets/groups/', imageName);

    // 发送图片文件
    res.sendFile(imagePath, (err) => {
        if (err) {
            res.status(err.status).end();
        }
    });
});

app.post('/api/uploadNote', async (req, res) => {
    const { title, content, image, username } = req.body;

    // 保存图片
    const base64Data = image.replace(/^data:image\/\w+;base64,/, "");
    const fileName = `${Date.now()}.png`; // 使用时间戳作为文件名
    const filePath = path.join(__dirname, 'assets/images', fileName);

    try {
        // 保存图片到文件系统
        await fs.promises.writeFile(filePath, base64Data, 'base64');
        
        // 查询用户头像
        const [avatarResult] = await pool.query(
            'SELECT img_src FROM login WHERE username = ?',
            [username]
        );
        const [redId] = await pool.query('SELECT red_id FROM login WHERE username = ?', [username]);
        console.log(redId[0].red_id);

        if (avatarResult.length > 0) {
            const authorAvatar = avatarResult[0].img_src;
            console.log(authorAvatar)

            // 插入数据到数据库
            
            console.log(redId);
            const [result] = await pool.query(
                'INSERT INTO user_info (caption, content, images, username, author_avatar,red_id) VALUES (?, ?, ?, ?, ?,?)', 
                [title, content, "images/" + fileName, username, authorAvatar,redId[0].red_id]
            );

            // 返回成功响应
            res.json({ message: 'Success', id: result.insertId, title, content, imagePath: filePath, username });
        } else {
            // 处理未找到用户名的情况
            res.status(404).json({ message: 'Username not found' });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Fail' });
    }
});

app.post('/api/login',async (req, res) => {
    console.log(req.body);
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
  });



app.post('/api/updateUserData', async (req, res) => {
    const { username, password, sex, description, age, img_src, red_id } = req.body;

    console.log('Updating user:', username);

    let fileName = null;
    
    // 如果有图片，则处理图片
    if (img_src) {
        const base64Data = img_src.replace(/^data:image\/\w+;base64,/, ""); // 清理 base64 数据头
        fileName = `${Date.now()}.png`; // 使用时间戳作为文件名
        const filePath = path.join(__dirname, 'assets', fileName); // 设置保存路径

        try {
            // 保存图片到文件系统
            await fs.promises.writeFile(filePath, base64Data, 'base64');
        } catch (err) {
            console.error('Error saving image:', err);
            return res.status(500).json({ message: 'Fail' });
        }
    }

    // 更新用户信息
    try {


if(img_src){
    const updateQuery = `
    UPDATE login 
    SET username = ?, password = ?, sex = ?, description = ?, age = ?, img_src = ?
    WHERE red_id = ?
`;

    const params = [
        username,
        password,
        sex,
        description,
        age,
        fileName, // 如果有 img_src，则添加到参数中
        red_id
    ];
    await pool.query(updateQuery, params);
    console.log("执行带图片");
}else{
    const updateQuery = `
    UPDATE login 
    SET username = ?, password = ?, sex = ?, description = ?, age = ?
    WHERE red_id = ?
`;

    const params = [
        username,
        password,
        sex,
        description,
        age,
       // 如果有 img_src，则添加到参数中
        red_id
    ];
    await pool.query(updateQuery, params);
    console.log("执行未带图片");

}

            const [avatarResult] = await pool.query(
                'SELECT img_src FROM login WHERE username = ?',
                [username]
            );
        const updatExplore = `
        UPDATE user_info
        SET username = ?,author_avatar = ?
        WHERE red_id = ? 
    `;
        const updatExploreparams = [
            username,
            avatarResult[0].img_src,
            red_id
        ];

        await pool.query(updatExplore, updatExploreparams);
        res.json({ message: 'Success' });
    } catch (err) {
        console.error('Error updating user:', err);
        res.status(500).json({ message: 'Fail' });
    }
});

// 关注用户
app.post('/follow', async (req, res) => {
    const { username, bloggerId } = req.body;

    try {
        await pool.query(
            'INSERT INTO focus (username, bloger成功) VALUES (?, ?)',
            [username, bloggerId]
        );
        res.json({ message: 'Follow' });
    } catch (err) {
        console.error('Fail', err);
        res.status(500).json({ message: 'Fail' });
    }
});

// 取消关注用户
app.post('/unfollow', async (req, res) => {
    const { username, bloggerId } = req.body;

    try {
        await pool.query(
            'DELETE FROM focus WHERE username = ? AND bloger = ?',
            [username, bloggerId]
        );
        res.json({ message: 'Success' });
    } catch (err) {
        console.error('Fail', err);
        res.status(500).json({ message: 'Fail' });
    }
});




















app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

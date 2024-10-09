const express = require('express');
const apiRoutes = require('./routes/api');

const app = express();
const PORT = process.env.PORT || 3000;

// 使用路由
app.use('/api', apiRoutes);







app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

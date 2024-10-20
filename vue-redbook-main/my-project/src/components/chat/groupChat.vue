
<template>
    <div class="chat-container">
      <div class="sidebar">
        <h3>Online chatroom</h3>
        <ul>
          <li v-for="(user, index) in onlineUsers" :key="index" :class="{ offline: !user.online }">
            <img :src="user.avatar" class="user-avatar" />
            <span>{{ user.name }}</span>
            <span class="status" :class="{ online: user.online, offline: !user.online }"></span>
          </li>
        </ul>
      </div>
      <div class="chat-area">
        <div class="chat-title">
          <h3>{{ flightNumber }} - {{ flightDate }}</h3>
        </div>
        <div class="chat-box">
          <div v-for="(message, index) in messages" :key="index" class="message">
            <div class="message-content" :class="{ 'user-message': message.sender === 'user', 'bot-message': message.sender === 'bot' }">
              <router-link v-if="message.sender === 'bot'" :to="`/userProfile?username=${username}`">
                <img :src="botAvatar" class="avatar" />
              </router-link>
              <div class="text">{{ message.text }}</div>
              <img v-if="message.sender === 'user'" :src="userAvatar" class="avatar" />
            </div>
          </div>
        </div>
        <div class="input-box">
          <input
            v-model="inputMessage"
            type="text"
            placeholder="Type here..."
            @keyup.enter="sendMessage"
          />
          <button @click="sendMessage">Send</button>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  
  // Message record
  const messages = ref([
    { sender: 'bot', text: 'Hello！' }
  ]);
  
  // 用户输入
  const inputMessage = ref('');
  
  // 用户数据
  const username = ref(localStorage.getItem('username') || '');
  const userData = ref(null);
  const error = ref(null);
  const loading = ref(false);
  
  // 头像路径
  const userAvatar = ref('22'); // 默认用户头像路径
  const botAvatar = ref('http://localhost:3000/api/groups/QQ图片20241013014017.png'); // 默认机器人头像路径
  
  // 航班信息从 URL 获取
  const flightNumber = ref('');
  const flightDate = ref('');
  
  // 在线用户列表（示例数据）
  const onlineUsers = ref([
    { name: 'Passenger1', avatar: 'http://localhost:3000/api/groups/QQ图片20241013014017.png', online: true },
    { name: 'Passenger2', avatar: 'http://localhost:3000/api/groups/QQ图片20241013014036.png', online: true },
    { name: 'Passenger3', avatar: 'http://localhost:3000/api/groups/QQ图片20241013014114.png', online: false },
    { name: 'Passenger4', avatar: 'http://localhost:3000/api/groups/QQ图片20241013014528.png', online: true },
  ]);
  
  // 发送消息函数
  function sendMessage() {
    if (inputMessage.value.trim() !== '') {
      // 添加用户消息
      messages.value.push({ sender: 'user', text: inputMessage.value });
  
      // 模拟机器人回复
      setTimeout(() => {
        messages.value.push({ sender: 'bot', text: 'I am very happy to be on the same flight as you.' + inputMessage.value });
      }, 500);
  
      // 清空输入框
      inputMessage.value = '';
    }
  }
  
  // 获取个人数据
  const fetchPersonData = async () => {
    if (!username.value) {
      error.value = 'Username not found in localStorage';
      return;
    }
  
    loading.value = true;
    error.value = null;
  
    try {
      const response = await axios.get('/api/api/getPersonData', {
        params: { username: username.value }
      });
      userData.value = response.data;
      userAvatar.value = `http://localhost:3000/api/${response.data.img_src}`;
    } catch (err) {
      error.value = err.response?.data?.message || 'An error occurred while fetching user data';
      console.error('Error fetching user data:', err);
    } finally {
      loading.value = false;
    }
  };
  
  onMounted(() => {
    fetchPersonData();
  });
  </script>
  
  <style scoped>
  .chat-container {
    display: flex;
    width: 800px;
    height: 60%;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
  }
  
  .sidebar {
    width: 200px;
    border-right: 1px solid #ccc;
    padding: 10px;
    background-color: #f9f9f9;
  }
  
  .sidebar h3 {
    margin-bottom: 10px;
  }
  
  .sidebar ul {
    list-style: none;
    padding: 0;
  }
  
  .sidebar li {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
  }
  
  .user-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }
  
  .status {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    margin-left: auto;
  }
  
  .online {
    background-color: green;
  }
  
  .offline {
    background-color: gray;
  }
  
  .chat-area {
    flex: 1;
    display: flex;
    flex-direction: column;
  }
  
  .chat-title {
    padding: 10px;
    background-color: #f0f0f0;
    text-align: center;
    border-bottom: 1px solid #ccc;
  }
  
  .chat-box {
    flex: 1;
    padding: 10px;
    overflow-y: auto;
    border-bottom: 1px solid #ccc;
  }
  
  .message {
    margin-bottom: 10px;
  }
  
  .message-content {
    display: flex;
    align-items: center;
    max-width: 100%;
  }
  
  .avatar {
    width: 40px; /* 头像宽度 */
    height: 40px; /* 头像高度 */
    border-radius: 50%;
    margin-left: 10px; /* 头像与文字的间距 */
  }
  
  .user-message {
    justify-content: flex-end; /* 用户消息靠右 */
  }
  
  .bot-message {
    justify-content: flex-start; /* 机器人消息靠左 */
  }
  
  .text {
    background-color: #e1f5fe; /* 用户消息背景色 */
    padding: 8px;
    border-radius: 4px;
    word-wrap: break-word; /* 处理长文本 */
  }
  
  .bot-message .text {
    background-color: #e0e0e0; /* 机器人消息背景色 */
  }
  
  .input-box {
    display: flex;
    padding: 5px;
    background-color: #fff;
  }
  
  input[type="text"] {
    flex: 1;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  
  button {
    margin-left: 5px;
    padding: 5px 10px;
    background-color: #4caf50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  button:hover {
    background-color: #45a049;
  }
  </style>
  

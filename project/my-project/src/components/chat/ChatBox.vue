<template>
  <div class="chat-container">
    <div class="chat-box">
      <div v-for="(message, index) in messages" :key="index" class="message">
        <div class="message-content" :class="{ 'user-message': message.sender === 'user', 'bot-message': message.sender === 'bot' }">
          <router-link :to="`/userProfile?username=${username}`">
            <img v-if="message.sender === 'bot'" :src="botAvatar" class="avatar" />
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
        placeholder="Leave your message here..."
        @keyup.enter="sendMessage"
      />
      <button @click="sendMessage">Send</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import axios from 'axios';

// 消息记录
const messages = ref([
  { sender: 'bot', text: 'Hello' }
]);

// 用户输入
const inputMessage = ref('');

// 头像路径
const route = useRoute();
const username = ref('');
const userData = ref(null);
const error = ref(null);

// 头像路径
const userAvatar = ref('path/to/user-avatar.png'); // 默认用户头像路径
const botAvatar = ref('path/to/bot-avatar.png');   // 默认机器人头像路径

// 发送消息函数
// 发送消息函数
function sendMessage() {
  if (inputMessage.value.trim() !== '') {
    // 添加用户消息
    messages.value.push({ sender: 'user', text: inputMessage.value });

    // 打印用户输入
    const userInput = inputMessage.value.toLowerCase();
    console.log(userInput); // 打印用户输入

    // 模拟机器人回复
    setTimeout(() => {
      let botResponse = '';

      // 简单的话术逻辑
      if (userInput.includes('hello')) {
        botResponse = 'Hello,nice to meet you';
      } else if (userInput.includes('old')) {
        botResponse = 'I am 22 years old';
      } else if (userInput.includes('rom')) {
        botResponse = 'I am from Australia';
      } else if (userInput.includes('with')) {
        botResponse = 'Sure, that is my pleasure! ！';
      } else {
        botResponse = 'Sorry i cant underdtand,try to type some other words.';
      }

      messages.value.push({ sender: 'bot', text: botResponse });
    }, 500);
    
    // 清空输入框
    inputMessage.value = '';
  }
}

const fetchUserData = async () => {
  username.value = route.query.username;
  if (!username.value) {
    error.value = 'Username not found in URL';
    return;
  }
  
  try {
    const response = await axios.get('/api/api/getUserData', {
      params: { username: username.value }
    });
    userData.value = response.data;
    botAvatar.value = `http://localhost:3000/api/${response.data.author_avatar}`;

  } catch (err) {
    error.value = err.response?.data?.message || 'An error occurred while fetching user data';
  }
};

const fetchPersonData = async () => {
  if (!username.value) {
    error.value = 'Username not found in URL';
    return;
  }
  
  try {
    const response = await axios.get('/api/api/getPersonData', {
      params: { username: localStorage.getItem('username') }
    });
    userData.value = response.data;
    userAvatar.value = `http://localhost:3000/api/${response.data.img_src}`;
  } catch (err) {
    error.value = err.response?.data?.message || 'An error occurred while fetching user data';
    console.error('Error fetching user data:', err);
  }
};

onMounted(async () => {
  await Promise.all([fetchUserData(), fetchPersonData()]);
});
</script>

<style scoped>
.chat-container {
  display: flex;
  flex-direction: column;
  width: 600px;
  height: 60%;
  border: 1px solid #ccc;
  border-radius: 8px;
  overflow: hidden;
}

.chat-box {
  flex: 1;
  padding: 10px;
  overflow-y: auto;
  height: 300px;
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

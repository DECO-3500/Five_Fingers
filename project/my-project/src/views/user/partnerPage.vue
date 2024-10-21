<template>
    <div class="grid-container">
      <div v-for="(item, index) in users" :key="index" class="grid-item">
        <img :src="`http://localhost:3000/api/${item.author_avatar}`" :alt="`${item.username}'s avatar`"> 
        <div class="place-info">
          <h3>{{ item?.username}}</h3>
          <p>Address: {{ item.ip }}</p>
          <div style="display: flex; align-items: center; width: 100%;">
            <div>
              <p>
                <svg t="1728630175375" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1566" width="40" height="40">
                  <path d="M512 901.746939c-13.583673 0-26.122449-4.179592-37.093878-13.061225-8.881633-7.314286-225.697959-175.020408-312.424489-311.379592C133.746939 532.37551 94.040816 471.24898 94.040816 384.522449c0-144.718367 108.146939-262.269388 240.326531-262.269388 67.395918 0 131.657143 30.82449 177.632653 84.636735 45.453061-54.334694 109.191837-84.636735 177.110204-84.636735 132.702041 0 240.326531 117.55102 240.326531 262.269388 0 85.159184-37.093878 143.673469-67.395919 191.216327l-1.044898 1.567346c-86.726531 136.359184-303.542857 304.587755-312.424489 311.379592-10.44898 8.359184-22.987755 13.061224-36.571429 13.061225z" fill="#E5404F" p-id="1567"></path>
                </svg>
              </p>
            </div>
            <div>{{ item.likes }} like</div>
            <div style="margin-left: 10px; flex: 1;">
              <p>Distance: 200 km</p>
            </div>
            <router-link :to="`chat?username=${item.username}`">

            
            <div style="margin-left: 10px;">
              <svg t="1728630045266" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10599" width="40" height="40">
                <path d="M512 0c282.8 0 512 229.2 512 512s-229.2 512-512 512S0 794.8 0 512 229.2 0 512 0z" fill="#E9E9FF" p-id="10600"></path>
                <path d="M511.8 268.3c-142.9 0-258.5 101.5-258.5 226.5 0 71.3 38.1 135.1 97 176.5v114.5l113.4-68.6c15.7 2.6 31.7 4.1 48.5 4.1 142.9 0 258.5-101.1 258.5-226.5s-116-226.5-258.9-226.5z" fill="#FFFFFF" p-id="10601"></path>
                <path d="M511.8 462.3c-17.9 0-32.5 14.5-32.5 32.5 0 17.9 14.5 32.5 32.5 32.5 17.9 0 32.5-14.5 32.5-32.5 0-17.9-14.6-32.5-32.5-32.5zM382.7 462.3c-17.9 0-32.5 14.5-32.5 32.5 0 17.9 14.5 32.5 32.5 32.5 17.9 0 32.5-14.5 32.5-32.5-0.4-17.9-14.6-32.5-32.5-32.5zM641.3 462.3c-17.9 0-32.5 14.5-32.5 32.5 0 17.9 14.5 32.5 32.5 32.5s32.5-14.5 32.5-32.5c-0.1-17.9-14.6-32.5-32.5-32.5z" fill="#4545FF" p-id="10602"></path>
              </svg>
            </div>
        </router-link>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  

  
  const users = ref([]); // 假设你从 API 获取用户数据并赋值给这个变量

  const fetchUsers = async () => {
  try {
    const response = await axios.get('/api/api/partner', {
      params: { username: localStorage.getItem('username') }
    });
    users.value = response.data;
  } catch (error) {
    console.error('Error fetching users:', error);
  }
};

  onMounted(fetchUsers);
  </script>
  
  <style scoped>
  .grid-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 每行四个 */
    gap: 16px; /* 网格间距 */
    padding: 16px; /* 内边距 */
  }
  
  .grid-item {
    background: #f9f9f9; /* 项目背景 */
    border: 1px solid #ddd; /* 边框 */
    border-radius: 8px; /* 圆角 */
    padding: 10px; /* 内部填充 */
    display: flex;
    flex-direction: column; /* 垂直排列内容 */
    align-items: center; /* 水平居中 */
  }
  
  .grid-item img {
    width: 100%; /* 图片宽度 */
    height: auto; /* 自适应高度 */
    border-radius: 4px; /* 圆角 */
  }
  
  .place-info {
    text-align: center; /* 文本居中 */
  }
  </style>
  
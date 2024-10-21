<template>
    <div class="common-layout">
      <el-container class="container">
        <el-aside class="aside">
            <asidePage></asidePage>


        </el-aside>
        <el-container>
            <el-header class="header">
                <div class="search">
                    <headerPage></headerPage>
                </div>
            
            </el-header>


          <el-main class="main">
            <router-view :info="parentmsg" :users="users"></router-view>
          </el-main>
        </el-container>
      </el-container>

    </div>
  </template>
  
  <script setup>

import { ref, onMounted } from 'vue';
import axios from 'axios';
//   import mainPage from '../../components/index/mainPage.vue'; // 根据文件路径引入组件
  import asidePage from '../../components/index/asidePage.vue';
  import headerPage from '../../components/index/headerPage.vue'; 
  const users = ref([]); // 假设你从 API 获取用户数据并赋值给这个变量

  const fetchUsers = async () => {
    try {
      const response = await axios.get('/api/api/users');
      users.value = response.data;
    } catch (error) {
      console.error('Error fetching users:', error);
    }
  };

  onMounted(fetchUsers);




  </script>
  
  <style scoped>
  .common-layout {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
  }
  
  .container {
    height: 100vh; /* 使容器高度占满整个视口 */
    width: 100vw; /* 使容器宽度占满整个视口 */
  }
  
  .aside {
    width: 280px; /* 侧边栏宽度 */

  }
  
  .header {
    height: 90px; /* 头部高度 */
    border-radius: 30px;
    color: white; /* 文字颜色 */
    display: flex;
    align-items: center;
    padding: 0 20px; /* 内边距 */

  }
  
  .main {
    padding: 20px; 
    overflow-y: auto; /* 允许垂直滚动 */
  }

  .title{
    margin-left:30px;
    font-size: 24px;
    font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji, BlinkMacSystemFont, Helvetica Neue, Arial, PingFang SC, PingFang TC, PingFang HK, Microsoft Yahei, Microsoft JhengHei;
    border-radius: 30px;
    color:#fff;
    background-color: red;
    min-width: fit-content;
    width: 60px;
    margin-top:20px;
  }

  a {
  text-decoration: none; /* 去掉下划线 */
  color: inherit; /* 继承父元素的颜色 */
}

.search{
    border-radius: 20px;
}
  </style>
  
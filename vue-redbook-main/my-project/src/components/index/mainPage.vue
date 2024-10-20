<template>
  <div class="content-container">

    <ul>
      <li v-for="user in users" :key="user.id">
        <div class="content-img"  @click="showDialog = true">
          <router-link :to="`expLore?username=${user.username}&caption=${user.caption}`">
            <img :src="`http://localhost:3000/api/${user.images}`" alt="User Image" />
          </router-link>

        </div>



      <div class="content-title">       
        {{ user.caption }}
      </div>     
      <div class="contentlist"  @click="goToNewPage(user.username)">

          <img :src="`http://localhost:3000/api/${user.author_avatar}`" :alt="`${user.username}'s avatar`"> 
          <div class="contentlist-name">
            {{ user.username }}
          </div>

        <div>
          <svg style="width: 18px;height: 18px"  t="1728254539398" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4235" width="200" height="200"><path d="M523.733333 841.024l33.173334-32.576 99.690666-97.813333c70.976-69.632 120.32-117.973333 138.709334-135.893334 59.008-57.514667 93.248-121.28 99.626666-184.234666 6.250667-61.44-15.488-119.744-61.589333-164.672-44.992-43.84-98.88-61.909333-157.034667-52.906667-49.365333 7.616-101.034667 34.624-150.016 78.848a21.333333 21.333333 0 0 1-28.586666 0c-48.981333-44.224-100.650667-71.232-150.016-78.869333-58.154667-8.96-112.042667 9.088-157.034667 52.928-46.101333 44.928-67.84 103.210667-61.610667 164.693333 6.4 62.933333 40.64 126.72 99.648 184.213333a100207.573333 100207.573333 0 0 1 145.92 142.826667l24.256 23.765333L512 852.522667l11.733333-11.498667z m-11.733333 11.52l-1.493333 1.429333A2.133333 2.133333 0 0 1 512 853.333333c0.512 0 1.045333 0.213333 1.493333 0.64l-1.493333-1.450666z m157.781333-721.792c71.637333-11.093333 138.901333 11.477333 193.344 64.533333 55.317333 53.930667 81.834667 124.992 74.282667 199.530667-7.466667 73.642667-46.549333 146.368-112.32 210.474667-18.346667 17.898667-67.669333 66.218667-138.453333 135.637333-31.829333 31.232-65.706667 64.448-99.84 97.984L553.6 871.466667l-13.184 12.949333a40.554667 40.554667 0 0 1-56.832 0l-114.602667-112.64-24.213333-23.722667a677626.346667 677626.346667 0 0 0-145.856-142.762666C133.141333 541.184 94.08 468.48 86.613333 394.816c-7.552-74.538667 18.944-145.6 74.282667-199.530667 54.442667-53.056 121.706667-75.605333 193.344-64.533333 53.162667 8.213333 107.093333 34.688 157.781333 76.949333 50.709333-42.24 104.618667-68.736 157.781334-76.949333z" fill="#3D3D3D" p-id="4236"></path></svg>
          <span>{{ user.likes }}</span>
        </div>
      </div>
      </li>
    </ul>
  </div>
</template>

<script setup>
import {defineProps, toRefs } from 'vue';
// import axios from 'axios';
import { useRouter } from 'vue-router';

const props = defineProps({
  users: Array, // 接收父组件传来的 users 数据
});
const {  users } = toRefs(props); // 解构 props


// 获取 router 实例
const router = useRouter();

// 定义跳转函数
const goToNewPage = (username) => {
  router.push('/userProfile?username='+username); // 跳转到新页面
};





</script>


<style scoped>

.content-container ul{
  width: 100%;
  margin: auto;
  column-count: 4;
  column-gap: 10px;
}


.content-container ul li{
  background-color: #fff;
  margin-bottom: 10px;
  break-inside: avoid;
}

.content-img img{
  height: 100%;
  width: 100%;
  object-fit: cover;
  border-radius: 10px;
}

.content-title{
  font-weight: 600;
  margin: 5px 10px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  /* -webkit-line-clamp: 2; */
  overflow: hidden;
}


.contentlist{
  display: flex;
  align-items: center;
  padding: 10px;
}

.contentlist img{
  width: 20px;
  height: 20px;
  border-radius: 20%;
  margin-right: 5px;
}

.contentlist-name {
  font-size: 12px;
  color: #5c5c5c;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  flex: 1;

}


.aixin{
  color: #5c5c5c;
  display: flex;
  align-items: center;
}

.aixin svg{
  font-size: 18px;
}
</style>




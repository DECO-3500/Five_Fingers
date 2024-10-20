<template>
  <div class="explore">
    <div class="left">
      <img 
        :src="`http://localhost:3000/api/${userData.images}`" 
        alt="User Image" 
        class="user-image" 
        v-if="userData" 
      />
    </div>

    <div class="right">
      <div class="inline" v-if="userData">
        <router-link :to="`/userProfile?username=${userData.username}`">
          <div class="author_avatar">
            <img 
              :src="`http://localhost:3000/api/${userData.author_avatar}`" 
              alt="User Image" 
              class="user-image" 
            />
          </div>
        </router-link>

        <div class="ava_username">
          {{ userData.username }}
        </div>
        <div class="concern" @click="toggleFollow">
          <el-button :type="isFollowing ? 'success' : 'danger'" round>
            {{ isFollowing ? 'Following' : 'Follow' }}
          </el-button>
        </div>
      </div>

      <div style="margin-left: 60px;">
        <h3>{{ userData?.caption }}</h3>
      </div>

      
      <div style="margin-left: 60px;">
        <div v-html="userData?.content"></div>
      </div>



      <div class="post" style="margin-left: 60px;display: flex; align-items: center;align-content: center;">
        <div>
          Edited by 2 days ago {{ userData?.ip }}
        </div>

        <div @click="toggleIcon" style="padding-left: 20px">
          <svg v-if="isFirstIcon" class="icon" viewBox="0 0 1024 1024" width="30" height="30">
            <path d="M512 901.746939c-13.583673 0-26.122449-4.179592-37.093878-13.061225-8.881633-7.314286-225.697959-175.020408-312.424489-311.379592C133.746939 532.37551 94.040816 471.24898 94.040816 384.522449c0-144.718367 108.146939-262.269388 240.326531-262.269388 67.395918 0 131.657143 30.82449 177.632653 84.636735 45.453061-54.334694 109.191837-84.636735 177.110204-84.636735 132.702041 0 240.326531 117.55102 240.326531 262.269388 0 85.159184-37.093878 143.673469-67.395919 191.216327l-1.044898 1.567346c-86.726531 136.359184-303.542857 304.587755-312.424489 311.379592-10.44898 8.359184-22.987755 13.061224-36.571429 13.061225z" fill="#E5404F"></path>
          </svg>
          <svg v-else class="icon" viewBox="0 0 1024 1024" width="30" height="30">
            <path d="M517.12 943.48288l-11.28448-13.93664c-1.75104-2.17088-176.6912-218.05056-279.808-316.88704-51.456-49.31584-81.50016-83.23072-100.48512-113.36704-24.576-39.03488-27.42272-90.66496-27.42272-126.11584 0-152.32 110.19264-276.23424 245.64736-276.23424 65.10592 0 127.3856 29.25568 173.35296 80.85504 45.95712-51.59936 108.2368-80.85504 173.35296-80.85504 135.45472 0 245.63712 123.91424 245.63712 276.23424 0 35.44064-2.83648 87.07072-27.42272 126.11584-18.98496 30.1568-49.02912 64.07168-100.48512 113.36704-103.12704 98.84672-278.04672 314.71616-279.808 316.88704L517.12 943.48288zM343.76704 125.96224c-119.4496 0-216.61696 110.8992-216.61696 247.20384 0 31.8464 2.37568 77.96736 22.95808 110.65344 17.64352 28.02688 46.34624 60.29312 96 107.8784 89.09824 85.4016 230.33856 256.09216 271.01184 305.75616 40.67328-49.67424 181.9136-220.3648 271.01184-305.75616 49.63328-47.57504 78.336-79.83104 96-107.86816 20.5824-32.69632 22.95808-78.80704 22.95808-110.65344 0-136.30464-97.1776-247.20384-216.61696-247.20384-61.66528 0-120.6784 30.40256-161.8944 83.4048L517.12 224.1024l-11.45856-14.73536c-41.216-53.00224-100.22912-83.4048-161.8944-83.4048z"></path>
          </svg> 
          {{ likeCount }}
        </div>

        <div @click="toggleStore" style="margin-left: 20px;">
          <svg v-if="isFirstStore" class="icon" viewBox="0 0 1024 1024" width="30" height="30">
            <path d="M720.398507 959.573333c73.045333 31.317333 136.96-15.317333 129.706666-94.293333l-20.650666-226.218667 174.634666-199.722666c38.144-43.648 19.2-102.229333-37.418666-115.114667l-258.474667-58.794667-135.68-228.010666c-29.738667-49.877333-91.306667-49.92-121.045333 0L315.74784 265.429333 57.273173 324.224C0.953173 337.066667-18.33216 395.648 19.854507 439.338667l174.634666 199.722666-24.021333 264.405334c-5.248 57.770667 44.544 94.037333 97.877333 71.125333l243.626667-104.533333 208.426667 89.472z" fill="#3D3D3D"></path>
          </svg>
          
          <svg v-else class="icon" viewBox="0 0 1024 1024" width="30" height="30">
            <path d="M282.766507 610.432L100.494507 401.92 370.361173 340.48 512.014507 102.656l141.610666 237.909333 269.824 61.397334-182.272 208.512 27.306667 300.757333a42.666667 42.666667 0 0 0 84.992-7.722667l-24.021333-264.405333 174.634666-199.722667c38.144-43.648 19.2-102.229333-37.418666-115.114666l-258.474667-58.794667-135.68-228.010667c-29.738667-49.877333-91.306667-49.92-121.045333 0L315.74784 265.429333 57.273173 324.224C0.953173 337.066667-18.33216 395.648 19.854507 439.338667l174.634666 199.722666-24.021333 264.405334c-5.248 57.770667 44.544 94.037333 97.877333 71.125333l260.48-111.786667a42.666667 42.666667 0 1 0-33.706666-78.378666L257.721173 886.314667l25.045334-275.882667z" fill="#3D3D3D"></path>
          </svg>
          {{ storeCount }}
        </div>

        <div style="margin-left: 20px;">
            <svg t="1728713409060" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6649" width="30" height="30"><path d="M157.568 751.296c-11.008-18.688-18.218667-31.221333-21.802667-37.909333A424.885333 424.885333 0 0 1 85.333333 512C85.333333 276.362667 276.362667 85.333333 512 85.333333s426.666667 191.029333 426.666667 426.666667-191.029333 426.666667-426.666667 426.666667a424.778667 424.778667 0 0 1-219.125333-60.501334 2786.56 2786.56 0 0 0-20.053334-11.765333l-104.405333 28.48c-23.893333 6.506667-45.802667-15.413333-39.285333-39.296l28.437333-104.288z m65.301333 3.786667l-17.258666 63.306666 63.306666-17.258666a32 32 0 0 1 24.522667 3.210666 4515.84 4515.84 0 0 1 32.352 18.944A360.789333 360.789333 0 0 0 512 874.666667c200.298667 0 362.666667-162.368 362.666667-362.666667S712.298667 149.333333 512 149.333333 149.333333 311.701333 149.333333 512c0 60.586667 14.848 118.954667 42.826667 171.136 3.712 6.912 12.928 22.826667 27.370667 47.232a32 32 0 0 1 3.338666 24.714667z m145.994667-70.773334a32 32 0 1 1 40.917333-49.205333A159.189333 159.189333 0 0 0 512 672c37.888 0 73.674667-13.173333 102.186667-36.885333a32 32 0 0 1 40.917333 49.216A223.178667 223.178667 0 0 1 512 736a223.178667 223.178667 0 0 1-143.136-51.690667z" fill="#000000" p-id="6650"></path></svg>1022
          </div>

      </div>

      <div class="comment" style="width: 100%; height: 20%;">
        <comMentVue></comMentVue>
      </div>
    </div>
  </div>
</template>

<script setup>
import comMentVue from "../../components/comment/comMent.vue";
import axios from 'axios';
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';

const username = ref('');
const caption= ref('');
const userData = ref(null);
const error = ref(null);
const route = useRoute();

const isFollowing = ref(false);
const isFirstIcon = ref(true);
const isFirstStore = ref(true);
const likeCount = ref(60); // 初始化点赞数
const storeCount = ref(100); // 初始化收藏数
const hasLiked = ref(false); // 新增变量用于判断是否已点赞
const hasCount=ref(false);
const toggleIcon = () => {
  if (hasLiked.value) {
    likeCount.value += 1; // 如果已点赞，则减少1
  } else {
    likeCount.value -= 1; // 如果未点赞，则增加1
  }
  hasLiked.value = !hasLiked.value; // 切换状态
  isFirstIcon.value = !isFirstIcon.value; // 切换图标
};

const toggleStore = () => {
  if (hasCount.value) {
    storeCount.value += 1; // 如果已点赞，则减少1
  } else {
    storeCount.value -= 1; // 如果未点赞，则增加1
  }
  hasCount.value = !hasCount.value; // 切换状态
  isFirstStore.value = !isFirstStore.value; // 切换图标
};

const checkFollowStatus = async () => {
  try {
    const response = await axios.get('/api/api/checkFollow', {
      params: {
        username: localStorage.getItem('username'),
        bloggerId: username.value
      }
    });
    
    isFollowing.value = response.data.isFollowing; // 假设返回 { isFollowing: true/false }
  } catch (err) {
    console.error('查询关注状态失败', err);
  }
};

// 切换关注状态
const toggleFollow = async () => {
  isFollowing.value = !isFollowing.value; // 更新状态
};

// 获取用户数据
const fetchUserData = async () => {
  username.value = route.query.username;
  caption.value =route.query.caption;
  if (!username.value) {
    error.value = 'Username not found in URL';
    return;
  }
  
  try {
    const response = await axios.get('/api/api/getUserExplore', {
      params: { username: username.value,caption: caption.value }
    });
    userData.value = response.data;
  } catch (err) {
    error.value = err.response?.data?.message || 'An error occurred while fetching user data';
    console.error('Error fetching user data:', err);
  }
};

// 初始化
onMounted(async () => {
  await fetchUserData();
  await checkFollowStatus();
});
</script>






  <style lang="scss" scoped>
  .explore {
    display: flex;
    position: relative; /* 使子元素的绝对定位相对于这个元素 */
    width: 100%; /* 确保占满可用宽度 */
    height: 100%; /* 确保占满可用高度 */
    
    .left,
    .right {
      width: 50%; /* 各占 50% */
      height: 100%; /* 占满父容器的高度 */
    //   display: flex; /* 使内容居中 */

      align-content: center;

      box-sizing: border-box; /* 确保内边距和边框包含在宽度和高度内 */
    }
    
    .left {
    //   background-color: #f0f0f0; /* 可选：背景色 */
      img{
        // object-fit: cover;
        width: 100%;
    }
    }
    
    .right {
    // align-items: center; /* 垂直居中 */
    // box-sizing: border-box; /* 包含内边距和边框在宽度内 */
    margin-left: 4%;
    //   background-color: #e0e0e0; /* 可选：背景色 */

    .inline{
        width: 100%;
        height: 90px;
        align-items: center;
        display: flex;
        .author_avatar{
        justify-content: center;

        img{
            border-radius: 50%;
            object-fit: cover;
           margin-left: 10px;
           width: 45px;
           height: 45px;
        }
      }
      .ava_username{
        font-size: 20px;
        flex: 1;
        margin-left: 20px;
      }

    }            
    }

  }
 
  </style>
  

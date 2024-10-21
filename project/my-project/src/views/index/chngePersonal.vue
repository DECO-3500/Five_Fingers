<template>
  <div class="user-profile">
      <h2>Information</h2>
      <div class="avatar-section">
        <img :src="userData.img_src" alt="Icon" class="avatar" />
        <input type="file" @change="onFileChange" accept="image/*" />
      </div>
      <div class="info-section">
        <div style="display: flex;">
          <div><label>UserName:</label></div>
          <div><input v-model="username" placeholder="Type here" /></div>         
        </div>

        <div style="display: flex">
          <div><label>Password:</label></div>
          <div><input type="password" v-model="password" placeholder="Type here" /></div>
        </div>
                  
        <div style="display: flex">
          <div><label>Gender:</label></div>
          <div>
            <select v-model="sex">
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
        </div>

        <div style="display: flex">
          <div><label>Age:</label></div>
          <div><input type="number" v-model="age" placeholder="Type here" /></div>
        </div>

        <div style="display: flex">
          <div><label>Description:</label></div>
          <div><input v-model="description" placeholder="Type here" /></div>
        </div>         
      </div>

      <div class="button-section">
          <el-button type="primary" @click="saveChanges">Save</el-button>
      </div>
      <div v-if="error" class="error">{{ error }}</div>
  </div>
</template>

<script>
import axios from 'axios';

import { ref, onMounted } from 'vue';

export default {
  setup() {
      const userData = ref({});
      const username = ref('');
      const password = ref('');
      const sex = ref('');
      const description = ref('');
      const age = ref('');
      const error = ref(null);

      const fetchUserData = async () => {
          try {
              const response = await axios.get('/api/api/getPersonData', {
                  params: { username: localStorage.getItem('username') }
              });
              userData.value = response.data;
              username.value = response.data.username;
              password.value = response.data.password;
              userData.value.img_src = "http://localhost:3000/api/" + response.data.img_src;
              sex.value = response.data.sex;
              description.value = response.data.description;
              age.value = response.data.age;
          } catch (err) {
              error.value = '获取用户数据失败';
              console.error(err);
          }
      };

      const onFileChange = (event) => {
          const file = event.target.files[0];
          if (file) {
              const reader = new FileReader();
              reader.onload = (e) => {
                  userData.value.img_src = e.target.result; // 更新头像预览
              };
              reader.readAsDataURL(file);
          }
      };

      const saveChanges = async () => {
          const updatedData = {
              username: username.value,
              password: password.value,
              sex: sex.value,
              description: description.value,
              age: age.value,
              img_src: '', // 这里将稍后填入 Base64 格式的图片
              red_id: userData.value.red_id
          };

          // 将图片转换为 Base64 格式
          const fileInput = document.querySelector('input[type="file"]');
          const file = fileInput.files[0];

          if (file) {
              const reader = new FileReader();
              reader.onload = async (e) => {
                  updatedData.img_src = e.target.result; // 将 Base64 数据填入 img_src
                  try {
                      localStorage.setItem("username",username.value);
                      await axios.post('/api/api/updateUserData', updatedData);
                      alert('Successful！');
                  } catch (err) {
                      error.value = 'Fail，plz try again';
                      console.error(err);
                  }
              };
              reader.readAsDataURL(file);
          } else {
              // 如果没有选择新的图片，直接发送其他更新的数据
              try {
                localStorage.setItem("username",username.value);
                  await axios.post('/api/api/updateUserData', updatedData);
                  alert('Successful');
              } catch (err) {
                  error.value = 'Fail，plz try again';
                  console.error(err);
              }
          }
      };

      onMounted(fetchUserData);

      return {
          userData,
          username,
          password,
          sex,
          description,
          age,
          error,
          onFileChange,
          saveChanges
      };
  }
};
</script>



<style scoped>
.user-profile {
  max-width: 400px;
  margin: auto;
}

.avatar-section {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  margin-right: 20px;
}

.info-section {
  margin-bottom: 20px;
}

.info-section label {
  display: block;
  margin-bottom: 5px;
}

.button-section {
  margin-top: 20px;
}

.error {
  color: red;
}

.info-section {
    margin-bottom: 20px;
}

.info-section > div {
    display: flex;
    align-items: center; /* 垂直居中对齐 */
    margin-bottom: 10px; /* 行间距 */
}

.info-section label {
    width: 100px; /* 设置标签的固定宽度 */
    margin-right: 15px; /* 标签与输入框之间的距离 */
    text-align: right; /* 标签右对齐 */
}

.info-section input,
.info-section select {
    flex: 1; /* 输入框占满剩余空间 */
    padding: 8px; /* 输入框内边距 */
    border: 1px solid #ccc; /* 边框样式 */
    border-radius: 4px; /* 圆角 */
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); /* 添加阴影 */
}

</style>

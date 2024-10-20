<template>
<div class="main">
  <el-form :model="formLogin" :rules="rules" ref="ruleForm" label-width="0px" class="login-bok">
    
    <el-form-item prop="username">
      <el-input v-model="formLogin.username" placeholder="Account">
        <template #prepend>
            <el-icon><User /></el-icon>
      </template>
        <!-- <i slot="prepend" class="el-icon-s-custom"/> -->
      </el-input>

    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" placeholder="Password" v-model="formLogin.password">
        <template #prepend>
            <el-icon><Lock /></el-icon>
      </template>
      </el-input>
    </el-form-item>

    <el-form-item prop="code">
      <el-row :span="24">
        <el-col :span="12">
          <el-input v-model="formLogin.code" auto-complete="off" placeholder="Please enter code" size=""></el-input>
        </el-col>
        <el-col :span="12">
          <div class="login-code" @click="refreshCode">
            <!--验证码组件-->
            <s-identify :identifyCode="identifyCode"></s-identify>
          </div>
        </el-col>
      </el-row>
    </el-form-item>

    <el-form-item label="" >
        <div class="row" >
            <div class="left">
                <el-checkbox v-model="formLogin.ElCheckbox" value="Sponsor">Agree <a href="terms">Privacy Policy</a></el-checkbox>
            </div>
            <div class="right">
                <a href="/reset_password">Forgot Password?</a>
                
            </div>
            

        </div>
    </el-form-item>


    <el-form-item>
      <div class="login-btn" @click="login"> 
        <el-button type="primary"  style="margin-left: auto;width: 291.2px;">Login</el-button>
        <!-- <el-button type="primary" @click="submitForm()" style="margin-left: 27%;width: 35%" >Register</el-button> -->
      </div>
    </el-form-item>

    <el-form-item>
        <div class="left">
            Login with Social Media
        </div>
        <div class="image">
            <img src="../../assets/images/Logo/WeChatLogo.png">
        </div>

        <div class="image">
            <img src="../../assets/images/Logo/FacebookLogo.png">
        </div>

         <div class="image">
            <img src="../../assets/images/Logo/x.png">
        </div>       

        <div class="Register">
            OR<a href="Register">Register</a>
        </div>

    </el-form-item>
  </el-form>


  <el-dialog v-model="centerDialogVisible" title="Login Verification" width="500" center >
    <span>
        Please read and agree to the Privacy Policy
    </span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="centerDialogVisible = false">Cancel</el-button>

      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="centeridentifyCode" title="Login Verification" width="500" center >
    <span>
        Please enter a valid verification code
    </span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="centeridentifyCode = false">Cancel</el-button>

      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="centerDialogUser" title="Login Verification" width="500" center >
    <span>
        Please check your password and Username
    </span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="centerDialogUser = false">Cancel</el-button>

      </div>
    </template>
  </el-dialog>


</div>
</template>
<script setup>
import { ref, onMounted } from 'vue';
import SIdentify from "../../components/SIdentify.vue";
// import DiaLog from '@/components/index/DiaLog.vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

// 在 setup 函数中使用 useRouter
const router = useRouter();
// Reactive references
const ruleForm = ref(null);
const identifyComponent = ref(null);
const formLogin = ref({
  // Define your form model here
});
const centerDialogVisible = ref(false)
const centeridentifyCode = ref(false)

const centerDialogUser=ref(false);

// const dialogInfo = ref(''); // 可以根据需要设置信息
const identifyCode = ref('447D'); // Example code, replace with actual logic
identifyCode.value=Math.random().toString(36).substr(2, 4).toUpperCase();
const rules = ref({
  // Define your form validation rules here
});

// Methods
const refreshCode = () => {
  // Logic to refresh the code, for example:
  identifyCode.value = Math.random().toString(36).substr(2, 4).toUpperCase();
  
  // Assuming SIdentify has a method to refresh or you might need to force update
  if (identifyComponent.value) {
    identifyComponent.value.refresh(); // If SIdentify has a refresh method
  }
};

const login = async () => {
  // 验证验证码
  if (formLogin.value.code !== identifyCode.value) {
    centeridentifyCode.value = true;
    console.log(centeridentifyCode.value);
    return; 
  }

  // 检查是否勾选用户协议
  if (!formLogin.value.ElCheckbox) {
    centerDialogVisible.value = true;
    return; 
  }

  // 验证用户名和密码
  try {
    const response = await axios.post('/api/api/login', {
      username: formLogin.value.username,
      password: formLogin.value.password
    });

    if (response.data.success) {
      // 跳转到另一个页面
      localStorage.setItem('username', formLogin.value.username);
      router.push('/mainPage'); 
    } else {
      centerDialogUser.value = true;
    }
  } catch (error) {
    console.error('Error:', error.response ? error.response.data : error.message);
    centerDialogUser.value = true;
  }
};



// Lifecycle hooks
onMounted(() => {
  refreshCode
});
</script>
    


<style  scoped>
.login-bok{
    width: 30%;
    margin: 150px auto;
    border: 1px solid #DCDFE6;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 30px #DCDFE6;
    
}
.row{
    display: flex;
    justify-content: space-between;
}

.right{
    margin-left: 20px;
}
.main{
    width: 100%;
    height: auto;
    /* background-color: aquamarine; */
}
.image{
    width: 30px;
    height: 30px;
    border-radius: 50%;
    overflow: hidden;
    margin-left: 20px;
    align-content: center;

}

img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.Register{
    margin-left:80PX;
}
</style>

// src/axios.js
import axios from 'axios';
import router from './router'; // 导入 Vue Router 实例

const axiosInstance = axios.create({
  baseURL: 'https://api.example.com', // 设置基础 URL
  timeout: 10000, // 请求超时设置
});

// 请求拦截器
axiosInstance.interceptors.request.use(
  config => {
    const token = localStorage.getItem('token'); // 从 localStorage 获取 token
    if (token) {
      config.headers.Authorization = `Bearer ${token}`; // 设置 Authorization 头
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);



// 响应拦截器
axiosInstance.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    // 处理错误
    const { response } = error;
    if (response) {
      // 例如：401 未授权
      if (response.status === 401) {
        // 清除 token 并重定向到登录页面
        localStorage.removeItem('token');
        router.push('/login');
      }
      // 其他错误处理
      // ...
    }
    return Promise.reject(error);
  }
);

export default axiosInstance;

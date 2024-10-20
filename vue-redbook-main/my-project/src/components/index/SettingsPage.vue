<template>
    <div class="settings">
      <h2>Select Background Color</h2>
      <div class="color-buttons">
        <button
          v-for="color in colors"
          :key="color"
          :style="{ backgroundColor: color }"
          @click="changeBackground(color)"
        >
          {{ color }}
        </button>
        <button class="reset-button" @click="resetBackground">Reset to Default（white）</button>
      </div>
      
    </div>
  </template>
  
  <script setup>
//   import { ref } from 'vue';
  
  const colors = ['Purple', 'Pink', 'Blue', 'Green', 'Grey', 'Orange']; // 可选颜色
  
  const changeBackground = (color) => {
    document.body.style.backgroundColor = color; // 实时改变背景色
  };
  
  const resetBackground = () => {
    document.body.style.backgroundColor = ''; // 恢复默认背景色
  };
  </script>
  
  <style scoped>
  .settings {
    padding: 20px;
  }
  
  .color-buttons {
    display: flex;
    gap: 10px;
  }
  
  button {
    border: none;
    padding: 10px;
    cursor: pointer;
    color: white; /* 按钮文字颜色 */
    border-radius: 5px;
    transition: transform 0.2s;
  }
  
  button:hover {
    transform: scale(1.1); /* 鼠标悬停时放大 */
  }
  
  .reset-button {
    margin-top: 10px;
    background-color: #f44336; /* 红色 */
    color: white; /* 恢复按钮文字颜色 */
  }
  </style>
<template>
  <div>
    <el-dialog
      v-model="dialogVisible"
      title="Video Play"
      width="600px"
      :before-close="handleClose"
      :style="{ height: '70%' }"
    >
      <video ref="videoPlayer" controls :src="videoSrc" style="height: 500px; width: 100%; object-fit: cover;" autoplay></video>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { ElMessageBox } from 'element-plus';

const dialogVisible = ref(false);
const videoSrc = ref('http://localhost:3000/api/下载.mp4'); // 替换为你的视频路径
const videoPlayer = ref(null); // 引用视频元素

// 打开对话框并播放视频
const openVideoDialog = () => {
  dialogVisible.value = true; // 打开对话框
};

// 关闭对话框的处理函数
const handleClose = (done) => {
  ElMessageBox.confirm('Do u want close it？')
    .then(() => {
      stopVideo(); // 强行停止视频
      dialogVisible.value = false; // 关闭对话框
      done();
    })
    .catch(() => {
      // 用户取消关闭
    });
};

// 强行停止视频播放
const stopVideo = () => {
  if (videoPlayer.value) {
    videoPlayer.value.pause(); // 暂停视频
    videoPlayer.value.currentTime = 0; // 将播放时间重置为 0
  }
};

// 在组件挂载时打开视频播放
onMounted(() => {
  openVideoDialog();
});
</script>

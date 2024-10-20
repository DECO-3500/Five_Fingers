<template>
  <el-dialog :visible="centerDialogVisible" title="对话框" width="500" center>
    <div>{{ info }}</div>
    <template #footer>
      <el-button @click="closeDialog">关闭</el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, defineProps, toRefs, watch, emit } from 'vue';

const props = defineProps({
  info: String,
  visible: Boolean, // 接收父组件控制对话框显示与否
});
const { info, visible } = toRefs(props);

const centerDialogVisible = ref(visible.value);

// 监视 visible 的变化
watch(visible, (newVal) => {
  centerDialogVisible.value = newVal;
});

// 关闭对话框
function closeDialog() {
  centerDialogVisible.value = false; // 关闭本地状态
  emit('update:visible', false); // 发出事件通知父组件
}
</script>

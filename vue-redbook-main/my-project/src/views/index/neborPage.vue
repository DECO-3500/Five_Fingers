<template>
  <div style="display: flex; justify-content: space-between;">

    <el-card style="width: 580px; height: 600px;">
      <template #header>Norman hotel</template>
      <router-link to="/map?lat=-27.49192&lng=153.03528">
        <img
          src="https://normanhotel.com.au/wp-content/uploads/2019/11/JV-345-of-583-1030x686.jpg"
          style="width: 100%; height: 400px; object-fit: cover;"
        />
      </router-link>
      <el-rate
        v-model="value"
        :texts="['oops', 'disappointed', 'normal', 'good', 'great']"
        show-text
        style="margin-left: 200px;"
      />
      <div style="margin-left: 50px;" @click="openDialog('dialog1')">View Comments:<el-icon><ChatDotRound /></el-icon></div>
    </el-card>

    <el-card style="width: 580px; height: 600px;">
      <template #header>Gelato Messina South Brisbane</template>
      <router-link to="/map?lat=-27.47523&lng=153.01576">
        <img
          src="https://127751716.cdn6.editmysite.com/uploads/1/2/7/7/127751716/s867631489216756899_p127_i1_w1500.jpeg"
          style="width: 100%; height: 400px; object-fit: cover;"
        />
      </router-link>
      <el-rate
        v-model="value2"
        :texts="['oops', 'disappointed', 'normal', 'good', 'great']"
        show-text
        style="margin-left: 200px;"
      />
      <div style="margin-left: 50px;" @click="openDialog('dialog2')">View Comments：<el-icon><ChatDotRound /></el-icon></div>
    </el-card>

    <el-dialog
      v-model="dialogVisible1"
      title="Comment Section 1"
      width="500"
      :before-close="handleClose"
    >
    <neiborComment1></neiborComment1>
     
    </el-dialog>

    <el-dialog
      v-model="dialogVisible2"
      title="Comment Section 2"
      width="500"
      :before-close="handleClose2"
    >
    <neiborComment2></neiborComment2>
    </el-dialog>

  </div>
</template>

<script setup>
import { ref } from 'vue';
import neiborComment2 from "../../components/comment/neiborComment2.vue"
import neiborComment1 from "../../components/comment/neiborComment1.vue"
const value = ref();
const value2 = ref();
const dialogVisible1 = ref(false);
const dialogVisible2 = ref(false);

const openDialog = (dialog) => {
  if (dialog === 'dialog1') {
    dialogVisible1.value = true;
  } else if (dialog === 'dialog2') {
    dialogVisible2.value = true;
  }
};


</script>

<style scoped>
.el-card {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

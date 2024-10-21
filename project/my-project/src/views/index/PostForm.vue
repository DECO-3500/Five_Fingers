<template>
  <div>
    <div style="display: flex; align-items: center">
      <div><h2>Title：</h2></div>
      <div class="title_input" style="width: 70%;">
        <el-input v-model="title_input" placeholder="type here"></el-input>
      </div>
      <div class="submit" style="width: 15%; margin-left: 20px" @click="submit">
        <el-button type="success" round>upload</el-button>
      </div>
    </div>

    <div style="display: flex; align-items: center; margin-top: 10px" class="cover">   
      <div><h2>Cover：</h2></div>
      <div class="upload-img">
        <input type="file" @change="onFileChange" title="upload image" accept="image/*">
      </div>
      <div>
        <img :src="imageSrc" alt="preview" class="preview" v-if="imageSrc" />
      </div>
    </div>

    <div class="post" style="margin-top: 10px">
      <div style="border: 1px solid #ccc">
        <Toolbar
          style="border-bottom: 1px solid #ccc"
          :editor="editorRef"
          :defaultConfig="toolbarConfig"
          :mode="mode"
        />
        <Editor
          style="height: 500px; overflow-y: hidden;"
          v-model="valueHtml"
          :defaultConfig="editorConfig"
          :mode="mode"
          @onCreated="handleCreated"
        />
      </div>
    </div>
  </div>
</template>

<script>
import '@wangeditor/editor/dist/css/style.css';
import { onBeforeUnmount, ref, shallowRef, onMounted } from 'vue';
import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
import axios from 'axios';
import { ElMessage } from 'element-plus'; // 引入 Element Plus 消息组件

export default {
  components: { Editor, Toolbar },
  setup() {
    const editorRef = shallowRef();
    const imageSrc = ref('');
    const base64Image = ref('');
    const valueHtml = ref('<p>hello</p>');
    const title_input = ref('');

    onMounted(() => {
      setTimeout(() => {
        valueHtml.value = '<p>type here</p>';
      }, 1500);
    });

    const toolbarConfig = {};
    const editorConfig = { placeholder: 'type here' };

    onBeforeUnmount(() => {
      const editor = editorRef.value;
      if (editor) {
        editor.destroy();
      }
    });

    const submit = async () => {
      if (!title_input.value.trim() || !valueHtml.value.trim() || !base64Image.value.trim()) {
        // 提示标题或内容不能为空
        ElMessage.warning('title and content cant be empty');
        return;
      }

      try {
        const response = await axios.post('/api/api/uploadNote', {
          title: title_input.value,
          content: valueHtml.value,
          image: base64Image.value,
          username: localStorage.getItem('username')
        });

        // 显示成功消息
        ElMessage.success(response.data.message);

        // 清空内容
        title_input.value = '';
        valueHtml.value = '<p>type</p>';
        imageSrc.value = '';
        base64Image.value = '';

      } catch (error) {
        console.error('fails', error);
        // 显示错误消息
        ElMessage.error('upload fail: ' + (error.response?.data?.message || 'unknown'));
      }
    };

    const handleCreated = (editor) => {
      editorRef.value = editor;
    };

    const onFileChange = (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          imageSrc.value = e.target.result;
          base64Image.value = e.target.result;
        };
        reader.readAsDataURL(file);
      } else {
        alert('choose an image！');
      }
    };

    return {
      editorRef,
      valueHtml,
      mode: 'default',
      toolbarConfig,
      editorConfig,
      handleCreated,
      onFileChange,
      imageSrc,
      title_input,
      submit
    };
  }
};
</script>




<style lang="scss" scoped>
.file-upload {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.file-upload input {
  display: none; /* 隐藏原始的文件输入框 */
}

.file-upload:hover {
  background-color: #0056b3; /* 悬停效果 */
}

.preview {
  max-width: 300px;
  max-height: 300px;
  margin-left: 20px;
  border: 1px solid #ccc;
}

.upload-img{
  width: 300px;
  height: auto;
  input{
    width: 400px;
  }
}

input[type="file"]::file-selector-button {
        font-weight: 500;
        color: #fff;
        background-color: #409eff;
        border-color: #409eff;
        width: 260px;
        height: 60px;

      }


</style>

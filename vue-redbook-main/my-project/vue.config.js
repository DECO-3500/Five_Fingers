const { defineConfig } = require('@vue/cli-service');

module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    proxy: {
      '/api': {
        target: 'http://localhost:3000', // 后端 API 地址
        changeOrigin: true,
        pathRewrite: { '^/api': '' }, // 可选：重写路径
      },
    },
  },
});

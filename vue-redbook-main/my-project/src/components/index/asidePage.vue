<template>
    <div class="title"><a href="/indexPage">Community</a></div>
    <div class="sidebar-cont">
        <el-menu >
            <router-link to="/mainPage">
                <el-menu-item index="1">
                    <template #title>
                        <el-icon><Discount /></el-icon>
                        <span>Discovery</span>                        
                    </template>
                </el-menu-item>
            </router-link>

            <router-link to="/PostForm">
                    <el-menu-item index="2">
                    <template #title>
                        <el-icon><Upload /></el-icon>
                        <span>Upload New Post</span>                    
                    </template>
                </el-menu-item>
            </router-link>


            <router-link to="/SettingsPage">
                    <el-menu-item index="3">
                    <template #title>
                        <el-icon><Setting /></el-icon>
                        <span>Setting</span>                    
                    </template>
                </el-menu-item>
            </router-link>

            <router-link to="/cardPage">
                    <el-menu-item index="4">
                    <template #title>
                        <el-icon><ZoomIn /></el-icon>
                        <span>Find Companion</span>                    
                    </template>
                </el-menu-item>
            </router-link>
            
            <router-link to="/neborPage">
                    <el-menu-item index="5">
                    <template #title>
                        <el-icon><Pointer /></el-icon>
                        <span>Local Favourite</span>                    
                    </template>
                </el-menu-item>
            </router-link>


            <router-link to="/fligtChat">
                    <el-menu-item index="6">
                    <template #title>
                        <el-icon><Promotion /></el-icon>
                        <span>Flight Chat</span>                    
                    </template>
                </el-menu-item>
            </router-link>

            <router-link to="/ARPage">
                    <el-menu-item index="7">
                    <template #title>
                        <el-icon><Camera /></el-icon>
                        <span>AR Scan</span>                    
                    </template>
                </el-menu-item>
            </router-link>

             <router-link to="/chngePersonal">
                    <el-menu-item index="8">
                    <template #title>
                        <el-icon><User /></el-icon>
                        <span>Profile</span>                    
                    </template>
                </el-menu-item>
            </router-link>           


        </el-menu>

    </div>
    
</template>


<script>

</script>







<style scoped>
  .title{
    margin-left:30px;
    font-size: 24px;
    font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji, BlinkMacSystemFont, Helvetica Neue, Arial, PingFang SC, PingFang TC, PingFang HK, Microsoft Yahei, Microsoft JhengHei;
    border-radius: 30px;
    color:#fff;
    background-color: red;
    min-width: fit-content;
    width: 60px;
    margin-top:20px;
  }

  a {
  text-decoration: none; /* 去掉下划线 */
  color: inherit; /* 继承父元素的颜色 */
}

span{
    font: bold;
}

.sidebar-cont{
    margin-top: 50px;
}
</style>
import { createRouter, createWebHistory } from 'vue-router';


const routes = [
  { path: '/', 
    name:'login',
    component: ()=>import('@/views/login/LoginPage.vue') },
  { path: '/terms', 
    name:'terms',
    component: ()=>import('@/views/login/termsPage.vue') },
  { path: '/comment', 
    name:'comment',
    component: ()=>import('@/components/comment/comMent.vue') },
  { path: '/Register', 
    name:'Register',
    component: ()=>import('@/views/login/RegisterPage.vue') },
  { path: '/indexPage', 
    name:'indexPage',
    component: ()=>import('@/views/index/indexPage.vue'),
    redirect: '/mainPage',
    children:[
      { path:'/mainPage',
        name:'mainpage',
        component: ()=>import('@/components/index/mainPage.vue')
      },
      { path:'/groupChat',
        name:'groupChat',
        component: ()=>import('@/components/chat/groupChat.vue')
      },
      {
        path:'/userProfile',
        name:'userProfile',
        component: ()=>import('@/views/user/userProfile.vue'),
        
      },
      {
        path:'/partnerPage',
        name:'partnerPage',
        component: ()=>import('@/views/user/partnerPage.vue'),
        
      },
      { path: '/PostForm', 
        name:'PostForm',
        component: ()=>import('@/views/index/PostForm.vue') }
      ,{
        path:'/expLore',
        name:'expLore',
        component: ()=>import('@/views/index/expLore.vue'),
        
      },
      { path: '/cardPage', 
        name:'cardPage',
        component: ()=>import('@/views/card/cardPage.vue') },
        { path: '/map', 
          name:'map',
          component: ()=>import('@/views/map/mapPage.vue') },
        { path: '/chat', 
          name:'chat',
          component: ()=>import('@/views/chat/chatPage.vue') },
        { path: '/chngePersonal', 
          name:'chngePersonal',
          component: ()=>import('@/views/index/chngePersonal.vue') }, 
        { path: '/neborPage', 
          name:'/neborPage',
          component: ()=>import('@/views/index/neborPage.vue') },  
        { path: '/fligtChat', 
          name:'fligtChat',
          component: ()=>import('@/views/user/fligtChat.vue') }, 
        { path: '/SettingsPage', 
          name:'/SettingsPage',
          component: ()=>import('@/components/index/SettingsPage.vue') },
          
        { path: '/ARPage', 
          name:'/ARPage',
          component: ()=>import('@/views/index/ARPage.vue') },  
    ]
  },
    




  ];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;

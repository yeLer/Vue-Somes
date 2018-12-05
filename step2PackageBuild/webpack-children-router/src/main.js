// 这是 main.js 是我们项目的JS入口文件
import Vue from 'vue'

// 1 导入vue-router包
import VueRouter from 'vue-router'
// 2 手动安装VueRouter
Vue.use(VueRouter)

// 导入自定义路由模块
import router from './router.js'

// 导入App组件
import app from './App.vue'


var vm = new Vue({
  el: '#app',
  data: {
    msg: 123,
  },
  render: c => c(app),
  router  //4将路由对象挂载在vm上
})
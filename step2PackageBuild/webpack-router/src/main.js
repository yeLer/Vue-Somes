// 这是 main.js 是我们项目的JS入口文件
import Vue from 'vue'

// 1 导入vue-router包
import VueRouter from 'vue-router'

//2 手动安装VueRouter
Vue.use(VueRouter)

// 导入App组件
import app from './App.vue'
// 导入account组件
import account from './main/Account.vue'
// 导入goodslist组件
import goodslist from './main/GoodsList.vue'

//3 创建路由对象
var router = new VueRouter({
  routes: [
    { path: '/account', component: account },
    { path: '/goodslist', component: goodslist }
  ]
})

var vm = new Vue({
  el: '#app',
  data: {
    msg: 123,
  },
  render: c => c(app),
  router  //4将路由对象挂载在vm上
})
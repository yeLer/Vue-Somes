// 导入account组件
import account from './main/Account.vue'
//导入account组件的子组件
import login from "./main/user/login.vue"
import register from "./main/user/register.vue"

// 导入goodslist组件
import goodslist from './main/GoodsList.vue'

// 1 导入vue-router包
import VueRouter from 'vue-router'


//2 创建路由对象
var router = new VueRouter({
  routes: [
    {
      path: '/account',
      component: account,
      children: [
        { path: 'login', component: login },
        { path: 'register', component: register }
      ]
    },
    { path: '/goodslist', component: goodslist }
  ]
})

// 把路由暴露出去
export default router
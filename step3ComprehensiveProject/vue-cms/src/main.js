// 入口文件
import Vue from 'vue'
// 1.1 导入路由的包
import VueRouter from 'vue-router'
// 1.2 安装路由
Vue.use(VueRouter)
// 1.3 导入自己的 router.js 路由模块
import router from './router.js'

// 2.1 导入 vue-resource
import VueResource from 'vue-resource'
// 2.2 安装 vue-resource
Vue.use(VueResource)
// 全局配置vue-resource请求根路径
Vue.http.options.root = 'http://127.0.0.1:8000/'

// 定义全局过滤器
Vue.filter('forMatTime',(dataStr,pattern='') =>{
  var dt = new Date(dataStr)
  var y = dt.getFullYear()
  var m = (dt.getMonth()).toString().padStart(2,'0')
  var d = (dt.getDate()).toString().padStart(2,'0')

  if (pattern.toLowerCase() === 'yyyy-mm-dd') {
    return `${y}-${m}-${d}`
  }
  else{
    var hh = (dt.getHours()).toString().padStart(2,'0')
    var mm = (dt.getMinutes()).toString().padStart(2,'0')
    var ss = (dt.getSeconds()).toString().padStart(2,'0')
    return `${y}-${m}-${d} ${hh}:${mm}:${ss}`
  }
})

// 导入 MUI 的样式
import './lib/mui/css/mui.min.css'
// 导入扩展图标样式
import './lib/mui/css/icons-extra.css'

// 按需导入 Mint-UI 中的组件   
import { Header, Swipe, SwipeItem,Button} from 'mint-ui'
Vue.component(Header.name, Header)
Vue.component(Swipe.name, Swipe)
Vue.component(SwipeItem.name, SwipeItem)
Vue.component(Button.name, Button)


// 导入 App 根组件
import app from './App.vue'

var vm = new Vue({
  el: '#app',
  render: c => c(app),
  router // 1.4 挂载路由对象到 VM 实例上
})
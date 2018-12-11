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
// 全局配置POST表单数据的组织形式
Vue.http.options.emulateJSON = true

// 导入 MUI 的样式
import './lib/mui/css/mui.min.css'
// 导入扩展图标样式
import './lib/mui/css/icons-extra.css'

// 按需导入 Mint-UI 中的组件   
// import { Header, Swipe, SwipeItem, Button, Lazyload } from 'mint-ui'
// Vue.component(Header.name, Header)
// Vue.component(Swipe.name, Swipe)
// Vue.component(SwipeItem.name, SwipeItem)
// Vue.component(Button.name, Button)
// Vue.use(Lazyload)

//全局导入 
import MintUI from 'mint-ui'
Vue.use(MintUI)
import 'mint-ui/lib/style.css'

// 使用缩略图预览插件
import VuePreview from 'vue-preview'
// defalut install
Vue.use(VuePreview)

// 导入vuex
import Vuex from 'vuex'
// 使用
Vue.use(Vuex)
// 每次进入网站  肯定会调用main.js的内容，先尝试从本地存储当中读取数据放入到store中，如果没有存在得到一个空数组
var car = JSON.parse(localStorage.getItem('car'||'[]'))
// 创建store实例
var store = new Vuex.Store(
  {
    state: {  //this.$store.state.***
      // car: [], //将购物车中商品的数据用数组存储起来，在car数组中存储一些商品的对象，可以暂时将商品对象设计成
      car: car,
      // {id:商品id, count:要购买的数量,price:商品的单价,seleted:选取状态}
    },
    mutations: { //this.$store.commit('方法名称'，按需传递唯一的参数)
      // 点击加入购物车把商品信息加入到store中的car
      // 分析：
      // 1 如果加入购物车之前，之前有这个商品，那么只需要更新数量即可
      // 2 如果没有 则直接把商品数据  push到car中即可 
      addToCar(state, goodsInfo) {
        //  假设在购物车中没有找到对应的商品
        var flag = false
        state.car.some(item => {
          if (item.id == goodsInfo.id) {
            item.count += parseInt(goodsInfo.count)
            flag = true
            return true
          }
        })
        // 如果最终循环完毕，得到的flag还是false 直接将对象push到store中
        if (!flag) {
          state.car.push(goodsInfo)
        }
        // 当更新car之后将car的数据存储到 localstorage中
        localStorage.setItem('car',JSON.stringify(state.car))
      }
    },
    getters: {  //this.$store.getters.***
      // 相当于计算属性，也相当于过滤器
      getAllCount(state) {
        var c = 0
        state.car.forEach(item => {
          c += item.count
        })
        return c
      }
    }
  }
)

// 导入 App 根组件
import app from './App.vue'


// 定义全局过滤器,放在new Vue对象前面
Vue.filter('forMatTime', (dataStr, pattern = '') => {
  var dt = new Date(dataStr)
  var y = dt.getFullYear()
  var m = (dt.getMonth()).toString().padStart(2, '0')
  var d = (dt.getDate()).toString().padStart(2, '0')

  if (pattern.toLowerCase() === 'yyyy-mm-dd') {
    return `${y}-${m}-${d}`
  }
  else {
    var hh = (dt.getHours()).toString().padStart(2, '0')
    var mm = (dt.getMinutes()).toString().padStart(2, '0')
    var ss = (dt.getSeconds()).toString().padStart(2, '0')
    return `${y}-${m}-${d} ${hh}:${mm}:${ss}`
  }
})

var vm = new Vue({
  el: '#app',
  render: c => c(app),
  router, // 1.4 挂载路由对象到 VM 实例上
  store,  //挂载store状态管理对象
})

// 这是 main.js 是我们项目的JS入口文件

//如何在webpack构建的项目中进行开发
// 1、使用script标签，引入vue的包
// 2、在index页面，创建id为app 的div容器
// 3、通过new Vue得到一个vue的实例

//在webpack中，import Vue from 'vue'导入的Vue 的构造函数不完整,是导入的runtime类型的，并没有提供像网页中那种方式
import Vue from 'vue'


// import Vue from '../node_modules/vue/dist/vue.js'

//回顾包的查找规则
//1 找项目根目录中是否有 node_moudles的文件夹
//2 在node_moudles根据包名找vue的文件夹
//3 在vue的文件夹中找 package.json的配置文件
//4 在package.json文件中，查找mian属性，【mian属性指定了这个包在被加载时的入口属性】

// 此时在webpack.config.js已经做了相关配置
// import Vue from 'vue'


// var login = {
//   template:"<h1>登录组件</h1>"
// }

//默认webpack 无法打包.vue文件，需要安装相关的loader,并新增loader的配置项
import login from './user/login.vue'

var vm = new Vue({
  el: '#app',
  data: {
    msg: 123,
  },
  // components:{
  //   login
  // }

  // render: function (createElements) {  //createElements是一个方法，调用它能够把指定的组件模板渲染为html结构
  //   //注意：这里return的结果，会替换页面中el指定的那个容器
  //   return createElements(login)
  // }

  //简写
  // render:createElements=>{ 
  //   return createElements(login)
  // }

  //再简写
  render: c => c(login)
})
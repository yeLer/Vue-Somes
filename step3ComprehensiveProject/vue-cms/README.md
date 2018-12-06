# 这是一个NB的项目

## 牛不牛逼， 用心去感受，每一行代码中的诗情雅意

### 我们是有灵魂程序员，所以，我们的代码富有诗意；

#### 丫的，实在编不下去了,哈哈哈

## [主流开源协议之间有何异同？](https://www.zhihu.com/question/19568896)

## 用(传统方式)命令行把修改过后的代码上传到码云？？？
1. git add .
2. git commit -m "提交信息"
3. git push

## 制作首页App组件
1. 完成 Header 区域，使用的是 Mint-UI 中的Header组件
2. 制作底部的 Tabbar 区域，使用的是 MUI 的 Tabbar.html
 + 在制作 购物车 小图标的时候，操作会相对多一些：
 + 先把 扩展图标的 css 样式，拷贝到 项目中
 + 拷贝 扩展字体库 ttf 文件，到项目中
 + 为 购物车 小图标 ，添加 如下样式 `mui-icon mui-icon-extra mui-icon-extra-cart`
3. 要在 中间区域放置一个 router-view 来展示路由匹配到的组件

## 改造 tabbar 为 router-link

## 设置路由高亮

## 点击 tabbar 中的路由链接，展示对应的路由组件

## 制作首页轮播图布局

## 加载首页轮播图数据
1. 获取数据， 如何获取呢， 使用 vue-resource
2. 使用 vue-resource 的 this.$http.get 获取数据
3. 获取到的数据，要保存到 data 身上
4. 使用 v-for 循环渲染 每个 item 项

## 改造 九宫格 区域的样式

## 改造新闻资讯链接

## 新闻资讯页面制作
1 绘制界面--使用mui中的media-list.html页面

2 使用vue-resources获取数据

3 渲染真实数据

### 实现新闻资讯列表点击跳转到新闻详情
1 把列表中的每一项改造为router-link,同时提供唯一的id标识符

2 创建新闻详情的组件页面  newsinfo.vue

3 在路由模块中，将新闻详情的路由地址和组件页面的内容对应起来

### 单独封装一个vue评论子组件
1 先床架一个单独的comment.vue模板

2 在需要使用的页面中，手动导入comment组件
`import Comment from './Comment.vue'`

3 在父组件中使用'components'属性，将刚才导入的comment组件注册为自己的子组件

4 将注册的子组件时候的注册名称，在页面中引用

### 获取评论数据并显示到页面中

### 实现点击加载更多
1 为点击加载更多绑定事件，重新获取新的一页内容

2 pageIndex自增，重新调用 getComments()方法，获取新的一页内容

3 为了防止新数据被覆盖的情况，我们在点击加载更多的情况下 应该让老数据拼接上新数据

## 如何使用

  + 1 使用cnpm安装依赖包 `cnpm i`
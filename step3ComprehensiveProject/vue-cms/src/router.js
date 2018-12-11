import VueRouter from 'vue-router'

// 导入对应的路由组件
import HomeContainer from './components/tabbar/HomeContainer.vue'
import MemberContainer from './components/tabbar/MemberContainer.vue'
import ShopcarContainer from './components/tabbar/ShopcarContainer.vue'
import SearchContainer from './components/tabbar/SearchContainer.vue'
import NewsList from './components/news/NewsList.vue'
import NewsInfo from './components/news/NewsInfo.vue'
import PhotoList from './components/photos/PhotoList.vue'
import PhotoInfo from './components/photos/PhotoInfo.vue'
import GoodsList from './components/goods/GoodsList.vue'
import GoodsInfo from './components/goods/GoodsInfo.vue'
import GoodsDesc from './components/goods/GoodsDesc.vue'
import GoodsComment from './components/goods/GoodsComment.vue'

// 3. 创建路由对象
var router = new VueRouter({
  routes: [ // 配置路由规则
    { path: '/', redirect: '/home' },
    { path: '/home', component: HomeContainer },
    { path: '/member', component: MemberContainer },
    { path: '/shopcar', component: ShopcarContainer },
    { path: '/search', component: SearchContainer },
    { path: '/home/NewsList', component: NewsList },
    // :id是传递的id参数
    { path: '/home/NewsInfo/:id', component: NewsInfo },
    { path: '/home/photoList', component: PhotoList },
    { path: '/home/PhotoInfo/:id', component: PhotoInfo },
    { path: '/home/GoodsList/', component: GoodsList },
    // 为路由重新起一个名称,可以方便的进行路由跳转
    { path: '/home/GoodsInfo/:id', component: GoodsInfo, name: "goodsInfo" },
    { path: '/home/GoodsDesc/:id', component: GoodsDesc, name: "GoodsDesc" },
    { path: '/home/GoodsComment/:id', component: GoodsComment, name: "GoodsComment" },
  ],
  // 当哪个路由被选中就会为其添加哪个类属性
  linkActiveClass: 'mui-active' // 覆盖默认的路由高亮的类，默认的类叫做 router-link-active
})

// 把路由对象暴露出去
export default router
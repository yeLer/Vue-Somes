<template>
  <div class="goods-list">
    <!-- <router-link class="goods-item" v-for="(item) in goodsList" :key="item.pk" tag="div" :to="'/home/goodsinfo/'+item.pk">
      <img :src="item.fields.img_src" alt="">
      <h3 class="title">{{item.fields.title}}</h3>
      <div class="info">
        <p class="price">
          <span class="now">￥{{item.fields.sell_price}}</span>
          <span class="old">￥{{item.fields.market_price}}</span>
        </p>
        <p class="sell">
         <span>热卖中</span>
         <span>剩余{{item.fields.stock_quantity}}件</span>
        </p>
      </div>
    </router-link> -->
    <!-- 在网页中，有两种跳转方法 -->
    <!-- 方式一：使用a标签 -->
    <!-- 方式二：使用window.location.href的形式，叫做编程式导航 -->
    <div class="goods-item" v-for="(item) in goodsList" :key="item.pk" @click="goDetial(item.pk)">
      <img :src="item.fields.img_src" alt="">
      <h3 class="title">{{item.fields.title}}</h3>
      <div class="info">
        <p class="price">
          <span class="now">￥{{item.fields.sell_price}}</span>
          <span class="old">￥{{item.fields.market_price}}</span>
        </p>
        <p class="sell">
         <span>热卖中</span>
         <span>剩余{{item.fields.stock_quantity}}件</span>
        </p>
      </div>
    </div>
    <mt-button type="danger" size="large" @click="getMore">加载更多</mt-button>
  </div>
</template>

<script>
import { Toast } from "mint-ui";

export default {
  name: "",
  props: [""],
  // 是向自己的组件内部挂载私有数据
  data() {
    return {
      pageIndex: 1, //分页的页数
      goodsList: [] //存放商品列表的数组
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  created() {
    this.getGoodsList();
  },

  methods: {
    getGoodsList() {
      //获取商品列表
      this.$http
        .get("api/getGoods?pageindex=" + this.pageIndex)
        .then(response => {
          if (response.body.status === 0) {
            // this.goodsList = response.body.message
            this.goodsList = this.goodsList.concat(response.body.message);
            // console.log(this.goodsList);
          } else {
            Toast("获取商品列表失败");
          }
        });
    },
    getMore() {
      this.pageIndex++;
      this.getGoodsList();
    },
    // 使用js形式进行路由跳转

    // 一定要区分： this.$route 和this.$router
    // this.$route是路由参数对象 所有路由参数  params query都属于它
    // this.$router 是路由导航对象 ，用它可以实现js代码实现路由的前进和后退到新的url地址
    goDetial(id) {
      // 1 最简单的调用方法
      // this.$router.push("/home/goodsinfo/" + id);
      // 2 传递对象
      // this.$router.push({ path: "/home/goodsinfo/" + id });
      // 3 params传递命名路由
      this.$router.push({ name: "goodsInfo", params: { id } });
    }
  },

  watch: {}
};
</script>
<style lang='scss' scoped>
.goods-list {
  display: flex;
  flex-wrap: wrap;
  padding: 8px;
  // 两端靠边
  justify-content: space-between;
  .goods-item {
    width: 49%;
    border: 1px solid #cccccc;
    box-shadow: 0 0 8px #cccccc;
    margin: 3px 0;
    padding: 2px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 263px;
    img {
      width: 100%;
      height: 58%;
    }
    .title {
      font-size: 14px;
    }
    .info {
      background-color: #eeeeee;
      p {
        margin: o;
        padding: 2px;
      }
      .price {
        .now {
          color: red;
          font-weight: bold;
          font-size: 16px;
        }
        .old {
          // 删除线
          text-decoration: line-through;
          font-size: 12px;
          margin-left: 12px;
        }
      }
      .sell {
        display: flex;
        justify-content: space-between;
        font-size: 13px;
      }
    }
  }
}
</style>
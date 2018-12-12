<template>
  <div class="shopcar-container">
    <!-- 商品信息区域 -->
    <div class="mui-card">
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <mt-switch ></mt-switch>
          <img src="https://gju1.alicdn.com/tps/i2/TB2GtsNm5rpK1RjSZFhXXXSdXXa_!!0-juitemmedia.jpg_300x300.jpg_.webp">
          <div class="info">
            <h1>这是一个最简单的卡片视图控件</h1>
            <P>
              <span class="price">￥2199</span>
              <numbox></numbox>
               <!-- 问题：如何从购物车中获取商品的数量呢 -->
                <!-- 1. 我们可以先创建一个 空对象，然后循环购物车中所有商品的数据， 把 当前循环这条商品的 Id， 作为 对象 的 属性名，
                count值作为 对象的 属性值，这样，当把所有的商品循环一遍，就会得到一个对象： { 88: 2, 89: 1, 90: 4 } -->
              <a href="#">删除</a>
            </P>
          </div>
        </div>
      </div>
    </div>
    <!-- 结算区域 -->
    <div class="mui-card">
      <div class="mui-card-content jiesuan">
        <div class="mui-card-content-inner">
          <div class="left">
            <p>总计  (不含运费)</p>
            <p>已勾选商品 0件，总价￥0</p>
          </div>
        </div>
        <mt-button type="danger">去结算</mt-button>
      </div>
    </div>
  </div>
</template>

<script>
import numbox from "../subcomponents/ShopCarNumBox.vue";
export default {
  name: "",
  data() {
    return {
      goodsList: [] //购物车中所有的商品数据
    };
  },

  components: {
    numbox
  },
  methods: {
    getGoodsListForCar() {
      // 1 获取store中所有商品的id  然后拼接为一个用逗号分隔的字符串
      var idCar = [];
      this.$store.state.car.forEach(element => {
        idCar.push(element.id);
      });
      // 2 如果购物车没有商品  直接返回  不需要请求数据
      if (idCar.length <= 0) {
        return;
      }
      // 获取购物车商品列表
      this.$http
        .get("api/getGoodsListForCar" + idCar.join(","))
        .then(response => {
          if (response.body.status === 0) {
            this.goodsList = response.body.message;
          } else {
          }
        });
    }
  },
  computed: {}
};
</script>

<style lang="scss" scoped>
.shopcar-container {
  background-color: #eee;
  overflow: hidden;
  .mui-card {
    img {
      width: 60px;
      height: 60px;
      margin-right: 20px;
    }
    h1 {
      font-size: 14px;
    }
    .info {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .price {
        color: red;
        font-weight: bold;
      }
    }
    .mui-card-content-inner {
      // 子元素水平布局
      display: flex;
      // 纵向居中
      align-items: center;
    }
  }
  .jiesuan{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 5%;
  }
}
</style>

<template>
  <div class="goodsinfo-container">
    <transition
      @before-enter="beforeEnter"
      @enter="enter"
      @after-enter="afterEnter"
    >
      <div class="ball" v-if="ballFlag" ref="ball"></div>
    </transition>
    
    <!-- 商品轮播图区域 -->
    <!-- :isfull="false"表示用户指定组件的宽度为自适应 -->
    <my-swiper :lunbotuList="lunBoList" :isfull="false"></my-swiper>
    <!-- 分析：为什么商品评论中的轮播图不好看 -->
    <!-- 1 首页中的图片宽和高都使用了100%的宽高 -->
    <!-- 2 在商品详情页面中，轮播图的图片如果也使用了100%,页面不好看 -->
    <!-- 3 商品详情页面  期望的是高度为100%  高度为自适应 -->

    <!-- 经过分析  得到问题的原因为：首页中的轮播图是宽度是100%还是自适应 -->
    <!-- 既然这两个轮播图的其它方面没有冲突  知识宽度有分歧  可以定义一个属性   让使用轮播图的调用者指定宽度属性 -->
    <!-- 商品购买区域 -->
    <div class="mui-card">
      <div class="mui-card-header">{{goodsInfo.title}}</div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <p class="price">
            市场价:
            <del>￥{{goodsInfo.market_price}}</del>&nbsp;&nbsp;
            销售价:
            <span class="now_price">
              ￥{{goodsInfo.sell_price}}
            </span>
          </p>
          <div class="NumBox-content">
            <p>购买数量:
              <GoodsInfoNumBox class="NumBox" :max="goodsInfo.stock_quantity" @getcount="getSelectedCount"></GoodsInfoNumBox>
            </p>
          </div>
          
          
          <p class="user-buy-btn">
            <mt-button type="primary" size="small">立即购买</mt-button>
            <mt-button type="danger" size="small" @click="addToShopCar()">加入购物车</mt-button>
            <!--分析：如何实现加入购物车的时候  拿到选择的数量  -->
            <!-- 1 分析发现   按钮属于goodsinfo页面   数组属于numbox组件 -->
            <!-- 2 由于涉及父子组件的嵌套  所以无法直接在goodsinfo页面中获取选择框中的值 -->
            <!-- 3. 怎么解决这个问题：涉及到了 子组件向父组件传值了（事件调用机制） -->
            <!-- 4. 事件调用的本质： 父向子传递方法，子调用这个方法， 同时把 数据当作参数 传递给这个方法 -->
          </p>
        </div>
      </div>
    </div>
    <!-- 商品参数区域 -->
    <div class="mui-card">
      <div class="mui-card-header">商品参数</div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <p>商品货号:{{goodsInfo.goods_no}}</p>
          <p>库存情况:{{goodsInfo.stock_quantity}}</p>
          <p>上架时间:{{goodsInfo.add_time}}</p>
        </div>
      </div>
      <div class="mui-card-footer">
        <mt-button type="primary" size="large" plain @click="goDesc(id)">图文介绍</mt-button>
        <mt-button type="danger" size="large" plain @click="goComment(id)">商品评论</mt-button>
      </div>
    </div>
  </div>
</template>

<script>
import { Toast } from "mint-ui";
// 第一步导入
import Swiper from "../subcomponents/Swiper.vue";

import GoodsInfoNumBox from "../subcomponents/GoodsInfoNumBox.vue";

export default {
  name: "",
  props: [""],
  data() {
    return {
      id: this.$route.params.id, //将路由参数对象中的id挂载在data上，方便后期调用
      lunBoList: [], //存放轮播图的列表
      goodsInfo: {}, //获取到的商品信息
      ballFlag: false, //小球的显示状态
      selectedCount: 1 //用户选中的商品个数
    };
  },

  components: {
    "my-swiper": Swiper,
    GoodsInfoNumBox
  },

  computed: {},

  mounted() {},

  created() {
    this.getGoodsLunBo();
    this.getGoodsInfo();
  },

  methods: {
    // 获取商品列表展示的轮播图
    getGoodsLunBo() {
      this.$http.get("api/getGoodsLunBo/" + this.id).then(response => {
        if (response.body.status === 0) {
          // 由于后台返回数据名称不一致，这里需要重新组织一下
          // response.body.message.forEach(element => {
          //   var img_url = element.fields.img_src
          //   this.lunBoList.push({"img_url":img_url})
          // });
          response.body.message.forEach(element => {
            element.img_url = element.fields.img_src; //加一条属性值
          });
          this.lunBoList = response.body.message;
        } else {
          Toast("获取商品轮播失败");
        }
      });
    },
    getGoodsInfo() {
      this.$http.get("api/goods/get_goods_info/" + this.id).then(response => {
        if (response.body.status === 0) {
          this.goodsInfo = response.body.message;
          // console.log(this.goodsInfo)
        } else {
          Toast("获取商品详情失败");
        }
      });
    },
    // 使用编程式导航到图文介绍页面
    goDesc(id) {
      this.$router.push({ name: "GoodsDesc", params: { id } });
    },
    // 使用编程式导航到评论页面
    goComment(id) {
      this.$router.push({ name: "GoodsComment", params: { id } });
    },
    // 添加到购物车
    addToShopCar() {
      this.ballFlag = !this.ballFlag;
      // {id:商品id, count:要购买的数量,price:商品的单价,seleted:选取状态}
      // 拼接出一个商品信息对象
      var goodsinfo = {
        id: this.id,
        count: this.selectedCount,
        price: this.goodsInfo.sell_price,
        seleted: true
      };
      // 调用store中的mutations来将数据加入购物车
      this.$store.commit("addToCar",goodsinfo)
    },
    beforeEnter(el) {
      el.style.transform = "translate(0,0)";
    },
    enter(el, done) {
      el.offsetWidth;

      //小球动画优化思路
      // 1 先分析小球位置不准确的原因  我们把小球最终位置的局限在一个固定的位置  只要测试的分辨率不一样  或者滚动条滚动以后  问题就会出现
      // 2 因此不能将坐标位置写死  而应该依据不同的情况动态计算坐标值
      // 3 经过分析得到思路是先得到徽标的横纵坐标  再得到小球的横纵坐标  然后让y的值求差  x值也是求差  得到的结构就是h横纵坐标需要位移的距离
      // 4 如何获得徽标和小球的位置 ？  domObject.getBoundingClientRect()

      //获取小球在页面中的位置
      const ballPosition = this.$refs.ball.getBoundingClientRect();
      // 获取徽标在页面的位置
      const bandgePosition = document
        .getElementById("bandge")
        .getBoundingClientRect();

      const xDist = bandgePosition.left - ballPosition.left;
      const yDist = bandgePosition.top - ballPosition.top;
      // console.log(ballPosition.left)
      // el.style.transform="translate(116px,363px)";
      el.style.transform = `translate(${xDist}px,${yDist}px)`;
      // el.style.transition = "all 1s ease";
      el.style.transition = "all 0.8s cubic-bezier(.17,.67,.97,.59)";
      done();
    },
    afterEnter(el) {
      this.ballFlag = !this.ballFlag;
    },
    getSelectedCount(count) {
      // 当子组件把 选中的数量传递给父组件的时候，把选中的值保存到 data 上
      this.selectedCount = count;
      // console.log("父组件拿到的数量值为： " + this.selectedCount);
    }
  },

  watch: {}
};
</script>
<style lang='scss' scoped>
.goodsinfo-container {
  // background-color: #eee;
  .now_price {
    color: red;
    font-size: 16px;
    font-weight: bold;
  }
  .NumBox-content {
    margin: 6px 0;

    .NumBox {
      display: inline;
    }
  }
  .user-buy-btn {
    margin-top: 6px;
  }
  .mui-card-footer {
    display: block;
    button {
      margin: 10px 0;
    }
  }
  .ball {
    width: 15px;
    height: 15px;
    border-radius: 50px;
    background-color: red;
    z-index: 99;
    position: absolute;
    top: 350px;
    left: 146px;
  }
}
</style>
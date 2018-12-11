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
              <a href="#">删除</a>
            </P>
          </div>
        </div>
      </div>
    </div>
    <!-- 结算区域 -->
    <div class="mui-card">
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          这是一个最简单的卡片视图控件；卡片视图常用来显示完整独立的一段信息，比如一篇文章的预览图、作者信息、点赞数量等
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import numbox from '../subcomponents/ShopCarNumBox.vue'
 export default {
    name:'',
    data () {
      return {

      };
    },

    components: {
      numbox
    },

    computed: {},
 }
</script>

<style lang="scss" scoped>
.shopcar-container{
  background-color: #eee;
  overflow: hidden;
  .mui-card{
    img{
      width: 60px;
      height: 60px;
      margin-right: 20px;
    }
    h1{
      font-size: 14px;
    }
    .info{
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .price{
        color: red;
        font-weight: bold;
      }
    }
    .mui-card-content-inner{
      // 子元素水平布局
      display: flex;
      // 纵向居中
      align-items: center;
    }
  }
}
</style>

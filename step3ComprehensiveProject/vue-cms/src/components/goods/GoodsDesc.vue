<template>
  <div class="goods-desc-content">
    <h3>商品描述页面</h3>
    <hr>
    <div class="content"></div>
  </div>
</template>

<script>

  export default {
    name:'',
    props:[''],
    data () {
      return {
        goodsDesc:{}, //商品图文数据
      };
    },

    components: {},

    computed: {},

    beforeMount() {},

    created() {
      this.getGoodsDesc()
    },

    methods: {
      getGoodsDesc(){
        this.$http.get('api/goods/getdesc/'+this.$route.params.id).then(response=>{
          if (response.body.status === 0) {
            this.goodsDesc = response.body.message
          }
        })
      }
    },

    watch: {}

  }

</script>
<style lang='scss'>
// 为了让图片全部显示，需要将scoped去掉  然后设置图片宽度为100%
.goods-desc-content{
  h3{
    font-size: 16px;
    text-align: center;
    color: #226aff;
    margin: 15px 0;
  }
  .content{
    img{
      width: 100%；
    }
  }
}
</style>
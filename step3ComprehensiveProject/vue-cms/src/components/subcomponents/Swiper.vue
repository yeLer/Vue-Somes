<template>
  <div>
    <!-- 在组件中，使用v-for循环的话，一定要使用 key -->
    <!-- 将来谁使用轮播图组件，谁提供轮播图list -->
    <!-- 此时轮播图list是父组件向子组件传值 -->
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="(item,index) in lunbotuList" :key="index">
        <img :src="item.img_url" alt="" :class="{'full':isfull}">
      </mt-swipe-item>
    </mt-swipe>

    <!-- <mt-swipe :auto="4000">
      <mt-swipe-item><img src="../../images/homelunbo1.jpg"></mt-swipe-item>
      <mt-swipe-item><img src="../../images/homelunbo2.jpg"></mt-swipe-item>
      <mt-swipe-item><img src="../../images/homelunbo3.jpg"></mt-swipe-item>
    </mt-swipe> -->
  </div>
</template>

<script>

  export default {
    name:'',
    // 今后需要展示轮播图数据，必须给这个组件传递一个lunbotuList的数组
    props:['lunbotuList',"isfull"],
    data () {
      return {

      };
    },

    components: {},

    computed: {},

    beforeMount() {},

    created() {},

    methods: {},

    watch: {}

  }

</script>
<style lang='scss' scoped>
.mint-swipe {
  height: 200px;

  .mint-swipe-item {
    text-align: center;
    // &:nth-child(1) {
    //   background-color: red;
    // }
    // &:nth-child(2) {
    //   background-color: blue;
    // }
    // &:nth-child(3) {
    //   background-color: cyan;
    // }

    img {
      // width: 100%;
      height: 100%;
    }
  }
}
.full{
  width: 100%;
}
</style>
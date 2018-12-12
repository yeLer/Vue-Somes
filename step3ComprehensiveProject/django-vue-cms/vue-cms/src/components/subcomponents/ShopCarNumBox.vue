<template>
  <div class="ShopCar-container">
    <div class="mui-numbox" data-numbox-min='1'>
      <button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
      <input id="test" class="mui-input-numbox" type="number" value="1" @change="countChanged" ref="numbox" />
      <button class="mui-btn mui-btn-numbox-plus" type="button">+</button>
    </div>
  </div>
</template>

<script>
// 导入mui使用的js文件
import mui from "../../lib/mui/js/mui.min.js"

  export default {
    name:'',
    props:['max'],
    data () {
      return {

      };
    },

    components: {},

    computed: {},

    mounted() {
      // 手动初始化数字选择框
      mui('.mui-numbox').numbox()
    },

    created() {},

    methods: {
      countChanged(){
      // 数量改变了
      }
    },

    watch: {
    }

  }

</script>
<style lang='scss' scoped>
.ShopCar-container{
  display: inline;
}
</style>
<template>
<!-- 问题： 我们不知道什么时候能够拿到 max 值，但是，总归有一刻，会得到一个真正的 max 值 -->
<!-- 我们可以 使用 watch 属性监听，来 监听 父组件传递过来的 max 值，不管 watch 会被触发几次，但是，最后一次，肯定是一个 合法的 max 数值 -->
  <div>
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
        // 每当 文本框的数据被修改的时候，立即把 最新的数据，通过事件调用，传递给父组件
        // this.$refs.numbox.value获取当前组件页面dom元素值
        // console.log(this.$refs.numbox.value);
        // 子组件绑定一个方法，并传递一个参数（ 子组件  向父组件  传递   事件  以及  携带数据data）
        this.$emit("getcount", parseInt(this.$refs.numbox.value));
      }
    },

    watch: {
      // 属性监听
      max :function (newVal,oldVal) {
        // 使用 JS API 设置 numbox 的最大值  http://dev.dcloud.net.cn/mui/ui/#setOption
        mui(".mui-numbox")
          .numbox()
          .setOption("max", newVal);
      }
    }

  }

</script>
<style lang='scss' scoped>

</style>
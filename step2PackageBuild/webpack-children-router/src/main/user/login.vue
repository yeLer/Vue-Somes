<template>
  <div>
    <h1>{{msg}}</h1>
  </div>
</template>

<script>
//ES6中  ，使用import 模块名称 from '模块标识符'   
//ES6中  ，使用export default(导入时 模块名称作为一个变量名称可随意起名)和export（导入时  只能按照名称按需导出）向外暴露成员

export default {
  name: "",
  props: [""],
  //组件中的data必须是一个function
  data() {
    return {
      msg: "这是登录组件"
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  mounted() {},

  methods: {},

  watch: {}
};
</script>

<style scoped>
/* 普通的style标签只支持普通的样式，如果想要启用scss或less ,需要为style元素设置lang属性 */
  div{
    font-style: italic;
  }
</style>
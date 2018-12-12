<template>
  <div>
    <cmtbox :id="$route.params.id"></cmtbox>
  </div>
</template>

<script>
  import cmtbox from '../subcomponents/Comment.vue'
  export default {
    name:'',
    props:[''],
    data () {
      return {

      };
    },

    components: {
      // 注册子组件
      cmtbox
    },

    computed: {},

    beforeMount() {},

    created() {},

    methods: {},

    watch: {}

  }

</script>
<style lang='scss' scoped>

</style>
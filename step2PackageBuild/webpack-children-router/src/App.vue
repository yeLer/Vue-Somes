<template>
  <div>
    <h1>这是app组件</h1>
    <router-link to="/account">account</router-link>
    <router-link to="/goodslist">goodslist</router-link>

    <router-view></router-view>
  </div>
</template>

<script>

  export default {
    name:'',
    props:[''],
    data () {
      return {

      };
    },

    components: {},

    computed: {},

    beforeMount() {},

    mounted() {},

    methods: {},

    watch: {}

  }

</script>
<style lang='' scoped>

</style>
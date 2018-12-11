<template>
  <div class="PhotoList">
    <!-- 顶部滑动条区域 -->
    <div id="slider" class="mui-slider">
      <div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
        <div class="mui-scroll">
          <!-- tap只有mui组件能使用 -->
          <a :class="['mui-control-item', item.pk ==0 ?'mui-active':'']" 
              v-for="item in ImageCategory" 
              :key="item.pk"
              href=""
              @tap.prevent="getPhotoListByCategoryId(item.pk)"
              >
            {{item.fields.title}}
          </a>
        </div>
      </div>
    </div>
    <!-- 图片列表区域 -->
    <ul class="photo-list">
      <!-- tag用于指定渲染的标签类型 -->
      <router-link v-for="item in img_list" :key="item.pk" :to="'/home/photoInfo/'+item.pk" tag="li">
        <img v-lazy="item.fields.img_url">
        <div class="info">
          <div class="info-title">{{item.fields.title}}</div>
          <div class="info-body">{{item.fields.summary}}</div>
        </div>
      </router-link>
    </ul>
  </div>
</template>

<script>
//1 导入mui的js文件
import mui from "../../lib/mui/js/mui.min.js";

import { Toast } from "mint-ui";
export default {
  name: "PhotoList",
  props: [""],
  data() {
    return {
      ImageCategory: [], //所有图片分类的列表
      img_list: [] //图片列表的数组
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  mounted() {
    //当组件中的DOM结构被渲染好，并放置到页面中   会执行这个函数，如果要操作元素  最好在mounted里面
    //2 初始化滑动控件
    mui(".mui-scroll-wrapper").scroll({
      deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
    });
  },

  created() {
    this.getAllImageCategory();
    this.getPhotoListByCategoryId(0);
  },

  methods: {
    // 获取所有的图片分类
    getAllImageCategory() {
      this.$http.get("api/getImageCategory").then(response => {
        if (response.body.status === 0) {
          // 手动添加一个对象
          response.body.message.unshift({ fields: { title: "全部" }, pk: 0 });
          this.ImageCategory = response.body.message;
          // console.log(response.body);
        } else {
          Toast("获取列表失败");
        }
      });
    },
    //根据分类id获取图片列表
    getPhotoListByCategoryId(CategoryId) {
      this.$http
        .get("api/getPhotoListByCategoryId/" + CategoryId)
        .then(response => {
          if (response.body.status === 0) {
            this.img_list = response.body.message;
            // console.log(response.body.message);
          } else {
            Toast("获取列表失败");
          }
        });
    }
  },

  watch: {}
};
</script>
<style lang='scss' scoped>
//为了防止顶部滑动条警告
* {
  touch-action: pan-y;
}

.photo-list {
  list-style: none;
  margin: 0;
  padding: 10px;
  padding-bottom: 0;
  li {
    background-color: #ccc;
    text-align: center;
    margin: 0 0 10px 0;
    box-decoration-break: 0 0 9px #999;
    position: relative;
    img {
      width: 100%;
      vertical-align: middle;
    }
    img[lazy="loading"] {
      width: 40px;
      height: 300px;
      margin: auto;
    }
  }
  .info {
    position: absolute;
    bottom: 0px;
    color: white;
    text-align: left;
    padding-left: 5%;
    width: 100%;
    // 透明效果
    background-color: rgba($color: #000000, $alpha: 0.4);
    max-height: 84px;
    .info-title {
      font-size: 15px;
    }
    .info-body {
      font-size: 13px;
    }
  }
}
</style>
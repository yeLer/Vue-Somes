<template>
  <div class="photoinfo-container">
    <h3>{{photoinfo.title}}</h3>
    <p class="subtitle">
      <span>发表时间:{{photoinfo.add_time|forMatTime}}</span>
      <span>点击{{photoinfo.click_times}}次</span>
    </p>

    <hr>

    <!-- 缩略图区域 -->
    <vue-preview :slides="photo_slides" @close="handleClose"></vue-preview>

    <!-- 图片内容区域 -->
    <div class="content" v-html="photoinfo.content">
    </div>
    <!-- 放置现成的评论子组件 -->
    <cmt-box :id="id"></cmt-box>
  </div>
</template>

<script>
import { Toast } from "mint-ui";
//1 导入评论子组件
import comment from "../subcomponents/Comment.vue";
export default {
  name: "",
  props: [""],
  data() {
    return {
      // 路由的id传参接收方法
      id: this.$route.params.id,
      photoinfo: { title: "", click_times: "", add_time: "", content: "" }, //图片详情对象
      photo_slides: [] //存放图片缩略图的数组
    };
  },

  components: {
    // 注入名称
    "cmt-box": comment
  },

  computed: {},

  beforeMount() {},

  created() {
    this.getImageInfo();
    this.getThumbs();
  },

  methods: {
    // 获取图片的详情
    getImageInfo() {
      this.$http.get("api/getImageInfo/" + this.id).then(response => {
        if (response.body.status === 0) {
          if (response.body.message.length === 1) {
            var meg = response.body.message[0];
            this.photoinfo.title = meg.fields.title;
            this.photoinfo.click_times = meg.fields.click_times;
            this.photoinfo.add_time = meg.fields.add_time;
            this.photoinfo.content = meg.fields.content;
          } else {
            Toast("当前图片还没有详情");
          }
          // console.log(response.body.message);
        } else {
          Toast("获取列表失败");
        }
      });
    },
    // 获取详情页缩略图的列表
    getThumbs() {
      this.$http.get("api/getThumbs/" + this.id).then(response => {
        if (response.body.status === 0) {
          // console.log(response.body.message)
          var slides = response.body.message;
          // 循环图片的数据，补全图片的宽和高,把完整的数据补全到list中
          response.body.message.forEach(element => {
            element.w = 600;
            element.h = 400;
            var src = element.fields.img_src;
            var msrc = element.fields.img_msrc;
            var alt = element.fields.alt;
            var title = element.fields.title;
            var obj = {
              src: src,
              msrc: msrc,
              alt: alt,
              title: title,
              h: element.h,
              w: element.w
            };
            this.photo_slides.push(obj);
          });
        } else {
          Toast("获取缩略图失败");
        }
      });
    },
    // 处理缩略图的关闭事件
    handleClose() {
      console.log("close event");
    }
  },

  watch: {}
};
</script>
<style lang='scss' scoped>
.photoinfo-container {
  padding: 6px;
  h3 {
    color: #26a2ff;
    font-size: 15px;
    text-align: center;
    margin: 15px 0;
  }
  .subtitle {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
  }
  .content {
    font-size: 13px;
    line-height: 30px;
    .img-container {
      width: 100%;
      height: 100%;
    }
  }
  .my-gallery {
    figure {
      img {
        width: 120px;
        height: 120px;
      }
    }
  }
}
</style>
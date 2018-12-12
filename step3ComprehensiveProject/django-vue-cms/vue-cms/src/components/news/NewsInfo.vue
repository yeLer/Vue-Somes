<template>
  <div class="news-info-container">

    <h3 class="title">{{newsInfo.title}}</h3>
    <p class="sub-title">
      <span>发表时间:{{newsInfo.add_time|forMatTime}}</span>
      <span>点击:{{newsInfo.click_times}}次</span>
    </p>
    <!-- 内容 -->
    <div class="news-content" v-html="newsInfo.content"></div>
    <!-- 评论子组件 -->
    <comment-box :id="id"></comment-box>
  </div>
</template>

<script>
import { Toast } from "mint-ui";

//1 导入子组件
import Comment from "../subcomponents/Comment.vue";

export default {
  name: "",
  props: [""],
  data() {
    return {
      id: this.$route.params.id, //将url传递过来的id值挂载在data上，供后续调用
      newsInfo: {
        title: "",
        add_time: "",
        click_times: "",
        content: ""
      }
    };
  },

  components: {
    "comment-box": Comment //注册评论子组件
  },

  computed: {},

  beforeMount() {},

  created() {
    this.getNewsInfo();
  },

  methods: {
    // 获取新闻
    getNewsInfo() {
      // api前面千万不要加 /
      // this.$http.get("/api/getNewsInfo/" + this.id).then(result => {
      this.$http.get("api/getNewsInfo/" + this.id).then(result => {
        if (result.body.status === 0) {
          var newsInfo = result.body.message;
          //获取成功
          if (result.body.message.length === 1) {
            this.newsInfo.title = newsInfo[0].fields.title;
            this.newsInfo.add_time = newsInfo[0].fields.add_time;
            this.newsInfo.click_times = newsInfo[0].fields.click_times;
            this.newsInfo.content = newsInfo[0].fields.content;
          }
        } else {
          Toast("获取新闻详情失败!");
        }
      });
    }
  },

  watch: {}
};
</script>
<style lang='scss'>
.news-info-container {
  padding: 0 8px;
  img {
    width: 100%;
    height: 100%;
  }
  .title {
    font-size: 16px;
    text-align: center;
    margin: 15px 0;
    color: #000;
  }
  .sub-title {
    font-size: 13px;
    color: rgb(54, 40, 180);
    display: flex;
    justify-content: space-between;
  }
  .news-content {
    p {
      font-size: 15px;
      color: black;
      line-height: 26px;
    }
  }
}
</style>
<template>
  <div class="Comment">
    <h3>发表评论</h3>
    <hr>
    <textarea placeholder="请输入要BB的内容(最多120字)" maxlength="120"></textarea>
    <mt-button type="primary" size="large">发表评论</mt-button>

    <div class="cmt-list">
      <div class="cmt-item" v-for="(item,index) in comments" :key="index">
        <div class="cmt-title">
          第{{index+1}}楼&nbsp;&nbsp;用户:{{item.username}}&nbsp;&nbsp;发表时间:{{item.add_time|forMatTime}}
        </div>
        <div class="cmt-content">{{item.content ==='undefined'?"它太懒，什么都没说":item.content}}</div>
      </div>
    </div>

    <!-- 加载更多 -->
    <mt-button type="danger" size="large" plain @click="getMoreComments">加载更多</mt-button>
  </div>
</template>

<script>
import { Toast } from "mint-ui";
export default {
  name: "",
  props: [""],
  data() {
    return {
      pageIndex: 1, //默认展示第一页的数据
      comments: [
        {
          username: "匿名用户",
          add_time: new Date(),
          content: "锄禾日当午，汗滴禾下土"
        },
        {
          username: "匿名用户",
          add_time: new Date(),
          content: "不知盘中餐，粒粒皆辛苦"
        }
      ] //接收评论列表的数组
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  created() {
    // this.getComments()
  },

  methods: {
    getComments() {
      this.$http
        .get("api/getComments/" + this.id + "?pageindex=" + this.pageIndex)
        .then(result => {
          if (result.body.status === 0) {
            // 如果获取评论列表成功
            // this.comments = result.body.message;
            // 当获取新的评论数据后，在原来基础上进行拼接
            this.comments = this.comments.concat(result.body.message)
          } else {
            Toast("获取评论列表失败");
          }
        });
    },
    getMoreComments(){
      this.pageIndex += 1
      getComments()
    }
  },

  watch: {},
  props: ["id"]
};
</script>
<style lang='scss' scoped>
.Comment {
  h3 {
    font-size: 18px;
  }
  .textarea {
    font-size: 14px;
    height: 85px;
    margin: 0;
  }
  .cmt-list {
    .cmt-item {
      .cmt-title {
        font-size: 14px;
        line-height: 30px;
        background-color: #e6e6e6;
      }
      .cmt-content {
        text-align: center;
        line-height: 36px;
      }
    }
  }
}
</style>
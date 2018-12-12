<template>
  <div class="Comment">
    <h3>发表评论</h3>
    <hr>
    <textarea placeholder="请输入要BB的内容(最多120字)" maxlength="120" v-model="comm_msg"></textarea>
    <mt-button type="primary" size="large" @click="postComment">发表评论</mt-button>

    <div class="cmt-list">
      <div class="cmt-item" v-for="(item,index) in comments" :key="index">
        <div class="cmt-title">
          第{{index+1}}楼&nbsp;&nbsp;用户:{{item.fields.user_name}}&nbsp;&nbsp;发表时间:{{item.fields.add_time|forMatTime}}
        </div>
        <div class="cmt-content">{{item.content ==='undefined'?"它太懒，什么都没说":item.fields.content}}</div>
      </div>
    </div>

    <!-- 加载更多 -->
    <mt-button type="danger" size="large" plain @click="getMoreComments">加载更多</mt-button>
  </div>
</template>

<script>
import { Toast } from "mint-ui";
export default {
  name: "Comment",  //用户名，这里先写死，用户登录以后  需要根据用户名获取
  // 这里的id是父组件的新闻id
  props: ["id"],
  data() {
    return {
      pageIndex: 1, //默认展示第一页的数据
      comments: [], //接收评论列表的数组
      comm_msg: "", //用户输入的评论内容
      userName:"张无忌"
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  created() {
    this.getComments();
  },

  methods: {
    // 获取评论方法
    getComments() {
      this.$http
        .get("api/getComments/" + this.id + "?pageindex=" + this.pageIndex)
        .then(result => {
          if (result.body.status === 0) {
            // 如果获取评论列表成功
            // this.comments = result.body.message;
            // 当获取新的评论数据后，在原来基础上进行拼接
            if (this.comments.length < result.body.total) {
              this.comments = this.comments.concat(result.body.message);
            } else {
              Toast("没有更多了");
            }
          } else {
            Toast("获取评论列表失败");
          }
        });
    },
    // 获取更多评论方法
    getMoreComments() {
      this.pageIndex += 1;
      this.getComments();
    },
    // 发表评论
    postComment() {
      //校验用户输入是否为空
      if (this.comm_msg.trim().length === 0) {
         Toast("评论内容不能为空")
         return  //把本次操作怼回去
      }
      // 参数1 ：请求的url地址+新闻id
      // 参数2 ：提交给服务器的数据对象
      // 参数3 ：定义提交时候的表单格式 { emulateJSON: true }
      this.$http
        .post(
          "api/postComment/" + this.id,
          { userName: this.userName, content: this.comm_msg.trim() }
          // { emulateJSON: true }  //这里避免每次使用都要配置，换成在main.js中进行全局配置  Vue.http.options.emulateJSON = true
        )
        .then(response => {
          if (response.body.status === 0) {  
            //  拼接出一个评论对象
            var cmt = {
              fields:{
                user_name: this.userName, 
                add_time: Date.now(),
                content: this.comm_msg.trim()
                },
              model:"myapp.newscomment",
            }
            // console.log(this.comments)
            this.comments.unshift(cmt)
            this.comm_msg = ""  //评论成功后输入框置空
          } else {
            Toast("评论发送失败");
          }
        });
    }
  },

  watch: {}
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
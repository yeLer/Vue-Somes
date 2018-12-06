<template>
  <div>
    <ul class="mui-table-view">
				<!-- <li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<img class="mui-media-object mui-pull-left" src="../../images/shuijiao.jpg">
						<div class="mui-media-body">
							<h4>能和心爱的人一起睡觉...</h4>
              <p class='mui-ellipsis'>
                <span>发表时间:{{time_date | forMatTime}}</span>
                <span>浏览次数:{{read_times}}</span>
              </p>
						</div>
					</a>
				</li> -->

        <li class="mui-table-view-cell mui-media" v-for="item in news_list" :key="item.id">
					<router-link :to="'/home/NewsInfo/'+item.id">
						<img class="mui-media-object mui-pull-left" :src="item.img_src">
						<div class="mui-media-body">
							<h4>{{item.title}}</h4>
              <p class='mui-ellipsis'>
                <span>发表时间:{{item.time_date | forMatTime}}</span>
                <span>浏览次数:{{item.read_times}}</span>
              </p>
						</div>
					</router-link>
				</li>

			</ul>
  </div>
</template>

<script>
import { Toast } from "mint-ui";
export default {
  name: "",
  props: [""],
  data() {
    return {
      news_list: [
        {
          id: 1,
          title: "能和心爱的人一起睡觉...",
          read_times: 0,
          time_date: new Date(),
          img_src: "/src/images/shuijiao.jpg"
        },
        {
          id: 2,
          title: "想要这样一间小木屋...",
          read_times: 0,
          time_date: new Date(),
          img_src: "/src/images/muwu.jpg"
        }
      ]
    };
  },

  components: {},

  computed: {},

  beforeMount() {},

  create() {
    this.getNewsList();
  },

  methods: {
    // 获取新闻列表页面
    getNewsList() {
      this.$http.get("api/getNewsList").then(result => {
        if (result.body.status === 0) {
          //如果没有失败，应该将数据到data上
          this.news_list = result.body.message;
        } else {
          Toast("获取新闻列表失败!");
        }
      });
    }
  },

  filters: {
    // 由于时间的格式处理在很多组件都有，所以定义为全局过滤器更加合适，定义在main.js当中
    // forMatTime(data) {
    //   var dt = new Date(data);
    //   var y = dt.getFullYear();
    //   var m = (dt.getMonth() + 1).toString().padStart(2, "0");
    //   var d = dt
    //     .getDate()
    //     .toString()
    //     .padStart(2, "0");
    //   return `${y}-${m}-${d}`;
    // }
  },

  watch: {}
};
</script>
<style lang='scss' scoped>
.mui-table-view {
  li {
    h4 {
      font-size: 14px;
    }
    .mui-ellipsis {
      font-size: 13px;
      color: #226aff;
      // css3实现两端布局
      display: flex;
      justify-content: space-between;
    }
  }
}
</style>
<template>
  <div>
    <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media" v-for="item in news_list" :key="item.id">
					<router-link :to="'/home/NewsInfo/'+item.pk">
						<img class="mui-media-object mui-pull-left" :src="item.fields.url_link">
						<div class="mui-media-body">
							<h4>{{item.fields.title}}</h4>
              <p class='mui-ellipsis'>
                <span>发表时间:{{item.fields.add_time | forMatTime}}</span>
                <span>浏览次数:{{item.fields.click_times}}</span>
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
      news_list:[] //存放新闻列表
    };
  },
  created() {
    this.getNewsList();
  },

  methods: {
    // 获取新闻列表页面
    getNewsList() {
      this.$http.get("api/getNewsList").then(result => {
        if (result.body.status === 0) {
          //如果没有失败，应该将数据到data上
          this.news_list = result.body.message;
          // console.log(this.news_list)
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
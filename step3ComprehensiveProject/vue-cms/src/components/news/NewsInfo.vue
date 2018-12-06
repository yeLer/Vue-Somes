<template>
  <div class="news-info-container">
    <!-- <h3 class="title">新闻标题</h3>
    <p class="sub-title">
      <span>发表时间:</span>
      <span>点击:0次</span>
    </p> -->

    <h3 class="title">{{newsInfo.title}}</h3>
    <p class="sub-title">
      <span>发表时间:{{newsInfo.add_time|forMatTime}}</span>
      <span>点击:{{newsInfo.read_times}}次</span>
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
        title: "2018英雄联盟全明星赛 决战拉斯维加斯",
        add_time: new Date(),
        content:
          '<p><p>12月7日，2018年《英雄联盟》全明星赛即将在拉斯维加斯电竞馆拉开序幕，本次全明星赛不仅包含了东西方对决，赛区对抗赛，还有1v1淘汰赛，极限闪击，无限火力，2v2慈善赛，双人共玩等趣味赛事。</p>今年的全明星赛中，赛制回归了娱乐性更强的形式。除了保留1v1Solo对抗外，还新增设了2v2慈善锦标赛，选手们将在哀嚎深渊地\
        图上进行2v2的比赛。参赛人员将会以自己的名义，在拳头游戏卡尔玛慈善部门的帮助下挑选相应的慈善项目，并进行表演赛。同时，\
        在本届全明星赛中还将上演由东方选手与西方选手各自组队进行的东西方全明星对决，还有洲际系列赛的全明星改版!除此之外，\
        每天还将有两支混编队伍，进行另类游戏模式的比赛。全程创意满满的娱乐对战，相信能给玩家们带来非凡的观赛体验。\
        </p><div class="img-container"><img class="large" data-loadfunc=0 src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2510180609,2693572841&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=450&amp;s=34E1B20A21038AED181BC2840300608D" data-loaded=0 /></div><p>在此前LPL赛区的全明星投票中，RNG战队的AD选手Uzi与打野选手Mlxg，凭借着全年的出色表现以超高人气占据了得票数的前两位。而率领iG夺得2018全球总决赛冠军的中单选手Rookie，则获得了官方直邀资格。三人将作为LPL赛区职业选手代表，在本次全明星赛中出战大部分对抗。而拿下总决赛MVP的iG打野选手Ning，则将作为特别嘉宾参与双人共玩模式。此外，LPL赛区的参赛嘉宾还有明星召唤师罗云熙、官方主持余霜与官方解说周淑怡，此外还有玩家们所熟悉的明星主播神超、官总、骚男等，他们将秉承着娱乐至上的精神，共同参与到本次的赛事中来。</p><div class="img-container"><img class="large" data-loadfunc=0 src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1442676014,4040923520&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=450&amp;s=33A3930C444733ED9A3BC68D0300609F" data-loaded=0 /></div><p>其他赛区中，玩家们所熟悉的“大魔王”Faker、“小花生”Peanut、“大师兄”Doublelift等明星选手，都将参与到本次的赛事中来。此外，在全球总决赛上表现亮眼的C9上单选手Licorice、FNC打野选手Broxah与VIT中单选手Jiizuke等人，也同样不会缺席本次全明星赛。</p><div class="img-container"><img class="large" data-loadfunc=0 src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1343299835,549296841&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=337&amp;s=92A7A1AE08DB28DA5B744EAF0300F086" data-loaded=0 /></div><p>在经历了一年中紧张激烈得赛事后，回归娱乐主题的全明星赛相信将给玩家们带来更加轻松欢乐的观赛体验。</p>',
        read_times: 2
      }
    };
  },

  components: {
    "comment-box": Comment //注册评论子组件
  },

  computed: {},

  beforeMount() {},

  created() {
    // this.getNewsInfo()
  },

  methods: {
    // 获取新闻
    getNewsInfo() {
      this.$http.get("/api/getNewsInfo/" + this.id).then(result => {
        if (result.body.status === 0) {
          //获取成功
          this.newsInfo = result.body.message[0];
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
<template>
  <div class="home">
    <h2>这是django与vue结合的案例</h2>
    <div class="tab-header">
      <div class="panel-title">
        <h3 class="panel-title-h3">添加品牌</h3>
      </div>
      
      <div class="panel-body form-inline"> 
        <label>Name:
          <input type="text" class="form-control" v-model="input_name">
        </label> 
        <input type="button" value="添加" class="btn btn-primary" @click="addBook"> 
        <label>搜索名称关键字：
          <input type="text" class="form-control" v-model="keywords">
        </label>
      </div>
    </div>
    <table class="table">
      <thead>
        <tr>
          <td>Id</td>
          <td>Name</td>
          <td>CTime</td>
          <td>Operation</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item,index) in search(keywords)" :key="index">
          <td>{{index+1}}</td>
          <td>{{item.fields.book_name}}</td>
          <td>{{item.fields.add_time | dataFormat("yyyy-mm-dd")}}</td>
          <td>
            <a href="" @click.prevent="del(item.pk)">删除</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      input_name: "",
      add_time: new Date(),
      bookList: [],
      keywords: "" // 搜索的关键字
    };
  },
  created: function() {
    this.showBooks();
  },
  filters: {
    dataFormat: function(dataStr, pattern = "") {
      var dt = new Date(dataStr);
      var y = dt.getFullYear();
      // 两个字符位置的格式化，使用ES6的String方法特性
      // var m = dt.getMonth()
      // var d = dt.getDate()
      // 填充为2位，缺失时用0填充
      var m = dt
        .getMonth()
        .toString()
        .padStart(2, "0");
      var d = dt
        .getDate()
        .toString()
        .padStart(2, "0");

      if (pattern.toLowerCase() === "yyyy-mm-dd") {
        return `${y}-${m}-${d}`;
      } else {
        var hh = dt
          .getHours()
          .toString()
          .padStart(2, "0");
        var mm = dt
          .getMinutes()
          .toString()
          .padStart(2, "0");
        var ss = dt
          .getSeconds()
          .toString()
          .padStart(2, "0");
        return `${y}-${m}-${d} ${hh}:${mm}:${ss}`;
      }
    }
  },
  methods: {
    // 通过get参数获得请求，模拟添加数据
    addBook0() {
      this.$http.get("api/add_book?book_name=" + this.input).then(response => {
        var res = JSON.parse(response.bodyText);
        if (res.error_num === 0) {
          this.showBooks();
        } else {
          this.$message.error("新增书籍失败，请重试");
          console.log(res["msg"]);
        }
      });
    },
    // 使用post方法向python后台提交数据
    addBook() {
      this.$http
        .post(
          "api/add_book",
          { book_name: this.input_name, add_time: this.add_time },
          { emulateJSON: true }
        )
        .then(response => {
          var res = JSON.parse(response.bodyText);
          if (res.error_num === 0) {
            this.showBooks();
            this.input_name = "";
          } else {
            this.$message.error("新增书籍失败，请重试");
            console.log(res["msg"]);
          }
        });
    },
    // 使用get方法向python后台提交获取数据
    showBooks() {
      this.$http.get("api/show_books").then(response => {
        var res = JSON.parse(response.bodyText);
        console.log(res);
        if (res.error_num === 0) {
          this.bookList = res["list"];
        } else {
          this.$message.error("查询书籍失败");
          console.log(res["msg"]);
        }
      });
    },
    del(id) {
      // 根据id找到删除数据的索引
      this.$http.get("api/del_book?id=" + id).then(response => {
        var res = JSON.parse(response.bodyText);
        if (response.body.status === 0) {
          // 删除成功
          this.showBooks();
        } else {
          alert("删除失败！");
        }
      });
    },
    search(keywords) {
      return this.bookList.filter(item => {
        // 注意 ： ES6中，为字符串提供了一个新方法，叫做  String.prototype.includes('要包含的字符串')
        //  如果包含，则返回 true ，否则返回 false
        //  contain
        if (item.fields.book_name.includes(keywords)) {
          return item;
        }
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
a {
  color: #337ab7;
}
.tab-header {
  border-color: #337ab7;
  margin-bottom: 20px;
  background-color: #fff;
  border: 1px solid #337ab7;
  border-top: none;
  border-radius: 4px;
  padding-bottom: 20px;
}

.panel-title {
  background-color: #337ab7;
  color: white;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
}
.panel-title-h3 {
  padding: 10px 0;
  margin-left: 2%;
  text-align: left;
}
.form-control {
  display: inline-block;
  width: auto;
  vertical-align: middle;
  height: 18px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.panel-body {
  padding: 15px;
}
.btn-primary {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}
.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 20px;
  background-color: transparent;
  border-spacing: 0;
  border-collapse: collapse;
}
thead {
  vertical-align: middle;
  border-color: inherit;
}
thead tr {
  height: 40px;
  font-weight: bold;
}

th {
  border-top: 0;
  border-bottom-width: 2px;
  border: 1px solid #ddd;
  vertical-align: bottom;
  padding: 8px;
  line-height: 1.42857143;
  text-align: left;
}
td {
  border: 1px solid #ddd;
  height: 32px;
}
</style>
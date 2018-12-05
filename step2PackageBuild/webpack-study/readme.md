npm init -y   获取package.json进行初始化,如果项目名称含有中文  不能带有-y参数

npm i jquery -S  安装jquery

webpack .\src\main.js .\dist\bundle.js   执行打包


-----------------------------
//  webpack@3.12.0，webpack-dev-server@2.11.2也是可以的，亲测有效
//  一般情况是因为Webpack与webpack-dev-server版本不兼容导致。
//  像我也出现此问题，我电脑的webpack是1.13.1，但webpack-dev-server是2.x以上的版本。
//  当我将webpack-dev-server卸载掉：npm uninstall webpack-dev-server -g（带-g是全局卸载）
//  然后安装1.15.0版本的webpack-dev-server，就可解决了此问题。：npm install webpack-dev-server@1.15.0 -g

npm init -y   项目初始化
cnpm i webpack@3.0.0 -D          webpack-dev-server 这个工具，如果想要正常运行，要求，在本地项目中，必须安装 webpack
cnpm i html-webpack-plugin@3.2.0 -D   内存中加载html页面的插件
cnpm i webpack-dev-server@2.11.3 -D  托管服务的的开发工具
cnpm i style-loader css-loader -D   打包处理 css 文件，需要安装style-loader和css-loader
cnpm i less less-loader -D    支持less文件加载(style-loader css-loader less less-loader)
cnpm i node-sass sass-loader -D    支持sass文件加载(style-loader css-loader node-sass sass-loader)
cnpm i url-loader file-loader -D    支持图片文件路径加载(file-loader url-loader)

//json文件不允许写注释，npm i/ cnpm i  会将package.json中的依赖包安装，如果手动中止安装，需要清理掉前面安装的内容并重新安装
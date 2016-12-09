# covue

> 基于webpack脚手架的vue.js项目

## 构建方式

```
# 安装covue，已包含cli
npm install covue -g

# 创建covue项目
covue my-project

# 安装node_modules
npm install

#开发构建
npm run dev

#生产构建
npm run build
```

## 简介
> 考虑公司开发环境和编码习惯，因此将vue.js作以下调整：
1. 添加browserify规范，支持require
2. 添加coffee-script、jade、nodemon等loader，支持coffee语法和jade模板（jade模板已更名为pug）
3. 分离前后端项目，支持HMR和node.js服务监听

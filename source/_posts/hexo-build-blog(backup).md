---
title: hexo搭建个人博客（备份和迁移）
date: 2018-12-03 19:14:50
tags: 
   - hexo
   - next
categories: 工具
---

# 一、前言
一般情况下，我们博客的相关配置信息都是在本地操作的, 但是当我们更换了设备或者电脑出现故障了等，那么我们便无法再维护我们的博客了。因而为了保护我们的劳动成果以及将来能更方便的维护博客，我们需要对博客进行备份和迁移，也就是将博客的相关配置信息上传到github上进行托管。日后有必要的时候可以从github上克隆到本地进行博客的维护等操作。
<!-- more --> 
# 二、思路
在搭建博客的时候，我们已经将博客部署到了github上去，其实部署上去只是生成的静态文件。因而还需要将hexo生成的网站源文件也push到github上。这个时候需要再github上创建分支，其中主分支master已经存放了生成的静态网页。
# 三、处理流程
## 1.预处理
将hexo的主题下的.git删除，比如删除themes/next/目录下的.git否则无法将主题文件夹push。
在本地D:blog文件夹下创建文件.gitignore，正常情况这个文件是自动生成的，打开后写入：
```
.DS_Store
Thumbs.db
db.json
*.log
node_modules/
public/
.deploy*/
```
这个文件的存在是指在push的时候忽略文件中的文件格式。
## 2.创建本地分支
```
#git初始化
git init
#创建hexo分支，用来存放源码
git checkout -b hexo
#git 文件添加
git add .
#git 提交
git commit -m "backup"
#添加远程仓库，github上的博客仓库
git remote add origin git@github.com:xinyunduan/xinyunduan.github.io.git
#push到hexo分支
git push origin hexo
```
至此，远端就有了有两个分支，master和hexo
## 3.执行部署
```
hexo g && hexo d
```
# 四、恢复或多终端操作
1、确定一个存放博客的文件夹，直接拉取远端的hexo分支
```
# git clone -b <远程指定分支> <远程仓库地址> <本地文件夹名>
git clone -b hexo git@github.com:xinyunduan/xinyunduan.github.io.git ./blog
```
将hexo分支克隆到本地文件夹blog下。

如果新环境没有安装git、node.js等环境，则还需要自行安装git、node.js，配置git与github绑定行管操作，这里不再赘述。
2、安装hexo依赖
```
npm instal
```
# 五、更新博客
每次操作完之后，最好再重新部署和备份
```
hexo cl && hexo g && hexo d #生成网站并部署到GitHub上
git add .
git commit -m 'update'
git push origin hexo
```




---
title: hexo搭建个人博客（安装与部署）
date: 2018-11-25 09:18:49
categories: 工具
tags: 
  - hexo
  - next
---

# 一、前言
hexo是一款基于Node.js的静态博客框架，依赖少易于安装使用，可以将生成的网站部署并托管到github上。
在搭建博客之前首先需要有一个github账号并且配置了SSH Keys（[git生成ssh key](https://www.cnblogs.com/zzw731862651/p/9327632.html)），还需要安装git、安装node.js和安装hexo。
<!-- more --> 
本篇博客相关安装说明：
node版本：Node.js v12.14.0.
hexo版本：hexo: 4.2.0
主题next版本：NexT.Gemini v7.6.0

# 二、准备工作
## 1.安装git
直接下载git安装到本地，打开cmd输入：git --version
```
git --version
```
如果输出git的版本信息说明安装成功。
## 2.安装node.js
直接下载node.js安装到本地，打开cmd输入：node -v
```
node -v
```
如果输出git的版本信息说明安装成功。

## 3.更换npm源
npm是node.js的包管理工具，新版的node.js已经集成了npm，同样可以输入:npm -v来测试是否安装成功
```
npm -v
```
- 允许用户从npm服务器下载别人编写的第三方包到本地使用。
- 允许用户从npm服务器下载并安装别人编写的命令行程序到本地使用。
- 允许用户将自己编写的包或命令行程序上传到npm服务器供别人使用。
更换淘宝镜像：使用cnpm来安装模块，其速度比npm要快。
```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

## 4.安装hexo
```
cnpm install -g hexo-cli
```
在cmd中输入hexo -v检查是否安装成功

## 5.hexo常用命令
|命令|简写|描述
|:--:|:--:|:--:|
|hexo init [folder]| |用于新建一个网站，如果后面没有跟folder，hexo会默认在当面的文件建立资源。|
|hexo clean|hexo cl|清除缓存文件 (db.json) 和已生成的静态文件 (public)。|
|hexo generate|hexo g|生成静态文件|
|hexo server|hexo s|启动本地服务器|
|hexo deploy|hexo d|部署网站|

# 三、建站
## 1.创建资源
安装完hexo后，在windows的目录下新建一个文件夹用于存放hexo资源，比如在D:blog/目录下
进入到该文件夹的根目录下：
```
hexo init
cnpm install
```
执行完之后再该目录下会生成很多的其他文件。
## 2.基础配置
**注意：** 区分配置文件_config.yml，一个是根目录下的配置文件，通常叫做站点配置文件，包含hexo本身的配置；另一个是主题下(themes)的配置文件，通常叫做主题配置文件，主要是针对主题的配置。
打开站点配置文件_config.yml，配置可以参考官网的[教程配置](https://hexo.io/zh-cn/docs/configuration.html)
```
# 文件位置：~/_config.yml
# Hexo version: v4.0.0

# Hexo Configuration
## Docs: https://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/

# Site
## 网站标题、副标题、网站描述、关键词、作者、语言等基本信息的配置
title: 咸鱼翻身
subtitle: Viva La Vida
description: 
keywords: 
author: Duan Xinyun
language: zh-CN  #语言选择，在themesnext/language下，文件名就是可以选择的语言，打开文件可以设置显示内容。
timezone: Asia/Shanghai

# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
## 博客的网址及文章 URL 结构，默认在根目录
## 如果你想要将博客设定在一个子目录，如 'http://yoursite.com/blog'，则将 root 设定为该子目录的名称 '/child/'
## 建议博客的 URL 结构在博客建立初期就规划好，因为当你写的文章被搜索引擎收录以及被读者收藏后，再更改结构，会对你的网站访问造成一定影响
url: https://xinyunduan.github.io/
root: /
## 详细参数请查看：https://hexo.io/docs/permalinks.html
## 这里默认的路径太不利于 SEO，建议修改成较短的链接。比如 'year:month:day/:title/'
## 或者你也可以考虑使用一些插件，直接生成永久链接，如 hexo-abbrlink 插件：https://github.com/rozbo/hexo-abbrlink
permalink: :year/:month/:day/:title/
permalink_defaults:

# Directory
## 这里是设定一些基本文件夹的名称，如资源文件夹等。
source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
## skip_render 是为了避免在执行 'hexo generate' 命令后将一些你不想转义的文件转成 HTML 格式。
## 比如 README.md，你可以将这些文件名填写在括号内，格式为 [README.md, Post1.md, Post2.md]
skip_render: [README.md]

# Writing
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
## post_asset_folder 设置为 true 后，当你新建一个 post 的时候，会在同级目录生成一个相同名字的文件夹
post_asset_folder: false
relative_link: false
future: true
## 代码高亮设置
highlight:
  enable: true
  line_number: true
## 代码自动高亮
  auto_detect: false
  tab_replace:
  
# Home page setting
# path: Root path for your blogs index page. (default = '')
# per_page: Posts displayed per page. (0 = disable pagination)
# order_by: Posts order. (Order by date descending by default)
index_generator:
  path: ''
  per_page: 10
  order_by: -date
  
# Category & Tag
default_category: uncategorized
## URL 中的分类和标签「翻译」成英文
## 参见：https://github.com/hexojs/hexo/issues/1162
category_map:
tag_map:

# Date / Time format
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD
time_format: HH:mm:ss

# Pagination
## Set per_page to 0 to disable pagination
per_page: 10
pagination_dir: page

# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next

######################################
###   以下为我额外添加的参数设定  ######
######################################
# Deployment
## Docs: https://hexo.io/docs/deployment.html
## Dependency: https://github.com/hexojs/hexo-deployer-git
## 设定执行 'hexo deploy' 命令后提交的代码仓库地址
deploy:
  type: git
  repo: git@github.com:xinyunduan/xinyunduan.github.io.git
  branch: master
  
# 推荐文章功能插件，需要同主题配置文件一起设定
## Dependency: https://github.com/huiwang/hexo-recommended-posts
recommended_posts:
  server: https://api.truelaurel.com #后端推荐服务器地址
  timeoutInMillis: 10000 #服务时长，超过此时长，则使用离线推荐模式
  internalLinks: 5 #内部文章数量
  externalLinks: 0 #外部文章数量
  fixedNumber: true
  autoDisplay: false

# Aplayer 音乐播放器插件
## Dependency: https://github.com/MoePlayer/hexo-tag-aplayer
aplayer:
  script_dir: js # Public 目录下脚本目录路径，默认: 'assets/js'
  style_dir: css # Public 目录下样式目录路径，默认: 'assets/css'
  #cdn: http://xxx/aplayer.min.js # 引用 APlayer.js 外部 CDN 地址 (默认不开启)
  #style_cdn: http://xxx/aplayer.min.css # 引用 APlayer.css 外部 CDN 地址 (默认不开启)
  meting: true # MetingJS 支持
  #meting_api: http://xxx/api.php # 自定义 Meting API 地址
  #meting_cdn: http://xxx/Meing.min.js # 引用 Meting.js 外部 CDN 地址 (默认不开启)
  asset_inject: true # 自动插入 Aplayer.js 与 Meting.js 资源脚本, 默认开启
  #externalLink: http://xxx/aplayer.min.js # 老版本参数，功能与参数 cdn 相同

# NexT 主题统计文章字数与阅读时长功能，需要同主题配置文件一起设定,需要安装插件hexo-symbols-count-time --save
symbols_count_time:
  symbols: true
  time: true
  total_symbols: true
  total_time: true
  exclude_codeblock: false
```

# 四、主题安装
在建站之后，根目录下会有一个themes的文件夹用于存放各种主题，默认的是landscape主题，如果你不喜欢可安装其他的主题，hexo的[更多主题](https://hexo.io/themes/)选择。
本文使用的是next主题，也是目前最受欢迎的一个主题，下面我们来安装一下next主题。
## 1.安装next主题
[next官网](https://theme-next.org/)，原来的旧版本已经停止更新了，为了不必要的麻烦请下载安装6.0版本之后的。
这个是next v5版本的，目前已经停止维护了。https://github.com/iissnan/hexo-theme-next
以下是v6版本及更新版本的，
```
git clone https://github.com/theme-next/hexo-theme-next themes/next
```
之后在themes目录下会生成一个next的主题文件夹。进入themes/next，可以用查看版本数,tag是显示出来的版本号，选择其中一个版本就可以，默认是最新的版本。
```
git tag -l #查看版本
git checkout tag
```
## 2.启用next主题
打开站点配置配置文件_config.yml文件，找到theme字段，将值改成next。注：冒号后面空一个，该值的名称与theme目录下的主题文件夹名称一致。
```
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next
```
## 3.启动服务
每次切换主题之后需要清除hexo的缓存
```
# 清楚缓存
hexo clean
#生成静态文件
hexo g
#启动本地服务器
hexo s
```
在终端可以看到：INFO  Hexo is running at http://localhost:4000/. Press Ctrl+C to stop.打开浏览器便可以访问博客了。

# 五、部署到github
## 安装部署工具
```
npm install hexo-deployer-git --save
```
## github新建一个repository
repository的格式为：username.github.io
**注：一定是username.github.io，uername与前面的owner保持一致，否则访问不了。**
## 添加部署信息
打开站点配置文件_config.yml，翻到最底部找到deploy节点编辑：
```
deploy:
  type: git
  repo: git@github.com:xinyunduan/xinyunduan.github.io.git
  branch: master
```
## 部署网站
hexo d -g
以后每次写完文章之后一次执行如下命令就可以发布更新了。
```
hexo cl&&hexo g&&hexo d
```
然后在浏览器输入xinyunduan.github.io就可以访问你的个人博客了。
如果不能正常显示，请再次注意域名的username与github的username是否一致。

# 总结
执行到这里，已经搭建了一个基本的博客框架了，后期再根据个人需求进一步优化next主题。接下来一篇分享我的主题优化过程。

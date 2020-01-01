---
title: hexo搭建个人博客（next主题基础配置）
categories: 工具
tags:
  - hexo
  - next
abbrlink: 3e935e30
date: 2018-11-25 17:28:06
---

过上一步的努力，我们终于搭建好了一个属于自己的博客框架，并且还安装了next主题，但是博客的结构还比较捡漏，接下来我们需要把她美化一下，本文主要是针对next主题的美化。进入到hexo生成的博客目录，如D:blog/， **所有的hexo命令都是在该路径下执行**
hexo的站点配置详解[官方配置说明](https://hexo.io/zh-cn/docs/configuration.html)
<!-- more --> 
# 一、添加基本信息
基本信息主要包括博客标题、副标题、博客描述、作者姓名、头像等。
打开站点配置文件_config.yml，对着官网的参数详解根绝个人喜好添加信息。
```
# Site
title: 咸鱼翻身
subtitle: Viva La Vida
description: Brainy is the new sexy
keywords:
author: Duan Xinyun
language: zh-Hans
timezone: Asia/Shanghai
```
# 二、next主题的样式选择与配置
打开themes/next/目录下的主题配置文件_config.yml，[next官方配置说明](http://theme-next.iissnan.com/theme-settings.html)
```
# ---------------------------------------------------------------
# Scheme Settings
# ---------------------------------------------------------------

# Schemes
#scheme: Muse
#scheme: Mist
#scheme: Pisces
scheme: Gemini
```
选择next的样式，只能选择其中一个样式，选中哪一个样式就删除前面的注释符号（#），不用的就注释掉。
# 三、菜单设置
## 1.添加菜单
打开themes/next/目录下的主题配置文件_config.yml，[next官方配置说明](http://theme-next.iissnan.com/theme-settings.html)
菜单包括：首页、归档、分类、标签、关于等。
```
#主菜单
## 添加菜单
menu:
  home: / || home  #首页
  #about: /about/ || user #关于
  tags: /tags/ || tags  #标签
  categories: /categories/ || th #分类
  archives: /archives/ || archive #归档
  #schedule: /schedule/ || calendar
  #sitemap: /sitemap.xml || sitemap
  #commonweal: /404/ || heartbeat

# Enable/Disable menu icons.
menu_icons:
  enable: true
```
这里选择了home(首页)、tags(标签)、cateigories（分类）、归档（archives)，menu_icons设置为true的话，会显示对应的图标。关于显示的文本可以选择对应的languange去themes/next/languanges下参考和修改，比如我们在站点配置文件中的languange配置的是zh-Hans，对应的找到themes/next/languages/zh-CN.yml中参考或修改。
**注意这里可能存在的坑**：先针对修改的内容预览一下，运行下面的代码，打开http://localhost:4000/
```
hexo clean && hexo g && hexo s
```
如果首页、标签等不能正确跳转，将斜杆后面的空格去掉。这个应该是主题版本的问题，注意使用v6版本以上next主题。
原始：home: / || home
修改：home: /|| home
其他同理。
再预览试试应该没问题了，这里的空格貌似被非法转义了。如果没有遇到上述问题请忽略！
## 2.添加类别模块
如果在菜单配置中选择了categories，那么为了使文章能够正确映射到对应的类别，需要新建一个分类页面。每次添加一个新的页面即hexo new page "page name"，都会在./source/页面下生成一个对应文件夹，文件下面有个一个markwdowm文件index.md，需要指定type。
```
hexo new page categories
```
这时在source文件夹下生成了categorcies/index.md，打开index.md进行设置
```
---
title: categories
date: 2018-12-24 21:41:35
type: "categories"
commnets: false
categories:
    - 工具
    - python
    - 机器学习
    - 深度学习
    - 数据挖掘
---
```
指定类型为categories，并设置了工具、python、机器学习、深度学习、数据挖掘等几个类别。注意添加categories的格式，另外一种是[类别1，类别2,.....]。

## 3.添加分类模块
如果在菜单配置中选择了tag，那么为了使文章能够正确映射到对应的标签，需要新建一个标签页面。
```
hexo new page tags
```
这时在source文件夹下生成了tags/index.md，打开index.md进行设置,最重要的是要指定type:"tags"，否则博客网站点击标签菜单会提示找不到标签，其他menu类似。
```
---
title: tags
date: 2018-12-24 20:46:35
type: "tags"
comments: false
tags:
    - hexo
    - Linux
    - python
    - 机器学习
    - 数据结构与算法
    - 深度学习
---
```
指定类型为tags，并设置了hexo、Linux、python、机器学习、数据结构与算法、深度学习等几个标签。

# 四、侧边栏格式设置
```
sidebar:
# Sidebar Position - 侧栏位置（只对Pisces | Gemini两种风格有效）
  position: left        //靠左放置
  #position: right      //靠右放置

# Sidebar Display - 侧栏显示时机（只对Muse | Mist两种风格有效）
  display: post        //默认行为，在文章页面（拥有目录列表）时显示
  #display: always       //在所有页面中都显示
  #display: hide        //在所有页面中都隐藏（可以手动展开）
  #display: remove      //完全移除

  offset: 12            //文章间距（只对Pisces | Gemini两种风格有效）

  b2t: false            //返回顶部按钮（只对Pisces | Gemini两种风格有效）

  scrollpercent: true   //返回顶部按钮的百分比
```

# 五、头像设置
   打开主题配置文件_config.yml
  只需把你的头像命名为header.jpg（随便命名）保存themes/next/source/images中，在主题配置文件中将avatar的路径名改成你的头像路径就好了。
```
# Sidebar Avatar  头像
# in theme directory(source/images): /images/avatar.gif
# in site  directory(source/uploads): /uploads/avatar.gif
avatar:
  # Replace the default image and set the url here.
  url: /images/header.jpg #头像保存路径
  # If true, the avatar will be dispalyed in circle.
  rounded: true  #设置圆形头像，为了保持美观，尽量使用长宽为1:1的图片
  # If true, the avatar will be rotated with the cursor.
  rotated: false  #鼠标放上面，头像旋转

```

# 六、设置RSS订阅
1、先安装 hexo-generator-feed 插件
```
npm install hexo-generator-feed --save
```

2、打开**站点配置文件_config.yml**，找到social:下面的RSS去掉注释符号就可以了。
```
RSS: /atom.xml || rss
```
# 七、添加搜索功能
1、安装 hexo-generator-searchdb 插件
```
$ npm install hexo-generator-searchdb --save
```
2、打开**站点配置文件config.yml**,找到Local Search在下面将enable改为true就可以。如果没有安装插件的话，搜索功能会实现不了。
```
# Local Search
# Dependencies: https://github.com/theme-next/hexo-generator-searchdb
local_search:
  enable: true
  # If auto, trigger search by changing input.
  # If manual, trigger search by pressing enter key or search button.
  trigger: auto
  # Show top n results per article, show all results by setting to -1
  top_n_per_article: 1
  # Unescape html strings to the readable one.
  unescape: false
  # Preload the search data when the page loads.
  preload: false

```

# 八、添加社交模块
想要哪个就去掉注释符号，也可以自定义。social_icons是对应的社交图标，[更多图标](https://fontawesome.com/icons?from=io)
```
# Social Links
# Usage: `Key: permalink || icon`
# Key is the link label showing to end users.
# Value before `||` delimiter is the target permalink, value after `||` delimiter is the name of Font Awesome icon.
social:
  GitHub: https://github.com/yourname || github
  E-Mail: mailto:yourname@gmail.com || envelope
  #Weibo: https://weibo.com/yourname || weibo
  #Google: https://plus.google.com/yourname || google
  #Twitter: https://twitter.com/yourname || twitter
  #FB Page: https://www.facebook.com/yourname || facebook
  #StackOverflow: https://stackoverflow.com/yourname || stack-overflow
  #YouTube: https://youtube.com/yourname || youtube
  #Instagram: https://instagram.com/yourname || instagram
  #Skype: skype:yourname?call|chat || skype
  RSS: /atom.xml || rss

social_icons:  #图标显示
  enable: true
  icons_only: false
  transition: false
```

# 参考文档
[hexo官网配置](https://hexo.io/zh-cn/docs/)
[next主题配置](https://theme-next.org/docs/)
[图标设置](https://fontawesome.com/icons?from=io)
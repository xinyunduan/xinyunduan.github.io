---
title: hexo搭建个人博客（next主题优化）
date: '2018-12-01:02:13'
tags:
  - hexo
  - next
categories: 工具
abbrlink: c023416d
---

# 1.文章创建、更新和删除
- 创建文章
首先需要进入你的博客的根目录下
```
hexo new "博客标题"
```
之后会在/source/_posts/目录下生成“博客标题.md”文件，然后就可以在该文件中采用markdown的方式写作。.md文件头部会自动生成title和date，如果要对文章进行标签和类别分类的需要手动加上。如下：
<!-- more --> 
```
---
title: hexo搭建个人博客（next主题优化）
date: 2018-12-19:02:13
tags: 
  - hexo
  - next
categories: 工具
---
```
分类和标签的主要事项请参看[官网](https://hexo.io/zh-cn/docs/front-matter.html#%E5%88%86%E7%B1%BB%E5%92%8C%E6%A0%87%E7%AD%BE)

- 修改文章
修改文章简单，只需在/source/_posts/目录下找到对应的.md文件进行编辑就可以。
- 删除文章
删除文件简单，只需在/source/_posts/目录下找到对应的.md文件删除就可以。

**注意：**每次操作需要清除静态文件缓存再重新生成静态文件即可。
```
hexo cl && hexo g
```
# 2.主题自带样式
- tabs标签
```
{% tabs 选项卡, 2 %}
<!-- tab -->
**这是选项卡 1** 
<!-- endtab -->
<!-- tab -->
**这是选项卡 2**
<!-- endtab -->
<!-- tab -->
**这是选项卡 3** 
<!-- endtab -->
{% endtabs %}
```
效果如下：
{% tabs 选项卡, 2 %}
<!-- tab -->
**这是选项卡 1** 
<!-- endtab -->
<!-- tab -->
**这是选项卡 2**
<!-- endtab -->
<!-- tab -->
**这是选项卡 3** 
<!-- endtab -->
{% endtabs %}

首先可以在主题配置文件中有配置，需要配置下，贴上我的：
```
# Tabs tag.
tabs:
  enable: true
  transition:
    tabs: true
    labels: true
  border_radius: 0
  ```
  然后上面源码中, 2表示一开始在第二个选项卡，非必须，若数值为-1则隐藏选项卡内容。更多用法请查看[官方文档](https://theme-next.org/docs/tag-plugins/tabs)
- label标签
在主题配置文件中找到label tag，然后设置为true
代码：
```
{% label default@默认 %}
{% label primary@主要 %}
{% label success@成功 %}
{% label info@信息 %}
{% label warning@警告 %}
{% label danger@危险 %}
```
效果如下：
{% label default@默认 %}
{% label primary@主要 %}
{% label success@成功 %}
{% label info@信息 %}
{% label warning@警告 %} 
{% label danger@危险 %}


# 3.添加文章评论功能
博客评论功能采用的韩国的Livere(来必力)
1. 准备
    - 去Livere官网免费注册账号，选择city版安装
    - 进入管理页面 -> 代码管理 -> 一般网站，复制data-uid（用于粘贴到主题配置文件里）
    - 进入管理页面 -> 设置 -> 将个人博客的域名复制到网站的URL里
    [Livere官网](https://livere.com/)
2. 主题配置文件
```
# Support for LiveRe comments system.评论管理
# You can get your uid from https://livere.com/insight/myCode (General web site)
livere_uid: data-id(来自Livere的data-id)
```
**注意：**如果设置了其他的评论管理，请注释掉保留一个就行。

# 4.文章元数据
1. 每一篇文章标题下的写作时间、更新时间等信息。在主题配置文件里设置。
```
# Post meta display settings
post_meta:
  item_text: true
  created_at: true
  updated_at:
    enable: true
    another_day: true
  categories: true
```
2. 添加文章字数与阅读时长统计
{% tabs 步骤 %}
<!-- tab -->
安装插件：hexo-symbols-count-time
```
npm install hexo-symbols-count-time --save
```
<!-- endtab -->
<!-- tab -->
主题站点配置文件中添加：
```
symbols_count_time:
  symbols: true
  time: true
  total_symbols: true
  total_time: true
  exclude_codeblock: false
 ```
<!-- endtab -->
{% endtabs %}

3. 添加阅读量统计
    busuanzi统计功能, 打开主题配置文件，找到代码所在位置进行修改
```
# Show Views / Visitors of the website / page with busuanzi.
# Get more information on http://ibruce.info/2015/04/04/busuanzi
busuanzi_count:
  enable: true
  total_visitors: true #网站总访客数量
  total_visitors_icon: user
  total_views: true #网站的文章总阅读数
  total_views_icon: eye
  post_views: true #单篇文章的阅读数
  post_views_icon: eye
```
  其他参考:https://www.jianshu.com/p/f2ec7eea543d

# 5.添加右上角forke-me-on-github
打开代码所在位置进行修改
```
# `Follow me on GitHub` banner in the top-right corner.
github_banner:
  enable: true
  permalink: https://github.com/xinyunduan
  title: Follow me on GitHub
```

# 6.添加代码块复制功能

在对文章插入的代码块，如果有一个一键复制的功能会使操作更加友好。
找到代码所在位置进行修改
```
codeblock:
  # Code Highlight theme
  # Available values: normal | night | night eighties | night blue | night bright | solarized | solarized dark | galactic
  # See: https://github.com/chriskempson/tomorrow-theme
  highlight_theme: normal
  # Add copy button on codeblock
  copy_button:
    enable: true #代码复制
    # Show text copy result.
    show_result: true #代码复制成功标识
    # Available values: default | flat | mac
    style:
```

# 7.修改文章内链接文本样式
修改/themes/next/source/css/_common/components/post/post.styl，在末尾添加CSS样式：
```
// 文章内链接文本样式
.post-body p a{
  color: #0593d3; //原始链接颜色
  border-bottom: none;
  border-bottom: 1px solid #0593d3; //底部分割线颜色
  &:hover {
    color: #fc6423; //鼠标经过颜色
    border-bottom: none;
    border-bottom: 1px solid #fc6423; //底部分割线颜色
  }
}
```
# 8.文章开启阅读更多按钮
如果不开启阅读更多按钮的话，默认是展示文章中所有内容的，这显然体验不好。
一般都会在文章中插入 <!--more--> 这种注释形式表示首页展示到注释处为止。或者会使用如下官方配置文件中自带的方式。一般都推荐使用注释的方式，因为下面这种 auto_excerpt 方式不会保留前面的行文样式，但是注释方式会保留样式。在主题配置文件中搜索 auto_excerpt，找到如下：
```
auto_excerpt:
  enable: true
  length: 150 #到多少字数后不显示
```

# 9.修改标签图标
修改文章底部的标签的图标，打开主题配置文件，找到tag_icon设为true
```
# Use icon instead of the symbol # to indicate the tag at the bottom of the post
tag_icon: true
```

# 10.修改网站底部样式
添加时间起始日期，以及修改icon样式和颜色
```
footer:
  # Specify the date when the site was setup. If not defined, current year will be used.
  since: 2015

  # Icon between year and copyright info.
  icon:
    # Icon name in Font Awesome. See: https://fontawesome.com/v4.7.0/icons/
    # `heart` is recommended with animation in red (#ff0000).
    name: heart
    # If you want to animate the icon, set it to true.
    animated: false
    # Change the color of icon, using Hex Code.
    color: "#ff0033" #红色
 ```
# 11.在文章末尾添加“文章结束”标记
   - 在根本目下~/source/文件夹下创建新的文件夹_data
   新建文件passage-end-tag.swig，添加如下内容：
   ```
   <!-- 文件结束语-->
   <div>
    {% if not is_index %}
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束&nbsp;&nbsp<i class="fa fa-heart"></i>&nbsp;&nbsp感谢您的阅读-------------</div>
    {% endif %}
   </div>
  ```
  - 打开主题配置文件，在末尾添加如下代码：
  ```
  # 文章末尾添加“本文结束”标记
  passage_end_tag:
    enabled: true
  ```
   
# 12.使用 hexo-neat 插件压缩页面资源
  1.像安装其它插件一样，在站点的根目录 npm 安装插件：
  ```
  cnpm install hexo-neat --save
  ```
  2.添加相关配置到站点配置文件：
  ```
  # 文件压缩，设置一些需要跳过的文件 
  # hexo-neat
   neat_enable: true
  # 压缩 html
   neat_html:
   enable: true
  # 一些百度、Google 的验证文件需要排除掉
   exclude:
      - '**/baidu*.html'
      - '**/google*.html'
  # 压缩 css
   neat_css:
      enable: true
      exclude:
        - '**/*.min.css'
  # 压缩 js
   neat_js:
      enable: true
      mangle: true
      output:
      compress:
      exclude:
        - '**/*.min.js'
        - '**/jquery.fancybox.pack.js'
        - '**/index.js'
  ```
  3.再执行 hexo g 命令生成 public 目录文件时，会发现控制台有输出压缩日志

# 13.添加版权信息
打开主题配置文件，找到creative_commons的位置将post设置为true。
此处的版权声明可以选择在侧栏和文章的末尾两处显示。在侧栏显示版权声明我觉得有些突兀，所以我选择在文章末尾显示。
```
# Creative Commons 4.0 International License.
# See: https://creativecommons.org/share-your-work/licensing-types-examples
# Available values of license: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
# You can set a language value if you prefer a translated version of CC license, e.g. deed.zh
# CC licenses are available in 39 languages, you can find the specific and correct abbreviation you need on https://creativecommons.org
creative_commons:
  license: by-nc-sa
  sidebar: false
  post: true
  language:
```
# 14.返回顶部
你可以设定返回顶部按钮的位置和是否显示当前浏览位置的百分比。返回顶部按钮默认显示在页脚，如果你使用的是 Pisces 或者 Gemini 主题，设定 sidebar: true，则可显示在侧栏的底部。打开主题配置文件，找到back2top的位置按需设置：
```
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: false
  # Scroll percent label in b2t button.
  scrollpercent: true
```
# 15.设置阅读进度条
在页面顶部或底部边缘位置显示一个阅读进程的进度条，你可以自定义进度条的颜色和粗细。打开主题配置文件找到Reading progress bar位置进行设置。
```
# Reading progress bar
reading_progress:
  enable: true
  # Available values: top | bottom
  position: top
  color: "#37c6c0"
  height: 3px
```
# 16.添加书签
在页面右上角添加一个书签图标，可以记录你阅读每一篇文章的位置，在你下次浏览该页面的时候，直接跳转到上一次浏览到的位置
```
# Bookmark Support
bookmark:
  enable: true
  # Customize the color of the bookmark.
  color: "#222"
  # If auto, save the reading progress when closing the page or clicking the bookmark-icon.
  # If manual, only save it by clicking the bookmark-icon.
  save: auto
```
# 17.首页文章摘要
next主题默认全部展开的，阅读体验很不好，最佳的阅读体验应该是，在首页只能看到这篇文章的摘要，只有点击该篇文章才可阅读全文。这一部分的配置就是实现该功能的。相关设置在主题配置文件中。
```
# Automatically scroll page to section which is under <!-- more --> mark.
scroll_to_more: true

# Automatically excerpt description in homepage as preamble text.
excerpt_description: true
```

# 18.添加相关文章
在文章的末尾添加相关（推荐）文章
  - 安装插件
    ```
    npm install hexo-related-popular-posts –save
    ```

  - 添加脚本
    在/themes/next/layout/_macro/post.swig文件里添加代码：
    ```
    {{ popular_posts( {} , post ) }} 
    ```

**bug：** 无法设置标题且取消在首页显示相关阅读

# 19.添加数学公式的支持
持 MathJax 和 KaTeX 两种加载数学公式的方法，使用语法都是 LaTeX 语法。不过 MathJax 的功能比较全面，KaTeX 的加载速度比较快。z这里选择了MathJax, 默认的 per_page: true 的意思是，只有当你在文章设定中添加 mathjax: ture，才会在当前页面中加载公式渲染，所以如果要显示公式一定要在文章的开头添加。
安装插件
```
cnpm uninstall hexo-renderer-marked --save
cnpm install hexo-renderer-kramed --save
```
在主题配置文件中设置：
```
# Math Formulas Render Support
math:
  # Default (true) will load mathjax / katex script on demand.
  # That is it only render those page which has `mathjax: true` in Front-matter.
  # If you set it to false, it will load mathjax / katex srcipt EVERY PAGE.
  per_page: true

  # hexo-renderer-pandoc (or hexo-renderer-kramed) required for full MathJax support.
  mathjax:
    enable: true
    # See: https://mhchem.github.io/MathJax-mhchem/
    mhchem: true
```

# 20.添加背景图片
  - 在根目录路径~/source/_data创建/修改 styles.styl文件，并添加以下内容:
  ```
  // 添加背景图片
  body {
        background: url(/images/bg.jpg);//自己喜欢的图片地址
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: 50% 50%;
  }


  // 标题栏背景
  .site-meta {
      padding: 20px 0;
      color: #fff;
      //background: $blue;
      background-repeat: no-repeat;
      background-attachment:fixed;
      background-position:center;
      background-size:cover;
  }  

  // 修改主体透明度
  .main-inner{
      background: #fff;
      opacity: 0.95;
  }

  ```
# 21.添加背景音乐
- 生成网易云音乐外链
  使用网络版网易云音乐，在播放界面点击生成外链，复制相关代码:
  ```
  <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=357384&auto=1&height=66"></iframe>
  ```
- 添加代码到sidebar.swig
  打开themes/next/layout/_macro/sidebar.swig 文件添加如下代码：
  ```
   {% if theme.background_music %}
      <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="{{ theme.background_music }}"></iframe>
   {% endif %}
  ```
  位置放在</aside>上面，你也可以选择其他位置。
- 在主题配置文件添加代码：
  ```
  # 添加背景音乐
  background_music: //music.163.com/outchain/player?type=2&id=357384&auto=1&height=66
  ```
# 22.文末添加今日诗词
[调用文档](https://www.jinrishici.com/doc/#json-fast-custom)
```
<!-- 文件位置：~/source/_data/body-end.swig -->

<script src="//sdk.jinrishici.com/v2/browser/jinrishici.js"></script>
<script>
  console.log('今日诗词 - 开始加载...');
  jinrishici.load((result) => {
    let jrsc = document.getElementById('jrsc');
    if (jrsc) {
      console.log('今日诗词 - 标签获取成功.');
    } else {
      console.log('今日诗词 - 标签获取失败!');
      return;
    }
    const data = result.data;
    let author = data.origin.author;
    let title = '《' + data.origin.title + '》';
    let content = data.content.substr(0, data.content.length - 1);
    let dynasty = data.origin.dynasty.substr(0, data.origin.dynasty.length - 1);
    jrsc.innerText = content + ' @ ' + dynasty + '·' + author + title;
    console.log('今日诗词 - 载入完毕.');
  });
</script>

```

# 23.取消归档页面的cheers语句
归档页面的顶部会有一句鼓励的话，类似「嗯..! 目前共计 3 篇日志。 继续努力。」，我不太喜欢这句话，觉得有些多余。如果你想要去掉，找到themes/next/layout/archive.swig文件，改写源代码（也可以直接删除）

```
 {%- if theme.cheers.enable %}
  <div class="collection-title">
    {%- set posts_length = site.posts.length %}
    {%- if posts_length > 210 %}
      {%- set cheers = 'excellent' %}
    {% elif posts_length > 130 %}
      {%- set cheers = 'great' %}
    {% elif posts_length > 80 %}
      {%- set cheers = 'good' %}
    {% elif posts_length > 50 %}
      {%- set cheers = 'nice' %}
    {% elif posts_length > 30 %}
      {%- set cheers = 'ok' %}
    {% else %}
      {%- set cheers = 'um' %}
    {%- endif %}
    <span class="collection-header">{{ __('cheers.' + cheers) }}! {{ _p('counter.archive_posts', site.posts.length) }} {{ __('keep_on') }}</span>
  </div>
   {%- endif %}

```

- 打开主题配置文件添加代码：
```
# Enable "cheers" for archive page.
cheers: false
```

# 24.添加文章推荐
- 安装相关插件
```
npm install hexo-related-popular-posts --save
```
- 设置主题配置文件，找到related_posts
```
related_posts:
  enable: true  # 是否开启
  title: 相关文章推荐    # 标题
  display_in_home: false # 是否在首页显示，建议为false
  params:
    maxCount: 5   # 相关文章的最大数量
    #PPMixingRate: 0.0
    #isDate: false
    #isImage: false
    #isExcerpt: false
```

# 25.修改加载特效
由于网页不可能一直都秒进，总会等待一段时间的，所以可以修改一下加载的特效。Next 已经集成了很多加载特效，可以在下面选项中在线调试测试一下。
搜索 pace，找到如下代码：
```
pace:
  enable: true
  # Themes list:
  # big-counter | bounce | barber-shop | center-atom | center-circle | center-radar | center-simple
  # corner-indicator | fill-left | flat-top | flash | loading-bar | mac-osx | material | minimal
  theme: minimal
```

# 25.添加近期文章板块
- 在 next/layout/_partials/sidebar/site-overview.swig 中的 if theme.links 对应的 endif 后面添加以下代码：
```
<!--近期文章版块 began-->
 {% if theme.recent_posts %}
    <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.recent_posts_layout  }}">
       <div class="links-of-blogroll-title">
          <i class="fa fa-history fa-{{ theme.recent_posts_icon | lower }}" aria-hidden="true"></i>
          {{ theme.recent_posts_title }}
       </div>
        <ul class="links-of-blogroll-list">
          {% set posts = site.posts.sort('-date') %}
          {% for post in posts.slice('0', '5') %}
            <li class='my-links-of-blogroll-li'>
              <a href="{{ url_for(post.path) }}" title="{{ post.title }}" target="">{{ post.title }}</a>
            </li>
          {% endfor %}
        </ul>
    </div>
  {% endif %}
  ```
- 为了配置方便，在主题的 _config.yml 中添加了几个变量，如下：
```
recent_posts_title: 近期文章
recent_posts_layout: block
recent_posts: true
```
# 26.去掉详情页url后面的"#more"
打开/themes/next/layout/_macro/post.swig，找到如下代码:
```
 {%- if theme.read_more_btn %}
   <div class="post-button">
      <a class="btn" href="{{ url_for(post.path) }}#more" rel="contents">
        {{ __('post.read_more') }} &raquo;
      </a>
    </div>
 {%- endif %}
```
将#more删掉。

# 27.修改永久链接的默认格式
如果你的文章名称是中文的，那么 Hexo 默认生成的永久链接也会有中文，这样不利于 SEO，且 gitment 评论对中文链接也不支持。
在Hexo根目录下的 _config.yml 文件采用初始设置。这里因为用“年月日”会让文章链接的层次太深，所以我用"article"代替：
```
# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
url: https://xinyunduan.github.io/
root: /archives/
#permalink: :year/:month/:day/:title/
permalink: article/:abbrlink.html
abbrlink:
  alg: crc32  # 算法：crc16(default) and crc32
  #rep: hex    # 进制：dec(default) and hex
permalink_defaults:
pretty_urls:
  trailing_index: true # Set to false to remove trailing 'index.html' from permalinks
  trailing_html: true # Set to false to remove trailing '.html' from permalinks
```
在Hexo的根目录下安装插件：
```
npm install hexo-abbrlink --save
```
打开网站就可以看到效果：http://localhost:4000/article/ab9e1965.html

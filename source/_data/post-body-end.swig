{% if theme.recommended_posts.enabled and not is_index %}
<div class="post-body">
  <div class="note primary">
    <div class="recommended_posts">
      {% set recommended_posts = recommended_posts(post, site) %}
      {% if recommended_posts.length > 0 %}
        <h4>{{ __('post.recommended_posts') }}</h4>
        <ul>
          {% for link in recommended_posts  %}
            <li><a href="{{ link.permalink }}">{{ link.title }}</a></li>
          {% endfor %}
        </ul>
      {% endif %} 
    </div> 
  </div>
</div>
{% endif %}

<!-- 文件结束语-->
 <div>
    {% if not is_index %}
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束啦&nbsp;&nbsp<i class="fa fa-heart"></i>&nbsp;&nbsp感谢您的阅读-------------</div>
    {% endif %}
 </div>

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
    jrsc.innerText = content + ' @ ' + dynasty + '☛' + author + title;
    console.log('今日诗词 - 载入完毕.');
    /*
    if (data.origin.author == '李白') {
      let audio = document.createElement("audio");
      audio.src = "/ding.mp3";
      audio.play();
    } */
  }); 

</script>
<div style="text-align: center"><span id="jrsc" >正在加载今日诗词....</span></div>
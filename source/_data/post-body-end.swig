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
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束&nbsp;&nbsp<i class="fa fa-heart"></i>&nbsp;&nbsp感谢您的阅读-------------</div>
    {% endif %}
 </div>
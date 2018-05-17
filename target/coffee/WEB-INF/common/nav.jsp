<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top" id="navHeader">
  <div class="container" id="navContainer">
	<div class="navbar-header" style="margin-right: 40px">
      <a class="navbar-brand" href="#">Coffee</a>
    </div>
    <div class="collapse navbar-collapse">
    	<ul class="nav navbar-nav menu__list">
    		<li style="margin-right: 14px;" class="menu__item menu__item--current"><a class="menu__link" href="<%=request.getContextPath()%>/welcome.htm">首页</a></li>
    		<li style="margin-right: 14px;" class="menu__item"><a href="<%=request.getContextPath()%>/famousPainting.htm">图片</a></li>
    		<li style="margin-right: 14px;" class="menu__item"><a href="#">煎蛋图</a></li>
    		<li style="margin-right: 14px;" class="menu__item"><a href="#">我的文章</a></li>
    		<li style="margin-right: 14px;" class="menu__item"><a href="#">电影列表</a></li>
    	</ul>

    	<ul class="nav navbar-nav navbar-right">
    		 <li><a href="#">登录</a></li>
    		 <li><a href="#">注册</a></li>
    	</ul>
    </div>
  </div>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<%@include file="../common/head.jsp"%> 
	 	<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/image_waterFall.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/global.css">	
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/viewer.css">			
		<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/viewer.min.js"></script>
		<!--这个插件是瀑布流主插件函数必须-->
		<script type="text/javascript" src="<%=path %>/js/jquery.masonry.min.js"></script>
		<!--这个插件只是为了扩展jquery的animate shadow效果-->
		<script type="text/javascript" src="<%=path %>/js/jquery.animate-shadow-min.js"></script>
		<!--这个插件只是为了扩展jquery的animate函数动态效果可有可无-->
		<script type="text/javascript" src="<%=path %>/js/jQeasing.js"></script>
		
		<style type="text/css">
			body {
				height: 100%;
			}
		</style>
		<script type="text/javascript">	
			/*
			抛开瀑布流布局各种乱七八糟的算法，基于masonry的瀑布流，很是简单的，而且通过扩展animate,能实现瀑布流布局的晃动、弹球等效果。
			masonry还有很多参数我这里注解了常用的参数
			*/
			$(document).ready(function(){
				/*瀑布流开始*/
				var container = $('.waterfull ul');
				var loading=$('#imloading');
				
				// 初始化loading状态
				loading.data("on",true);
				
				//初始化请求的数量，与开始的位置
				var startIndex = 12;
				var size = 12;	
				var isFinish = false; //是否有多余的数据 
				
				/*判断瀑布流最大布局宽度，最大为1280*/
				function tores(){
					var tmpWid=$(window).width();
					if(tmpWid>1600){
						tmpWid=1600;
					}else{
						var column=Math.floor(tmpWid/320);
						tmpWid=column*320;
					}
					$('.waterfull').width(tmpWid);
				}
				
				tores();
				$(window).resize(function(){
					tores();
				});
				
				
				container.imagesLoaded(function(){
					container.masonry({
					  	columnWidth: 320,
					    itemSelector : '.item',
					    isFitWidth: true,//是否根据浏览器窗口大小自动适应默认false
					    isAnimated: true,//是否采用jquery动画进行重拍版
					    isRTL:false,//设置布局的排列方式，即：定位砖块时，是从左向右排列还是从右向左排列。默认值为false，即从左向右
					    isResizable: true,//是否自动布局默认true
					    animationOptions: {
							duration: 800,
							easing: 'easeInOutElastic',//如果你引用了jQeasing这里就可以添加对应的动态动画效果，如果没引用删除这行，默认是匀速变化
							queue: false,//是否队列，从一点填充瀑布流		
							complete:function (){
								$('#dowebok').viewer("destroy"); 
								$('#dowebok').viewer(); 
								
								/*item hover效果*/
				  				$('#waterfull').on('mouseover','.item',function(){
									$(this).stop(true).animate({
										boxShadow: '10px 10px 15px rgba(0,0,0,.3)'
									});
								}); 
				 				$('#waterfull').on('mouseout','.item',function(){
									$(this).stop(true).animate({
										boxShadow: '0 0 10px #BCBCBC'
									});
								}); 
				            }
						}
					});
				});											
	
				$('#dowebok').viewer();
				
				/*本应该通过ajax从后台请求过来类似list的数据然后，便利，进行填充*/
				$(window).scroll(function(){
					if(isFinish) {
						return;
					}
					if(!loading.data("on")) {
						return;
					}
					// 计算所有瀑布流块中距离顶部最大，进而在滚动条滚动时，来进行ajax请求，方法很多这里只列举最简单一种，最易理解一种
					var itemNum=$('#waterfull').find('.item').length;
					var itemArr=[];
					itemArr[0]=$('#waterfull').find('.item').eq(itemNum-1).offset().top+$('#waterfull').find('.item').eq(itemNum-1)[0].offsetHeight;
					itemArr[1]=$('#waterfull').find('.item').eq(itemNum-2).offset().top+$('#waterfull').find('.item').eq(itemNum-1)[0].offsetHeight;
					itemArr[2]=$('#waterfull').find('.item').eq(itemNum-3).offset().top+$('#waterfull').find('.item').eq(itemNum-1)[0].offsetHeight;
					var maxTop=Math.max.apply(null,itemArr);
					if(maxTop<$(window).height()+$(document).scrollTop()){		
						//加载更多数据
						loading.data("on", false).fadeIn(800);		
						//ajax获取后台数据
						$.ajax({
							url: "<%=path %>/famousPainting/getFamousPaintingList.htm",
							type: "get",
							dataType: "json",
							data: {
								startIndex: startIndex,
								size: size
							},
							success: function(list) {
								if(list.length == 0) {
									loading.text('就有这么多了！');
									isFinish = true;
									return;
								}
								
								$('#waterfull').unbind('mouseover');
								$('#waterfull').unbind('mouseout');
								
								var html="";
								for(var i in list){
									html+="<li class='item'><a href='#' class='a-img'><img src='"+list[i].url+"' class='viewer-toggle' alt='"+ list[i].name +"'></a>";
									
									var name = list[i].name;
									var introduction = list[i].introduction;
									
									if(name !=null && name != "" && name != undefined) {
										html+="<h2 class='li-title'>"+name+"</h2>";
									}
									
									if(introduction !=null && introduction != "" && introduction != undefined) {
										html+="<p class='description'>"+introduction+"</p><div class='qianm clearfloat'>";
									} else {
										html+="<div class='qianm clearfloat'>";
									}
									
									html+="<span class='sp1'><b>"+list[i].looked+"</b>浏览</span>";
									html+="<span class='sp2'>"+list[i].author+"</span><span class='sp3'>"+list[i].paintTime+"&nbsp;By</span></div></li>";		
								}
		
								$(html).find('img').each(function(index){
									loadImage($(this).attr('src'));
								})
								
								var $newElems = $(html).css({ opacity: 0}).appendTo(container);
								$newElems.imagesLoaded(function(){
									$newElems.animate({ opacity: 1},800);
									container.masonry('appended', $newElems,true);
									loading.data("on",true).fadeOut();
								});

								startIndex = startIndex + list.length;
							},
							error: function() {
								loading.text("( ′◔ ‸◔`)加载图片失败！");
							},
							complete: function() {							
							}
						});
					}
				});
				
				//实现图片的预下载		
				function loadImage(url) {
				     var img = new Image(); 
				      img.src = url;
				      if (img.complete) {
				         return img.src;
				      }
				      img.onload = function () {
				       	return img.src;
				      };
				}
				
				 
				/*item hover效果*/
  				$('#waterfull').on('mouseover','.item',function(){
					$(this).stop(true).animate({
						boxShadow: '10px 10px 15px rgba(0,0,0,.3)'
					});
				}); 
 				$('#waterfull').on('mouseout','.item',function(){
					$(this).stop(true).animate({
						boxShadow: '0 0 10px #BCBCBC'
					});
				}); 
			});
		</script>
	</head>
	<body>
		<%@include file="../common/nav.jsp" %>
		<div class="content"  style="margin-top: 55px;">
			<!-- 瀑布流样式开始 -->
			<div class="waterfull clearfloat" id="waterfull">
				<ul id="dowebok">
					<c:forEach var="famousPainting" items="${list }">
						<li class="item">
							<a href="#" class="a-img">
								<img src="${famousPainting.url}" alt="${famousPainting.name}">		
							</a>
							<c:if test="${famousPainting.name != null && famousPainting.name != ''}">
								<h2 class="li-title" title="${famousPainting.name}"><c:out value="${famousPainting.name}"/></h2>
							</c:if>
							<c:if test="${famousPainting.introduction != null && famousPainting.introduction != ''}">
								<p class="description"><c:out value="${famousPainting.introduction}"/></p>
							</c:if>
							<div class="qianm clearfloat">
								<span class="sp1"><b><c:out value="${famousPainting.looked }"/></b>浏览</span>
								<span class="sp2"><c:out value="${famousPainting.author }"/></span>
								<span class="sp3"><c:out value="${date.paintTime }"/>&nbsp;By</span>
							</div>
						</li>
					</c:forEach>				
				</ul>
			</div>
			<!-- loading按钮自己通过样式调整 -->
			<div id="imloading" style="width:200px;height:30px;line-height:30px;font-size:16px;text-align:center;border-radius:3px;opacity:0.7;background:#000;margin:10px auto 30px;color:#fff;display:none">
				I'm Loading.....
			</div>
		</div>
	</body>
</html>
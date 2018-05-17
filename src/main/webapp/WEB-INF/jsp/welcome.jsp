<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<%@include file="../common/head.jsp"%> 
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/global.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/tiger.css">

		<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
		<style type="text/css">
		.container .row p {
			margin-top: 30px;
		}

		</style>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<%@include file="../common/nav.jsp" %>
		<div style="background-color: gray; margin-top: 51px;">
			<div class="jumbotron" id="welcome_jumbotron">
				<div class="container">
				</div>
			</div>
		</div>

		<div class="container" style="margin-bottom: 80px;text-align: center;font-size: 14px;">
			<div style="width:320px; height: 320px; position: absolute; top: 1015px; left: 50px;">
				<%@include file="../common/tiger.jsp"%>
			</div>
		
			<div class="row">
				<h1>贺新郎 ·辛弃疾</h1>
				<p style="margin-top:50px;">甚矣吾衰矣。怅平生、交游零落，只今馀几。</p>
				<p>白发空垂三千丈，一笑人间万事。问何物、能令公喜。</p>
				<p>我见青山多妩媚，料青山、见我应如是。</p>
				<p>情与貌，略相似。</p>
				<p>一尊搔首东窗里。想渊明、停云诗就，此时风味。</p>
				<p>江左沈酣求名者，岂识浊醪妙理。</p>
				<p>回首叫、云飞风起。</p>
				<p>不恨古人吾不见，恨古人、不见吾狂耳。</p>
				<p>知我者，二三子。</p>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<%@include file="../common/head.jsp"%> 
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/global.css">	
		<script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/summernote.css">		
		<script type="text/javascript" src="<%=path %>/js/summernote.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/lang/summernote-zh-CN.js"></script>	
		
		<style type="text/css">
			#chat_room_content {
				margin: auto;
				width:60%;
				margin-top: 55px;
			}
			
			textarea {
				width: 60%;
				resize: none;
			}
		</style>
		<script type="text/javascript">	
			$(document).ready(function(){
				$('#summernote').summernote({
					lang: 'zh-CN',
					height: 250,                 // set editor height
					minHeight: 250,             // set minimum height of editor
					maxHeight: 250,             // set maximum height of editor
					focus: true                  // set focus to editable area after initializing summe
				});				
			});
		</script>
	</head>
	<body>
		<%@include file="../common/nav.jsp" %>
	 
		<div id="chat_room_content">
			<textarea style="height:350px;">
			</textarea>
			
			<div id="summernote">
			</div>
<!-- 			<textarea style="height: 230px;">
			</textarea> -->
			
					
			<div>
				<button type="button" class="btn btn-primary">发送</button>
			</div>
		</div>
	</body>
</html>
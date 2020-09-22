<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
	<script type="text/javascript">
		$(function() {
			$('#boardList').on('click', function() {
				$(location).attr('href', '${path}/board/list');
			});
			
			$('#boardMap').on('click',function(){
				$(location).attr('href','${path}/board/map');
			})
		});
	</script> 
	
</head>
<body>
	<button id="boardList">게시판목록</button>
	<button id="boardMap">회사위치</button>
	<div>
		<!-- servlet-context.xml 에 이미지 경로 매핑 -->
		<img alt="메인이미지" src="${path}/resources/images/cat.jpg" width="100px">
		<img alt="메인이미지" src="${path}/img/cat.jpg" width="100px">
		<img alt="메인이미지" src="${path}/localimg/cat.jpg" width="100px">
		<!-- servet.xml에 이미지 경로 매핑 -->
		<img alt="메인이미지" src="/images/cat.jpg" width="100px">
	</div>
	
	
	
	
	
	
	
</body>
</html>
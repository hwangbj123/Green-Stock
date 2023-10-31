<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
<div class = "container">
<h1>공지사항 작성</h1>
</div>

<!-- 필요한 목록 이름, 아이디,제목, 내용, 비밀번호 글쓰기 버튼 취소 버튼 -->  
	<form action="notice/write" method = "post">																																																																																																																																																																																																																																																																																																																																																																																																																		
	<form name = "writeform">					
		<div class="btn-group mb-1">
			<button type="button" class="btn btn-outline-success">Info</button>
			<button type="button" class="btn btn-outline-success dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
				<span class="sr-only">Info</span>
			</button>												
		</div>
		</form>																								
	</form>
</body>
</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %> 
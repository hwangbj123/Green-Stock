<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty user}">
			로그아웃 상태
		</c:when>
		<c:otherwise>
			로그인 됨 : ${user}
		</c:otherwise>
	</c:choose>
	<form action="home" method="post">
		<input type="text" name="userId">
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='/out'">로그아웃</button>
	<c:choose>
		<c:when test="${empty user}">
			채팅방
		</c:when>
		<c:otherwise>
			<a href="chat">채팅방</a>
		</c:otherwise>
	</c:choose>
	</form>
</body>
</html>
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
			�α׾ƿ� ����
		</c:when>
		<c:otherwise>
			�α��� �� : ${user}
		</c:otherwise>
	</c:choose>
	<form action="home" method="post">
		<input type="text" name="userId">
		<button type="submit">�α���</button>
		<button type="button" onclick="location.href='/out'">�α׾ƿ�</button>
	<c:choose>
		<c:when test="${empty user}">
			ä�ù�
		</c:when>
		<c:otherwise>
			<a href="chat">ä�ù�</a>
		</c:otherwise>
	</c:choose>
	</form>
</body>
</html>
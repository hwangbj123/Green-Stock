<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�� ����</h1>
<form method="get" action="chatCreate">
	�� �ѹ� : <input type="text" name="roomNumber"><br>
	�� �̸� : <input type="text" name="roomName"><br>
	<input type="submit" value="����">
</form>
<br>
<h1>����Ʈ</h1>
<c:forEach var="list" items="${rooms}">
	id : ${list.roomId}<br>
	number : ${list.roomNumber}<br>
	name : ${list.roomName}<br>
<%-- 	<a href="chat?roomId=${list.roomId}&userId=dog">����</a><br> --%>
<%-- 	<button onclick="subscribe(${list.roomId},'123')">����</button> --%>
	<c:if test="${list.userId eq '123'}">
		<span style="background-color: yellow">���� ��</span>
	</c:if>
	<button onclick="subCheck(${list.roomId})">����</button>
	<br><br>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function subCheck(roomId){
		var roomId = roomId;
		var userId = '123';
		
		console.log("roomId : "+roomId);
		console.log("userId : "+userId);
		$.ajax({
			url: "subCheck",
			data: {
				roomId: roomId,
				userId: userId
			},
			success: function(res){
				console.log(res);
				if(res=='0'){
					if(confirm("�濡 ������ \n���� �����ؾ��մϴ�.\n�����Ͻðڽ��ϱ�?")){
// 						console.log("subscribe?roomId="+roomId+"&userId="+userId);
						location.href="subscribe?roomId="+roomId+"&userId="+userId;	
					}
				}else{
					if(confirm("���� ���Դϴ�. \nä�ù濡 �����Ͻðڽ��ϱ�?")){
						location.href="chat?roomId="+roomId+"&userId="+userId;	
					}
				}
			},error: function(e){
				console.log(e);
			}
		}); // end of ajax
	}
</script>
</body>
</html>
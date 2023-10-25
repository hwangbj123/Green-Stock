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
<h1>방 생성</h1>
<form method="get" action="chatCreate">
	방 넘버 : <input type="text" name="roomNumber"><br>
	방 이름 : <input type="text" name="roomName"><br>
	<input type="submit" value="생성">
</form>
<br>
<h1>리스트</h1>
<c:forEach var="list" items="${rooms}">
	id : ${list.roomId}<br>
	number : ${list.roomNumber}<br>
	name : ${list.roomName}<br>
<%-- 	<a href="chat?roomId=${list.roomId}&userId=dog">입장</a><br> --%>
<%-- 	<button onclick="subscribe(${list.roomId},'123')">구독</button> --%>
	<c:if test="${list.userId eq '123'}">
		<span style="background-color: yellow">구독 중</span>
	</c:if>
	<button onclick="subCheck(${list.roomId})">입장</button>
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
					if(confirm("방에 들어가려면 \n먼저 구독해야합니다.\n구독하시겠습니까?")){
// 						console.log("subscribe?roomId="+roomId+"&userId="+userId);
						location.href="subscribe?roomId="+roomId+"&userId="+userId;	
					}
				}else{
					if(confirm("구독 중입니다. \n채팅방에 입장하시겠습니까?")){
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
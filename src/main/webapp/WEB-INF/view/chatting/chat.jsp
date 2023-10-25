<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
</head>
<body>
    <h1>
    	Chat Room
    	<br>
    	<c:if test="${not empty roomId}">
    		roomId : ${roomId}
    	</c:if>
    	<c:if test="${not empty userId}">
    		userId : ${userId}
    	</c:if>
    	<input type="button" onclick="window.open('chat?roomId=${roomId}&userId=${userId}','_blank','width=400,height=400')" value="새 창">
   	</h1>
    <div id="chat-messages"></div>
    <form id="chat-form">
    	
        <input type="text" id="message" placeholder="Enter your message">
        <button type="submit">Send</button>
    </form>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
    function searchParam(key) {
   	  return new URLSearchParams(location.search).get(key);
   	};
    $(function(){
//     	----------------------------------- STOMP
    	var roomId = searchParam('roomId');
    	var userId = searchParam('userId');
    	console.log("roomId : "+roomId);
    	var stompClient = Stomp.over(new SockJS('/chat'));
        stompClient.connect({}, function (frame) {
            stompClient.subscribe('/topic/'+roomId, function (message) {
                var messageBody = JSON.parse(message.body);
                $('#chat-messages').append("<p><strong>" + messageBody.sender + ": </strong>" + messageBody.content + " " + messageBody.date + "</p>");
            });
        });

        $('#chat-form').on('submit', function (e) {
            e.preventDefault();
            var sender = userId; // 사용자 이름 또는 ID를 여기에 추가
            var message = $('#message').val();
//             var roomId = "roomId"; // 채팅 방 번호를 여기에 추가

            stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({
                sender: sender,
                content: message,
                date: new Date()
            }));
            $('#message').val('');
        });
//     	----------------------------------- 새 창
    });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
<style>
	#chat-messages{
		height: 450px;
		padding-top: 10px;
		overflow: auto;
		background-color: rgba(52,116,212,0.2);
  		border-top-right-radius: 15px;
  		border-top-left-radius: 15px;
	}
	#chat-messages::-webkit-scrollbar {
	    width: 10px;
  	}
  	#chat-messages::-webkit-scrollbar-thumb {
	    background-color: rgba(52,116,212,0.5);
	}
	#chat-messages::-webkit-scrollbar-track {
  		border-top-right-radius: 15px;
	    background-color: rgba(10,10,10,0.1);
	}
	.my-message-div{
		width: 100%;
		margin-bottom: 5px;
		display: flex;
		flex-direction: row-reverse;
	}
	.message-div{
		width: 100%;
		margin-bottom: 5px;
		display: flex;
	}
	.my-message-user{
		width:100%;
		text-align: right;
		padding-right: 5px;
		overflow: hidden;
	}
	.message-user{
		width:100%;
		text-align: left;
		padding-left: 5px;
		overflow: hidden;
	}
	.my-message-div .message-content{
		width: 60%;
		min-height: 45px;
		border-radius: 5px;
		margin: -2px 5px 5px 5px;
		padding: 5px;
		background-color: rgb(246,224,17);
		box-shadow: 0 1px 5px 1px rgba(0,0,0,0.2);
	}
	.message-div .message-content{
		width: 60%;
		min-height: 45px;
		border-radius: 5px;
		margin: -2px 5px 5px 5px;
		padding: 5px;
		background-color: white;
		box-shadow: 0 1px 5px 1px rgba(0,0,0,0.2);
	}
	.submit-div{
		width: 100%; 
		display: flex;
	}
</style>
</head>
<body>
    <h3>
    	Chat Room
    	<br>
    	<c:if test="${not empty roomId}">
<%--     		roomId : ${roomId} --%>
    		<input type="hidden" id="hd-roomId" value="${roomId}">
    	</c:if>
    	<c:if test="${not empty principal}">
<%--     		user : ${principal.id}, ${principal.userName} --%>
    		<input type="hidden" id="hd-userId" value="${principal.id}">
    		<input type="hidden" id="hd-userName" value="${principal.userName}">
    	</c:if>
   	</h3>
    <div id="chat-messages">
    	<c:forEach var="message" items="${list}">
  			<c:choose>
   				<c:when test="${message.userId eq principal.id}">
	    			<div class="my-message-user">
		    			${message.userName}
	    			</div>
		    		<div class="my-message-div">
		    			<div class="message-content" style="background-color: rgb(246,224,17);">
		    				${message.content}
		    			</div>
		    			<fmt:formatDate value="${message.date}" pattern="HH:mm"/>
		    		</div>
   				</c:when>
   				<c:otherwise>
	    			<div class="message-user">
		    			${message.userName}
	    			</div>
		    		<div class="message-div">
		    			<div class="message-content">
		    				${message.content}
		    			</div>
		    			<fmt:formatDate value="${message.date}" pattern="HH:mm"/>
		    		</div>
   				</c:otherwise>
   			</c:choose>
    	</c:forEach>
    </div>
    <form id="chat-form">
    	<div class="submit-div">
	        <input type="text" id="message" style="width: 100%; height: 45px;" placeholder="Enter your message">
	        <button class="btn btn-primary" type="submit">Send</button>
    	</div>
    </form>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
    function searchParam(key) {
   	  return new URLSearchParams(location.search).get(key);
   	};
   	function scrollToBottom(){
   		$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
   	}
    $(function(){
//     	----------------------------------- STOMP
		scrollToBottom();
    	var roomId = $("#hd-roomId").val();
    	var userId = $("#hd-userId").val();
    	var userName = $("#hd-userName").val();
    	console.log("roomId : "+roomId);
    	console.log("userId : "+userId);
    	console.log("userName : "+userName);
    	var stompClient = Stomp.over(new SockJS('/chat'));
        stompClient.connect({}, function (frame) {
            stompClient.subscribe('/topic/'+roomId, function (message) {
                var messageBody = JSON.parse(message.body);
//                 $('#chat-messages').append("<p><strong>" + messageBody.userId + ": </strong>" + messageBody.content + " " + messageBody.date + "</p>");
				var messageDate = new Date(messageBody.date);
                if (messageBody.userName==userName){
					$('#chat-messages').append(
							'<div class="my-message-user">'
			    				+messageBody.userName
			    			+'</div>'
							+'<div class="my-message-div">'
			    			+'<div class="message-content">'
			    				+messageBody.content
			    			+'</div>'
			    				+messageDate.getHours()+":"+messageDate.getMinutes()
			    			+'</div>'
							);
                } else{
					$('#chat-messages').append(
							'<div class="message-user">'
			    				+messageBody.userName
			    			+'</div>'
							+'<div class="message-div">'
			    			+'<div class="message-content">'
			    				+messageBody.content
			    			+'</div><p>'
			    				+messageDate.getHours()+":"+messageDate.getMinutes()
			    			+'</p></div>'
							);
                }
				scrollToBottom();
            });
        });

        $('#chat-form').on('submit', function (e) {
        	
        	if($('#message').val().replace(/\s/gi, '').length==0){
        		$('#message').val('');
        		return false;
        	}
        	if(/<|>/.test($('#message').val())){
        		$('#message').val('');
        		alert()
        		return false;
        	}
        	
            e.preventDefault();
//             var userId = userId; // 사용자 이름 또는 ID를 여기에 추가
            var message = $('#message').val();
//             var roomId = "roomId"; // 채팅 방 번호를 여기에 추가

            stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({
            	userId: userId,
            	userName: userName,
                roomId: roomId,
                content: message,
                date: new Date()
            }));
            $('#message').val(''); // 채팅 입력 창을 초기화
        });
//     	----------------------------------- 새 창
    });
    </script>
</body>
</html>
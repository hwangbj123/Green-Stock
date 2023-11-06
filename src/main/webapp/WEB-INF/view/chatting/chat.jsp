<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
	
	<!-- Custom css -->
    <link rel="stylesheet" href="/resources/css/custom/chat.css" />
</head>
<body>
	<div style="width: 100%;">
	    <h3>
	    	Chat Room
	    	<br>
	    	<c:if test="${not empty companyCode}">
	    		<input type="hidden" id="hd-companyCode" value="${companyCode}">
	    	</c:if>
	    	<c:if test="${not empty principal}">
	    		<input type="hidden" id="hd-userId" value="${principal.id}">
	    		<input type="hidden" id="hd-userName" value="${principal.userName}">
	    	</c:if>
	   	</h3>
   	</div>
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
		    			<form method="post" id="delete-form-${message.id}" action="/admin/chat-delete">
		    				<input type="hidden" name="id" value="${message.id}">
		    				<input type="hidden" name="code" value="${companyCode}">
		    				<c:if test="${principal.roletypeId eq 0}">
			    				<button type="button" class="delete-btn" onclick="chatInit.deleteMessage(${message.id})">X</button>
		    				</c:if>
		    			</form>
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
		    			<form method="post" id="delete-form-${message.id}" action="/admin/chat-delete">
		    				<input type="hidden" name="id" value="${message.id}">
		    				<input type="hidden" name="code" value="${companyCode}">
		    				<c:if test="${principal.roletypeId eq 0}">
			    				<button type="button" class="delete-btn" onclick="chatInit.deleteMessage(${message.id})">X</button>
		    				</c:if>
		    			</form>
		    		</div>
   				</c:otherwise>
   			</c:choose>
    	</c:forEach>
    </div>
    <form id="chat-form">
    	<div class="submit-div">
	        <input type="text" id="message" style="width: 100%; height: 45px;" placeholder="Enter your message">
	        <button type="button" class="send-btn" id="send-btn">Send</button>
    	</div>
    </form>
    <br>
   	<h3>구독자 목록</h3>
    <div class="user-list-div">
    	<c:forEach var="user" items="${userList}" varStatus="status">
    		${user.userName}<br>
    	</c:forEach>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/resources/js/custom/chat.js"></script>
</body>
</html>
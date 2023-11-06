<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="Ekka - Admin Dashboard HTML Template.">

		<title>Green Stock</title>
		
		<!-- GOOGLE FONTS -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

		<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
		
		<!-- Ekka CSS -->
		<link id="ekka-css" rel="stylesheet" href="/resources/css/ekka.css" />
		
		<!-- FAVICON -->
		<link href="/resources/img/favicon.png" rel="shortcut icon" />
		
		<style>
			.main-content-div {
				width: 100%;
				display: flex;
				justify-content: center;
				margin: 60px 0px;
			}
			.main-div{
				min-width: 300px;
				min-height: 800px;
				border: 1px solid black;
			}
			.content-center{
				width: 50%;			
			}
			.content-left, .content-right{
				width: 20%;
			}
			.chat-div{
				width: 80%;
				height: 400px;
				border-radius: 15px;
				margin: 20px auto;
				padding: 15px;
				text-align: center;
				box-shadow: 0 1px 5px 1px rgba(0,0,0,0.3);
			}
			
			.chat-list::-webkit-scrollbar {
			    width: 10px;
			}
			.chat-list::-webkit-scrollbar-thumb {
			    background-color: rgba(10,10,10,0.2);
			    border-radius: 15px;
			}
			.chat-list::-webkit-scrollbar-track {
/* 			    background-color: rgba(10,10,10,0.1); */
			}
			.chat-list{
				height: 300px;
 				overflow: auto;
				background-color: rgba(52,116,212,0.2); 
			}
			.chat-tb{
				width: 100%;
				margin: 1px 0px;
				border-collapse: collapse;
			}
			.chat-tr{
				border: 4px solid rgb(214, 227, 246);
				cursor: pointer; 
			}
			.chat-tr:hover td{
				background-color: rgb(246,224,17);
			}
			.chat-tb td{
				height: 50px;
				background-color: white;
				padding: 5px;
			}
			@media (max-width: 1300px) {
			    .main-content-div {
					width: 100%;
					display: block;
				}
				.main-div{
					width: 80%;
					margin: auto;
					min-width: 600px;
					min-height: 800px;
					border: 1px solid black;
				}
			}
			
			.board-div{
				width: 90%;
				height: 510px;
				border-radius: 15px;
				margin: 20px auto;
				padding: 20px;
				text-align: center;
				box-shadow: 0 1px 5px 1px rgba(0,0,0,0.3);
			}
			.centered-table td{
				max-width: 200px;
				white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis; 
			}
		</style>
	</head>
	
	<body class="sign-inup" id="body">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- start of Main ---------------------------------------------------------------------------------------------------------------------- -->
	<div class="main-content-div">
<!----- 좌측 사이드 div ------------>
		<div class="main-div content-left"></div>
<!----- 중앙 사이드 div ------------>
		<div class="main-div content-center">
		
<!--------- 게시판 리스트 ------------>
			<div class="board-div">
				<table class="table centered-table">
					<thead>
						<tr>
							<th style="max-width: 50px;">id</th>
							<th style="max-width: 50px;">cate</th>
							<th style="min-width: 150px;">title</th>
							<th>user</th>
							<th>date</th>
							<th style="max-width: 50px;">views</th>
							<th style="max-width: 50px;">rec</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="board" items="${boardList}">
							<c:choose>
								<c:when test="${board.recommand >= 2}">
									<tr style="background-color: #fee; font-weight: 500;">
								</c:when>
								<c:otherwise>
									<tr>
								</c:otherwise>
							</c:choose>
									<td>${board.id}</td>
									<td>${board.categoryId}</td>
									<td><a href="/board/detail?boardId=${board.id}">
										${board.title}</a>
									</td>
									<td>${board.userName}</td>
									<td><fmt:formatDate value="${board.date}"
											pattern="MM-dd HH:mm" /></td>
									<td>${board.views}</td>
									<td>${board.recommand}</td>
								</tr>
						</c:forEach>
						<tr>
							<td colspan="7" style="text-align: center;">
								<a href="/board/list">게시판 더 보기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
<!----- 우측 사이드 div ------------>
		<div class="main-div content-right">
			
<!--------- 채팅 리스트 ------------>
			<div class="chat-div">
				<h4>My Chatting</h4>
				<div class="chat-list">
					<table class="chat-tb">
						<c:if test="${not empty chatList}">
							<c:forEach var="chat" items="${chatList}">
								<tr class="chat-tr" onclick="window.open('/chat?companyCode=${chat.companyCode}&userId=${principal.id}', '_black', 'width= 480, height= 720, location=no')">
									<td style="width: 20%">${chat.companyCode}</td>
									<td style="width: 60%">${chat.companyName}</td>
									<td style="width: 20%">${chat.countUser} 명</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		
		</div>
	</div>
<!-- end of Main ------------------------------------------------------------------------------------------------------------------------ -->
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		<!-- Javascript -->
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
		
		<script>
			
		</script>
	</body>
</html>
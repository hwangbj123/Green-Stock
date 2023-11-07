<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="UTF-8">
		<title>전문가 상세</title>
		<link rel="icon" href="/resources/images/favicon/favicon.png" sizes="32x32" />
		<link rel="apple-touch-icon" href="/resources/images/favicon/favicon.png" />
		<meta name="msapplication-TileImage" content="/resources/images/favicon/favicon.png" />
		
		<!-- css Icon Font -->
		<link rel="stylesheet" href="/resources/css/vendor/ecicons.min.css" />
		
		<!-- css All Plugins Files -->
		<link rel="stylesheet" href="/resources/css/plugins/animate.css" />
		<link rel="stylesheet" href="/resources/css/plugins/swiper-bundle.min.css" />
		<link rel="stylesheet" href="/resources/css/plugins/jquery-ui.min.css" />
		<link rel="stylesheet" href="/resources/css/plugins/countdownTimer.css" />
		<link rel="stylesheet" href="/resources/css/plugins/slick.min.css" />
		<link rel="stylesheet" href="/resources/css/plugins/bootstrap.css" />
		
		<!-- Main Style -->
		<link rel="stylesheet" href="/resources/css/style.css" />
		<link rel="stylesheet" href="/resources/css/responsive.css" />
		
		<!-- Background css -->
		<link rel="stylesheet" id="bg-switcher-css" href="/resources/css/backgrounds/bg-4.css">
         <!-- Vendor JS -->
	    <script src="/resources/js/vendor/jquery-3.5.1.min.js"></script>
	    <script src="/resources/js/vendor/popper.min.js"></script>
	    <script src="/resources/js/vendor/bootstrap.min.js"></script>
	    <script src="/resources/js/vendor/jquery-migrate-3.3.0.min.js"></script>
	    <script src="/resources/js/vendor/modernizr-3.11.2.min.js"></script>
	
	    <!--Plugins JS-->
	    <script src="/resources/js/plugins/swiper-bundle.min.js"></script>
	    <script src="/resources/js/plugins/countdownTimer.min.js"></script>
	    <script src="/resources/js/plugins/scrollup.js"></script>
	    <script src="/resources/js/plugins/jquery.zoom.min.js"></script>
	    <script src="/resources/js/plugins/slick.min.js"></script>
	    <script src="/resources/js/plugins/infiniteslidev2.js"></script>
	    <script src="/resources/js/vendor/jquery.magnific-popup.min.js"></script>
	    <script src="/resources/js/plugins/jquery.sticky-sidebar.js"></script>
	
	    <!-- Main Js -->
	    <script src="/resources/js/vendor/index.js"></script>
	    <script src="/resources/js/main.js"></script>
	    <!-- kjh -->
	    <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
		
	    <style>
			* {
				font-family: 'Pretendard-Regular';
			}
			.advisorDetail{
				width: 60%;
			}
			.advisorDetail table th{
				width: 25%;
			}
			.advisorDetail textarea{
				height: 140px;
				resize: none;
				border: none;
				padding: 0;
			}
			.advisorDetail #advisorCareer{
				height: 80px;
			}
			.advisorDetail .btn{
				width: 120px;
				height: 50px;
				border-radius: 10px;
				font-size: 14px;
			}
				.advisorDetail .btn-info{
				width: 150px;
			}
	    </style>
	</head>
<body>
<%@ include file ="/WEB-INF/view/stock/header.jsp" %>
 <!-- CONTENT WRAPPER -->
<div class="container mt-4 mb-4 advisorDetail">
	<div class="row">
		<div class="col-6">
			<img src="/upload/${advisor.image}" alt="">
		</div>
		<div class="col-6">
			<div class="section-title text-center">
				<h3>전문가</h3>
			</div>
			<div class="table-responsive">
				<table class="table w-100">
					<tbody>
						<tr>
							<th>닉네임</th><td>${advisor.nickName}</td>
						</tr>
						<tr>
							<th>이름</th><td>${advisor.fullName}</td>
						</tr>
						<tr>
							<th>분야</th><td>${advisor.strSpecialization}</td>
						</tr>
						<tr>
							<th>이력</th>
							<td>
								<textarea name="career" id="advisorCareer" readonly>${advisor.career}</textarea>
							</td>
						</tr>
						<tr>
							<th>자기소개</th>
							<td>
								<textarea name="career" id="advisorIntroduction" readonly>${advisor.introduction}</textarea>
							</td>
						</tr>
						<tr class="text-center">
							<td colspan="2"><button class="btn btn-primary" id="btnAdvisorSub" data-id="${advisor.advisorId}">결제하기</button></td>
						</tr>
						<tr class="text-center">
							<td colspan="2"><button class="btn btn-info me-4" id="btnAdvisorBoard" data-id="${advisor.advisorId}">전문가 상담게시판</button>
								<button class="btn btn-info" id="btnAdvisorChat" data-id="${advisor.advisorId}">전문가 실시간채팅</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="subscribe">
				
			</div>
			<div>
				
			</div>
			
		</div>
	</div>
</div>
<%@ include file ="/WEB-INF/view/stock/footer.jsp" %>
<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="ecicon eci-arrow-up" aria-hidden="true"></i></a>
</body>
<script src="/js/advisor/detail.js"></script>
</html>
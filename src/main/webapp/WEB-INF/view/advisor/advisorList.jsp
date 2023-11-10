<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="UTF-8">
		<title>전문가 목록</title>
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
	    	.advisorList{
				
			}
			.advisorList .card{
				width: 300px;
				height: 400px;
				margin-bottom: 20px;
				padding: 10px;
				box-sizing: border-box;
			}
			.advisorList .pro-hidden-block{
				visibility: hidden;
			}
			.advisorList img{
				width: 280px;
				height: 280px;
				object-fit: cover;
			}
			@font-face {
			  font-family: "Dovemayo";
			  src: url("/resources/fonts/Dovemayo_gothic.ttf") format("truetype");
			  font-weight: normal;
			}
			   *:not(i), h5, h6, li{
			  font-family: 'Dovemayo', sans-serif !important;
			  font-weight: normal;
			}
		  </style>
	</head>
<body>
<%@ include file ="/WEB-INF/view/stock/header.jsp" %>
 <!-- CONTENT WRAPPER -->
 <div class="container mt-4 mb-4 advisorList">
	<div class="row">
		<div class="col-md-12 section-title-block">
			<div class="section-title text-center">
				<h2 class="ec-title">전문가 목록</h2>
				<h6 class="ec-sub-title">전문가와 상담하고 실시간 채팅을 할 수 있습니다.</h6>

			</div>
		</div>
	</div>
	<div class="row m-tb-minus-15">
		<div class="col">
			<div class="tab-content">
				<div class="row">
					<c:forEach var="advisor" items="${advisorResDtos}">
						<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 ec-product-content">
							<div class="card">
								<div class="mb-2">
									<a href="/advisor/${advisor.nickName}">
										<img src="/upload/${advisor.image}" alt="">
									</a>
								</div>
								<div class="ec-pro-content text-center">
									<h5 class="ec-pro-title"><a href="/advisor/${advisor.nickName}">${advisor.nickName}</a></h5>
									<h6 class="ec-pro-stitle"><a href="/advisor/domestic/">${advisor.strSpecialization}</a></h6>
									<div class="ec-pro-rat-price">
										<div class="ec-pro-rat-pri-inner">
											<span class="ec-price">
												<span class="new-price">&#8361; ${advisor.formatSubscriptionCost}</span>
											</span>
											<!-- <span class="ec-pro-rating">
												<i class="ecicon eci-star fill"></i>
												<i class="ecicon eci-star fill"></i>
												<i class="ecicon eci-star fill"></i>
												<i class="ecicon eci-star-o"></i>
												<i class="ecicon eci-star-o"></i>
											</span> -->
										</div>
									</div>
									<div class="pro-hidden-block">
										<div class="ec-pro-desc">Lorem Ipsum is simply dummy text of the printing.</div>
										<div class="ec-pro-actions">
											<a class="ec-btn-group wishlist" title="Wishlist"><i class="fi-rr-heart"></i></a>
											<button title="Add To Cart" class="add-to-cart btn btn-primary">Add To
												Cart</button>
											<a href="#" class="ec-btn-group quickview" data-link-action="quickview" title="Quick view" data-bs-toggle="modal" data-bs-target="#ec_quickview_modal"><i class="fi-rr-eye"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file ="/WEB-INF/view/stock/footer.jsp" %>
<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="ecicon eci-arrow-up" aria-hidden="true"></i></a>
</body>
</html>
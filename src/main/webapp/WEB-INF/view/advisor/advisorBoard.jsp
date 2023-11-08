<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
		<link rel="stylesheet" href="/css/stock/searchList.css">
	</head>
<body>
<%@ include file ="/WEB-INF/view/stock/header.jsp" %>
 <!-- CONTENT WRAPPER -->
<div class="ec-content-wrapper container mb-5 stockSearchList">
	<div class="content">
		<div class="breadcrumb-wrapper">
			<div>
				<h4>전문가명 상담게시판</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card card-default">
					<div class="card-body">
						<div class="table-responsive">
							<table id="responsive-data-table" class="table searchList" style="width:100%">
								<thead>
									<tr>
										<th style="width: 10%;">번호</th>
										<th style="width: 40%;">제목</th>
										<th style="width: 20%;">아이디</th>
										<th style="width: 20%;">작성일자</th>
										<td style="width: 10%;">상태</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><a href="/advisor/nickname">제목입니다.제목입니다.</a></td>
										<td>아이디아이디아이디</td>
										<td>2023-11-06</td>
										<td>완료</td>
									</tr>
									<tr>
										<td>2</td>
										<td><a href="#">제목입니다.제목입니다.</a></td>
										<td>아이디아이디아이디</td>
										<td>2023-11-06</td>
										<td>답변대기중</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 페이징 영역 -->
						<div class="ec-pro-pagination">
                            <span>Showing ${responseDomesticStockSearchDto.pagination.start}-${responseDomesticStockSearchDto.pagination.end} of ${responseDomesticStockSearchDto.pagination.totalCount} 개</span>
                            <ul class="ec-pro-pagination-inner">
                                <c:if test="${responseDomesticStockSearchDto.pagination.prevPageGroup}">
                                	<li><a class="next" href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${responseDomesticStockSearchDto.pagination.currentPage - 1}">Prev <i class="ecicon eci-angle-left"></i></a></li>
                               	</c:if>
                            
                            	<c:forEach var="num" begin="${responseDomesticStockSearchDto.pagination.startPageGroup}" end="${responseDomesticStockSearchDto.pagination.endPageGroup}">
                                <li><a class="${num eq responseDomesticStockSearchDto.pagination.currentPage ? 'active' : ''}" href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${num}">${num}</a></li>
                                </c:forEach>
                                <c:if test="${responseDomesticStockSearchDto.pagination.nextPageGroup}">
                                	<li><a class="next" href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${responseDomesticStockSearchDto.pagination.currentPage + 1}">Next <i class="ecicon eci-angle-right"></i></a></li>
                               	</c:if>
                            </ul>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- End Content -->
</div> <!-- End Content Wrapper -->
<%@ include file ="/WEB-INF/view/stock/footer.jsp" %>
</body>
</html>
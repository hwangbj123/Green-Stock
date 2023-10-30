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
	    <style>
	    	.primaryColorRed{
	    		color: #ff909d;
	    	}
	    	.primaryColorBlue{
	    		color: #3474d4;
	    	}
	    	.searchList{}
	    	.searchList .tag{
	    		background-color: #1c8855;
	    		box-shadow: 0px 0px 5px 0px #ccc;
	    	}
	    	.searchList > tbody > tr > td:nth-child(n+2){
	    		padding-right: 48px;
	    	}
	    	
	    </style>
	</head>
<body>
<%@ include file ="/WEB-INF/view/stock/header.jsp" %>
 <!-- CONTENT WRAPPER -->
    <div class="ec-content-wrapper container">
      <div class="content">
        <div class="breadcrumb-wrapper breadcrumb-wrapper-2 typography">
          <h1 class="ec-fw-bold mb-2">${companyName}</h1>
          <p class="breadcrumbs">
            <span><i class="mdi mdi-chevron-right"></i></span>${companyCode}
          </p>
        </div>
        <div class="row mb-4">
          <div class="col-lg-3 col-md-6">
            <h2 class="${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${stockCurrentPrice.stckPrpr}"/></h2>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>전일</h6>
              <p><fmt:formatNumber value="${stockCurrentPrice.stckSdpr}"/></p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>고가</h6>
              <p class="primaryColorRed"><fmt:formatNumber value="${stockCurrentPrice.stckHgpr}"/> (상한가 <fmt:formatNumber value="${stockCurrentPrice.stckMxpr}"/>)</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>거래량(주)</h6>
              <p><fmt:formatNumber value="${stockCurrentPrice.acmlVol}"/></p>
            </div>
          </div>
        </div>
        <div class="row mb-4">
          <div class="col-lg-3 col-md-6">
          	<div>
              <h6>전일대비</h6>
              <p class="${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">
              	${stockCurrentPrice.prdyVrssSign < 3 ? '▲' : '▼'} 
              	<fmt:formatNumber value="${stockCurrentPrice.prdyVrss}"/> | ${stockCurrentPrice.prdyCtrt} %</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>시가</h6>
              <p><fmt:formatNumber value="${stockCurrentPrice.stckOprc}"/></p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>저가</h6>
              <p class="primaryColorBlue"><fmt:formatNumber value="${stockCurrentPrice.stckLwpr}"/> (하한가 <fmt:formatNumber value="${stockCurrentPrice.stckLlam}"/>)</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div>
              <h6>거래대금(백만)</h6>
              <p><fmt:formatNumber value="${stockCurrentPrice.acmlTrPbmnMillion}"/></p>
            </div>
          </div>
        </div>
      </div>
      <section class="section ec-category-section section-space-p pb-4 pt-4" id="categories">
        <div class="container">
          <div class="row">
            <!--Category Nav Start -->
            <div class="col-lg-3">
              <ul class="ec-cat-tab-nav nav" role="tablist">
                <li class="cat-item">
                  <a class="cat-link active" data-bs-toggle="tab" href="#tab-cat-1" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc text-center"><span>투자정보</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-2" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc"><span>호가10단계</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-3" aria-selected="false" role="tab" tabindex="-1">
                    <div class="cat-desc"><span>Bags</span></div>
                  </a>
                </li>
                <li class="cat-item">
                  <a class="cat-link" data-bs-toggle="tab" href="#tab-cat-4" aria-selected="true" role="tab">
                    <div class="cat-desc"><span>Shoes</span></div>
                  </a>
                </li>
              </ul>
            </div>
            <!-- Category Nav End -->
            <!--Category Tab Start -->
            <div class="col-lg-9">
              <div class="tab-content">
                <!-- 1st Category tab end -->
                <div class="tab-pane fade d-flex active show" id="tab-cat-1" role="tabpanel">
                  <div class="table-responsive">
                    <table class="table table-borederd text-end">
                      <tbody>
                        <tr>
                          <th class="text-start">시가총액</th>
                          <td><fmt:formatNumber value="${stockCurrentPrice.htsAvls}"/></td>
                        </tr>
                        <tr>
                          <th class="text-start">상장주식수</th>
                          <td><fmt:formatNumber value="${stockCurrentPrice.lstnStcn}"/></td>
                        </tr>
                        <tr>
                          <th class="text-start">외국인보유주식수</th>
                          <td><fmt:formatNumber value="${stockCurrentPrice.frgnHldnQty}"/></td>
                        </tr>
                        <tr>
                          <th class="text-start">외국인소진율</th>
                          <td>${stockCurrentPrice.htsFrgnEhrt} %</td>
                        </tr>
                        <tr>
                          <th class="text-start">52주 최고 | 최저</th>
                          <td><fmt:formatNumber value="${stockCurrentPrice.w52Hgpr}"/> | <fmt:formatNumber value="${stockCurrentPrice.w52Lwpr}"/></td>
                        </tr>
                        <tr>
                          <th class="text-start">PER | EPS</th>
                          <td>${stockCurrentPrice.per} 배 | <fmt:formatNumber value="${stockCurrentPrice.eps}"/></td>
                        </tr>
                        <tr>
                          <th class="text-start">PBR | BPS</th>
                          <td>${stockCurrentPrice.pbr} 배 | <fmt:formatNumber value="${stockCurrentPrice.bps}"/></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <!-- 1st Category tab end -->
                <div class="tab-pane fade" id="tab-cat-2" role="tabpanel">bbb</div>
                <!-- 2nd Category tab end -->
                <!-- 3rd Category tab start -->
                <div class="tab-pane fade" id="tab-cat-3" role="tabpanel">ccc</div>
                <!-- 3rd Category tab end -->
                <!-- 4th Category tab start -->
                <div class="tab-pane fade" id="tab-cat-4" role="tabpanel">ddd</div>
                <!-- 4th Category tab end -->
              </div>
              <!-- Category Tab End -->
            </div>
          </div>
        </div>
      </section>
      <!-- End Content -->
    </div>
    <!-- End Content Wrapper -->
<%@ include file ="/WEB-INF/view/layout/footer.jsp" %>

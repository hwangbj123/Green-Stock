<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="x-ua-compatible" content="ie=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
 
     <title>Green Stock</title>
     <meta name="keywords"
         content="apparel, catalog, clean, ecommerce, ecommerce HTML, electronics, fashion, html eCommerce, html store, minimal, multipurpose, multipurpose ecommerce, online store, responsive ecommerce template, shops" />
     <meta name="description" content="Best ecommerce html template for single and multi vendor store.">
     <meta name="author" content="ashishmaraviya">
 
     <!-- site Favicon -->
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
     
     <!-- Custom css -->
     <link rel="stylesheet" href="/resources/css/custom/boardWrite.css" />
     
 </head>
<body class="blog_page">

<!--Header -->
    <%@include file="/WEB-INF/view/layout/header.jsp"%>


    <!-- Ec Blog page -->
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="ec-blogs-rightside col-lg-12 col-md-12">

                    <!-- Blog content Start -->
                    <div class="ec-blogs-content">
                        <div class="ec-blogs-inner">
                        	<div class="board-content">
                        		<form method="post" action="board-write" id="board-write-frm">
	                        		<table class="write-tb">
	                        			<tr>
	                        				<td>
	                        					<div class="write-select">
		                        					<select id="category-select" name="categoryId">
		                        						<option value="" disabled="disabled" selected="selected">- 카테고리 -</option>
		                        					<c:forEach var="cateName" items="${cate}" varStatus="status">
		                        						<option value="${status.count}">${cateName}</option>
		                        					</c:forEach>
		                        					</select>
	                        					</div>
	                        				</td>
	                        				<td>
	                        					<input type="text" id="title-input" name="title" placeholder="제목을 입력해주세요">
											</td>
	                        				<td style="height: 56px;">작성자 : 
	                        					${principal.userName}
	                        					<input type="hidden" name="userId" value="${principal.id}">
											</td>
	                        			</tr>
	                        			<tr>
<!-- 	                        				<td>내용</td> -->
	                        				<td colspan="3" style="padding: 30px 0px; height: 500px;">
	                        					<textarea id="content-textarea" name="content" placeholder="내용을 입력해주세요"></textarea>
											</td>
	                        			</tr>
	                        			<tr>
	                        				<td colspan="3">
	                        					<button type="button" class="btn btn-primary" id="write-submit-btn" onclick="boardWriteInit.submit()">저장</button>
	                        					<button type="button" class="btn btn-danger" style="background-color: #aaa" onclick="history.back()">취소</button>
	                        				</td>
	                        			</tr>
	                        		</table>
                        		</form>
                        		
                        	</div>
                        </div>
                    </div>
                    <!--Blog content End -->
                </div>
            </div>
        </div>
    </section>

	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
    <!-- Vendor JS -->
    <script src="/resources/js/vendor/jquery-3.6.0.min.js"></script>
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
    
    <!-- Summernote -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css">
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
    
    <!-- Custom Js -->
    <script src="/resources/js/custom/boardWrite.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="x-ua-compatible" content="ie=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
 
     <title>Ekka - Ecommerce HTML Template + Admin Dashboard.</title>
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
     <link rel="stylesheet" href="/resources/css/custom/boardList.css" />
 </head>
<body>
    <div id="ec-overlay">
        <div class="ec-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    
<!--Header -->
    <%@include file="/WEB-INF/view/layout/header.jsp"%>

    <!-- ekka Cart Start -->
    <div class="ec-side-cart-overlay"></div>
    <div id="ec-side-cart" class="ec-side-cart">
        <div class="ec-cart-inner">
            <div class="ec-cart-top">
                <div class="ec-cart-title">
                    <span class="cart_title">My Cart</span>
                    <button class="ec-close">Ã</button>
                </div>
                <ul class="eccart-pro-items">
                    <li>
                        <a href="product-left-sidebar.html" class="sidekka_pro_img"><img
                                src="/resources/images/product-image/6_1.jpg" alt="product"></a>
                        <div class="ec-pro-content">
                            <a href="product-left-sidebar.html" class="cart_pro_title">T-shirt For Women</a>
                            <span class="cart-price"><span>$76.00</span> x 1</span>
                            <div class="qty-plus-minus">
                                <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                            </div>
                            <a href="javascript:void(0)" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-left-sidebar.html" class="sidekka_pro_img"><img
                                src="/resources/images/product-image/12_1.jpg" alt="product"></a>
                        <div class="ec-pro-content">
                            <a href="product-left-sidebar.html" class="cart_pro_title">Women Leather Shoes</a>
                            <span class="cart-price"><span>$64.00</span> x 1</span>
                            <div class="qty-plus-minus">
                                <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                            </div>
                            <a href="javascript:void(0)" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-left-sidebar.html" class="sidekka_pro_img"><img
                                src="/resources/images/product-image/3_1.jpg" alt="product"></a>
                        <div class="ec-pro-content">
                            <a href="product-left-sidebar.html" class="cart_pro_title">Girls Nylon Purse</a>
                            <span class="cart-price"><span>$59.00</span> x 1</span>
                            <div class="qty-plus-minus">
                                <input class="qty-input" type="text" name="ec_qtybtn" value="1" />
                            </div>
                            <a href="javascript:void(0)" class="remove">Ã</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="ec-cart-bottom">
                <div class="cart-sub-total">
                    <table class="table cart-table">
                        <tbody>
                            <tr>
                                <td class="text-left">Sub-Total :</td>
                                <td class="text-right">$300.00</td>
                            </tr>
                            <tr>
                                <td class="text-left">VAT (20%) :</td>
                                <td class="text-right">$60.00</td>
                            </tr>
                            <tr>
                                <td class="text-left">Total :</td>
                                <td class="text-right primary-color">$360.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cart_btn">
                    <a href="cart.html" class="btn btn-primary">View Cart</a>
                    <a href="checkout.html" class="btn btn-secondary">Checkout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ekka Cart End -->

    <!-- Ec breadcrumb start -->
    <div class="sticky-header-next-sec  ec-breadcrumb section-space-mb">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ec_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ec-breadcrumb-title">Multi Vendor</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ec-breadcrumb-list start -->
                            <ul class="ec-breadcrumb-list">
                                <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="ec-breadcrumb-item active">Multi Vendor</li>
                            </ul>
                            <!-- ec-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec breadcrumb end -->

    <div class="section-space-p">
<!------카테고리 div	    	 -->
    	<table id="category-tb">
    			<tr>
					<td><button type="button" class="btn btn-primary" style="background-color: white;" onclick='location.href="/board/list"' >전체</button></td>
					<c:forEach var="c" items="${cate}" varStatus="status">
						<td><button type="button" class="btn btn-primary" id="category-btn-${status.count}" style="background-color: white;" onclick='location.href="/board/list?categoryId=${status.count}"' >${c}</button></td>
					</c:forEach>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						<!------검색 상태 표시 -->
						<c:if test="${not empty paging.orderType}">
							<c:if test="${paging.orderType eq 'views'}">
									<c:out value='[조회순] '/>
							</c:if>
							<c:if test="${paging.orderType eq 'recommand'}">
									<c:out value='[추천순] '/>
							</c:if>
							<c:if test="${paging.orderType eq 'reply'}">
									<c:out value='[댓글순] '/>
							</c:if>
						</c:if>
						<c:if test="${not empty paging.searchType}">
							<c:if test="${paging.searchType eq 'title'}">
									<c:out value='[제목]'/>
							</c:if>
							<c:if test="${paging.searchType eq 'content'}">
									<c:out value='[내용]'/>
							</c:if>
							<c:if test="${paging.searchType eq 'userName'}">
									<c:out value='[작성자]'/>
							</c:if>
						</c:if>
						<c:if test="${not empty paging.searchWord}">
									<c:out value='[\"${paging.searchWord}\"]'/>
						</c:if>
						<c:if test="${not empty paging.orderType ||
									  not empty paging.searchType ||
									  not empty paging.searchWord}">
									  에 대한 검색 결과
						</c:if>
					</td>
				</tr>
    	</table>
<!------리스트 div -->
    	<div class="board-div">
					
	    	<table class="board-tb">
	    		<tr>
	    			<th style="width: 5%;">번호</th>
	    			<th style="width: 10%;">카테고리</th>
	    			<th style="width: 45%;">제목</th>
	    			<th style="width: 10%;">작성자</th>
	    			<th style="width: 15%;">날짜</th>
	    			<th style="width: 8%;">조회수</th>
	    			<th style="width: 6%;">추천</th>
	    		</tr>
		    	<c:forEach var="board" items="${list}">
		    		<tr>
		    			<td>${board.id}</td>
		    			<td>
		    				<c:forEach var="c" items="${cate}" varStatus="status">
           						<c:choose>
	           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 1}">
	           							<span style="border: 1px solid skyblue; padding: 3px 5px; border-radius: 5px; color: skyblue;">
	           								${c}
           								</span>
	           						</c:when>
	           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 2}">
	           							<span style="border: 1px solid #ffc107; padding: 3px 5px; border-radius: 5px; color: #ffc107;">
	           								${c}
           								</span>
	           						</c:when>
	           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 3}">
	           							<span style="border: 1px solid #2ab674; padding: 3px 5px; border-radius: 5px; color: #2ab674;">
	           								${c}
           								</span>
	           						</c:when>
           						</c:choose>
           					</c:forEach>
						</td>
		    			<td style="text-align: left;">
		    				<a href="detail?boardId=${board.id}">${board.title}
			    				<c:if test="${board.reply ne 0}">
			    					<span style="color: #bbb;">[${board.reply}]</span>
			    				</c:if>
		    				</a>
	    				</td>
		    			<td>${board.userName}</td>
		    			<td>
		    				<fmt:formatDate value="${board.date}" pattern="MM-dd HH:mm:ss"/>
		   				</td>
		    			<td>${board.views}</td>
		    			<td>${board.recommand}</td>
		    		</tr>
		    	</c:forEach>
	    	</table>
<!----------검색 div	    	 -->
			<form action="/board/list" id="search-frm">
	    	<div id="listopt-div">
	    		<div id="search-div">
	    			<div style="border: 1px solid #CED4DA; height: 45px; width: 72px; border-radius: 5px;">
		    			<select name="searchType">
		    				<option value="title">제목</option>
		    				<option value="content">내용</option>
		    				<option value="userName">작성자</option>
		    			</select>
	    			</div>
		    		<input class="form-control ec-search-bar" type="text" id="search-word" name="searchWord">
		    		<button type="button" class="btn btn-primary" id="search-btn" onclick="boardListInit.searchValid()">검색</button>
	    			<div style="border: 1px solid #CED4DA; height: 45px; width: 72px; border-radius: 5px;">
		    			<select id="orderType" name="orderType">
		    				<option selected="selected" disabled="disabled">정렬</option>
		    				<option value="id">기본</option>
		    				<option value="views">조회순</option>
		    				<option value="recommand">추천순</option>
		    				<option value="reply">댓글순</option>
		    			</select>
	    			</div>
	    		</div>
	    		<c:choose>
	    			<c:when test="${not empty principal}">
			    		<a class="btn btn-primary" id="write-btn" href="/board/write">글 작성</a>
	    			</c:when>
	    			<c:otherwise>
	    				<a class="btn btn-primary" id="write-btn" onclick="boardListInit.toSignIn()">글 작성</a>
	    			</c:otherwise>
	    		</c:choose>
	    	</div>
			</form>
<!----------페이징 div -->
				<!----------페이징 function -->
				<c:set var="search" value="/board/list?"/>
				<c:if test="${not empty paging.categoryId}">
					<c:set var="search" value="${search}${'categoryId='}${paging.categoryId}&"/>
				</c:if>
				<c:if test="${not empty paging.searchType}">
					<c:set var="search" value="${search}${'searchType='}${paging.searchType}&"/>
				</c:if>
				<c:if test="${not empty paging.searchWord}">
					<c:set var="search" value="${search}${'searchWord='}${paging.searchWord}&"/>
				</c:if>
				<c:if test="${not empty paging.orderType}">
					<c:set var="search" value="${search}${'orderType='}${paging.orderType}&"/>
				</c:if>
	    	<div id="page">
<!-- 	    		시작 페이지 -->
	    		<c:choose>
	    			<c:when test="${page.paging.page>4}">
		    			<c:set var="startPage" value="${page.paging.page-4}"/>
	    			</c:when>
	    			<c:otherwise>
		    			<c:set var="startPage" value="1"/>
	    			</c:otherwise>
	    		</c:choose>

<!-- 				엔드 페이지	    		 -->
	    		<c:choose>
	    			<c:when test="${page.endPage < page.paging.page+4}">
		    			<c:set var="endPage" value="${page.endPage}"/>
	    			</c:when>
	    			<c:otherwise>
		    			<c:set var="endPage" value="${page.paging.page+4}"/>
	    			</c:otherwise>
	    		</c:choose>

<!-- 	    		이전 버튼 -->
	    		<c:if test="${startPage ne 1}">
	    			<a class="page-a" href="${search}page=${page.paging.page-5}">
	    				prev
	    			</a>
	    		</c:if>
<!-- 	    		페이지 넘버 반복문 -->
	    		<c:set var="nowPage" value="${startPage}"/>
	    		<c:forEach begin="${startPage}" end="${endPage}">
	    			<c:choose>
	    				<c:when test="${page.paging.page eq nowPage}">
	    					<p class="page-a" style="background-color: #3474D4; color: white; cursor: pointer;">
				    			<c:out value="${nowPage}"/>
	    					</p>
	    				</c:when>
	    				<c:otherwise>
	    					<a class="page-a" href="${search}page=${nowPage}">
				    			<c:out value="${nowPage}"/>
	    					</a>
	    				</c:otherwise>
	    			</c:choose>
	    			<c:set var="nowPage" value="${nowPage+1}"/>
	    		</c:forEach>
<!-- 	    		이후 버튼 -->
	    		<c:if test="${page.endPage > startPage+9}">
	    			<c:choose>
	    				<c:when test="${page.endPage > page.paging.page+5}">
			    			<a class="page-a" href="${search}page=${page.paging.page+5}">
			    				next
			    			</a>
	    				</c:when>
	    				<c:otherwise>
			    			<a class="page-a" href="${search}page=${page.endPage}">
			    				next
			    			</a>
	    				</c:otherwise>
	    			</c:choose>
	    		</c:if>
	    	</div>
    	</div>
        
    </div>
    
   	<%@include file="/WEB-INF/view/layout/footer.jsp"%>

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
    <script src="/resources/js/plugins/nouislider.js"></script>
    
    <!-- Main Js -->
    <script src="/resources/js/vendor/index.js"></script>
    <script src="/resources/js/main.js"></script>
    
    <!-- Custom Js -->
	<script src="/resources/js/custom/boardList.js"></script>
</body>
</html>
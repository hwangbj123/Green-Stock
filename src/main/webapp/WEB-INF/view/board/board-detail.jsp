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
     <link rel="stylesheet" href="/resources/css/custom/boardDetail.css" />
     
 </head>
<body class="blog_page">
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
                            <h2 class="ec-breadcrumb-title">Blog Page</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ec-breadcrumb-list start -->
                            <ul class="ec-breadcrumb-list">
                                <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="ec-breadcrumb-item active">Blog Page</li>
                            </ul>
                            <!-- ec-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec breadcrumb end -->
    
    <!-- 따봉 버튼 -->
	<div id="thumb-div">
		<c:choose>
			<c:when test="${not empty thumb}">
				<input type="hidden" id="thumb-check" value="${thumb}">
			</c:when>
			<c:otherwise>
				<input type="hidden" id="thumb-check" value="">
			</c:otherwise>
		</c:choose>
		<button type="button" id="thumb-btn" onclick="boardDetailInit.thumbFnc(${board.id}, ${principal.id})">
		게시글<br>추천</button>
	</div>
	
    <!-- Ec Blog page -->
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="ec-blogs-rightside col-lg-12 col-md-12">

                    <!-- Blog content Start -->
                    <div class="ec-blogs-content">
                        <div class="ec-blogs-inner">
                            <div class="board-content">
                            	
                        		<table class="detail-tb">
                        			<tr>
                        				<td style="height: 56px; text-align: left;">
                        					<c:forEach var="c" items="${cate}" varStatus="status">
                        						<c:if test="${board.categoryId eq status.count}">
                        							[${c}]
                        						</c:if>
                        					</c:forEach>
                        					<br>
                        					<span style="font-size: 3em; font-weight: bold;">
                        						${board.title }
                       						</span>
										</td>
                        			</tr>
                        			<tr>
                        				<td style="height: 56px; text-align: left; display: flex; justify-content: space-between;">
											<div>
											조회수 : ${board.views},
											추천 : ${board.recommand}
											</div>
											<div>
											${board.userName}
											</div>
										</td>
                        			</tr>
                        			<tr>
                        				<td style="padding: 30px 0px;height: 600px;">
                        					<div id="content-textarea">
                        						${board.content}
                        					</div>
										</td>
                        			</tr>
	                        			<tr>
	                        				<td>
	                        				<div style="display: flex; justify-content: center;">
												<form method="post" action="/board/board-delete" id="board-delete-frm" style="width: 100%;">
		                        					<c:if test="${board.userId eq principal.id}">
			                        					<button type="button" class="btn btn-primary" onclick="location.href='/board/update/${board.id}'">수정</button>
		                        					</c:if>
			                        					<button type="button" class="btn btn-primary" onclick="location.href='/board/list'" style="background-color: rgba(100,100,100,0.5)">목록</button>
		                        					<c:if test="${board.userId eq principal.id}">
														<input type="hidden" name="id" value="${board.id}">
			                        					<button type="button" class="btn btn-primary" id="delete-btn" onclick="boardDetailInit.boardDelete()">
			                        						삭제
			                        					</button>
		                        					</c:if>
												</form>
                        					</div>
	                        				</td>
	                        			</tr>
                        		</table>
                        	</div>
                            <div class="ec-blog-comments">
                                <div class="ec-blog-cmt-preview">
                                    <div class="ec-blog-comment-wrapper mt-55">
                                    
<!------------------------------------- 댓글 -->
										<!-- 베스트 댓글 표시 -->
									<div id="best-comment">
										<c:set var="maxRecommand" value="0"/>
										<c:forEach var="comment" items="${reply}">
											<c:if test="${comment.recommand > maxRecommand}">
												<c:set var="maxRecommand" value="${comment.recommand}"/>
											</c:if>
										</c:forEach>
										<!-- 최다 추천수 2 이상이면 최상단에 표시 -->
										<c:if test="${maxRecommand >= 2}">
											<c:set var="forBreak" value="0"/>
											<h4>BEST</h4>
											<c:forEach var="comment" items="${reply}">
												<c:if test="${comment.recommand eq maxRecommand && forBreak eq 0}">
													<div class="ec-single-comment-wrapper mt-35" style="border: 1px solid lightgrey; padding: 15px; margin-top: 0px; margin-left: calc(${comment.level} * 50px); background-color: #fee;">
		                                            <div class="ec-blog-comment-content">
		                                                <h5>${comment.userName}</h5>
		                                                <span><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
		                                                <p>${comment.content}</p>
		                                                <div class="ec-blog-details-btn">
		                                                <c:if test="${comment.deleted eq 0}">
	                                                    	<span style="color: black; margin-bottom: 2px; font-size: 20px; font-weight: bolder;">
	                                                    		👍 ${comment.recommand}
                                                    		</span>
		                                                </c:if>
	                                                </div>
	                                                <div class="rereply-div" id="rereply-id${comment.id}">
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <c:set var="forBreak" value="1"/>
										</c:if>
										</c:forEach>
										</c:if>
									</div>
										<!-- 베스트 댓글 표시 코드 끝-->
										<!-- 전체 댓글 -->
										<h4>COMMENT</h4>
										<c:forEach var="comment" items="${reply}">
	                                        <div class="ec-single-comment-wrapper mt-35" style="border: 1px solid lightgrey; padding: 15px; margin-left: calc(${comment.level} * 50px);
	                                        	<c:if test="${comment.userId eq board.userId}">
	                                        		<c:out value="background-color: rgba(52,116,212,0.1);"/>
	                                        	</c:if>
	                                        ">
	                                            <div class="ec-blog-comment-content">
	                                                <h5>${comment.userName}</h5>
	                                                <span><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
	                                                <p>${comment.content}</p>
	                                                <div class="ec-blog-details-btn">
	                                                <c:if test="${comment.deleted eq 0}">
	                                                	<c:choose>
		                                                    <c:when test="${not empty principal.id}">
			                                                    <button type="button" onclick="boardDetailInit.rereplyOpen(${comment.id}, 
			                                                    										   ${principal.id}, 
			                                                    										   ${comment.boardId},
			                                                    										   ${comment.ref},
			                                                    										   ${comment.step},
			                                                    										   ${comment.level})">
			                                                    	댓글
			                                                    </button>
			                                                    <c:if test="${comment.userId eq principal.id}">
			                                                    	<button type="button" onclick="boardDetailInit.replyDelete(${comment.id}, ${comment.boardId})">
			                                                    		삭제
			                                                    	</button>
			                                                    </c:if>
			                                                    <button type="button" id="reply-thumb-btn-${comment.id}" style="border-radius: 6px;" onclick="boardDetailInit.replyThumb(${comment.id}, ${principal.id})">
			                                                    	추천👍
			                                                    	<span id="reply-thumb-span-${comment.id}">
			   		                                                    <c:if test="${comment.recommand > 0}">                                                    
						                                                    	<c:out value="${comment.recommand}"/>
						                                                </c:if>
			                                                    	</span>
			                                                    </button>
		                                                    </c:when>
		                                                    <c:otherwise>
			                                                    <button type="button" onclick="boardDetailInit.toSignIn()">
			                                                    	댓글
			                                                    </button>
			                                                    <button type="button" onclick="boardDetailInit.toSignIn()">
			                                                    	추천👍🏻
				                                                    <c:if test="${comment.recommand > 0}">
					                                                    <c:out value="${comment.recommand}"/>
				                                                    </c:if>
			                                                    </button>
		                                                    </c:otherwise>
	                                                	</c:choose>
	                                                </c:if>
	                                                </div>
	                                                <div class="rereply-div" id="rereply-id${comment.id}">
	                                                </div>
	                                            </div>
	                                        </div>
										</c:forEach>
										<!-- 전체 댓글 끝-->
										
                                       	<!----------페이징 div -->
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
								    			<a class="page-a" href="list?page=${page.paging.page-5}">
								    				prev
								    			</a>
								    		</c:if>
							<!-- 	    		페이지 넘버 반복문 -->
								    		<c:set var="nowPage" value="${startPage}"/>
								    		<c:if test="${endPage > 1}">
									    		<c:forEach begin="${startPage}" end="${endPage}">
									    			<c:choose>
									    				<c:when test="${page.paging.page eq nowPage}">
									    					<p class="page-a" style="background-color: #3474D4; color: white; cursor: pointer;">
												    			<c:out value="${nowPage}"/>
									    					</p>
									    				</c:when>
									    				<c:otherwise>
									    					<a class="page-a" href="detail?boardId=${board.id}&page=${nowPage}">
												    			<c:out value="${nowPage}"/>
									    					</a>
									    				</c:otherwise>
									    			</c:choose>
									    			<c:set var="nowPage" value="${nowPage+1}"/>
									    		</c:forEach>
								    		</c:if>
							<!-- 	    		이후 버튼 -->
								    		<c:if test="${page.endPage > startPage+9}">
								    			<c:choose>
								    				<c:when test="${page.endPage > page.paging.page+5}">
										    			<a class="page-a" href="list?page=${page.paging.page+5}">
										    				next
										    			</a>
								    				</c:when>
								    				<c:otherwise>
										    			<a class="page-a" href="list?page=${page.endPage}">
										    				next
										    			</a>
								    				</c:otherwise>
								    			</c:choose>
								    		</c:if>
								    	</div>
                                        	<!----------페이징 div 끝 -->
                                    </div>
                                </div>
                                <div class="ec-blog-cmt-form">
                                    <div class="ec-blog-reply-wrapper mt-50">
                                        <h4 class="ec-blog-dec-title">Leave A Reply</h4>
                                        <form class="ec-blog-form" method="post" action="/board/reply-write">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="ec-leave-form">
                                                    	<c:choose>
	                                                    	<c:when test="${not empty principal}">
		                                                        <input type="text" value="${principal.userName}" readonly>
	                                                    	</c:when>
	                                                    	<c:otherwise>
		                                                        <input type="text" name="userId" value="로그인이 필요합니다" readonly>
	                                                    	</c:otherwise>
                                                    	</c:choose>
                                                        <input type="hidden" name="userId" value="${principal.id}">
                                                    	<input type="hidden" name="boardId" value="${board.id}">
                                                    	<input type="hidden" name="level" value="0">
                                                    	<input type="hidden" name="step" value="1">
                                                    	<input type="hidden" name="ref" value="${maxRef+1}">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="ec-text-leave">
                                                        <textarea placeholder="Content" name="content"></textarea>
                                                        <c:choose>
	                                                    	<c:when test="${not empty principal}">
		                                                        <button type="submit" class="btn btn-lg btn-secondary">등록</button>
	                                                    	</c:when>
	                                                    	<c:otherwise>
		                                                        <button type="button" class="btn btn-lg btn-secondary" onclick="boardDetailInit.toSignIn()">등록</button>
	                                                    	</c:otherwise>
                                                    	</c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
    <script src="/resources/js/custom/boardDetail.js"></script>
    <script>
	    $(function(){
	    	if (${replyUser}!=0) {
				console.log(${replyUser});
				$.each(${replyUser}, function(index, value) {
					$("#reply-thumb-btn-"+value).css("background-color","#f77");
				});
			}
	    	
	    })
    </script>
</body>

</html>
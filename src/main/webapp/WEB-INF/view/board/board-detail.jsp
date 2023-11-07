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

    <!-- Footer Start -->
    <footer class="ec-footer section-space-mt">
        <div class="footer-container">
            <div class="footer-offer">
                <div class="container">
                    <div class="row">
                        <div class="text-center footer-off-msg">
                            <span>Win a contest! Get this limited-editon</span><a href="#" target="_blank">View
                                Detail</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-top section-space-footer-p">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-lg-3 ec-footer-contact">
                            <div class="ec-footer-widget">
                                <div class="ec-footer-logo"><a href="#"><img src="/resources/images/logo/footer-logo.png"
                                            alt=""><img class="dark-footer-logo" src="/resources/images/logo/dark-logo.png"
                                            alt="Site Logo" style="display: none;" /></a></div>
                                <h4 class="ec-footer-heading">Contact us</h4>
                                <div class="ec-footer-links">
                                    <ul class="align-items-center">
                                        <li class="ec-footer-link">71 Pilgrim Avenue Chevy Chase, east california.</li>
                                        <li class="ec-footer-link"><span>Call Us:</span><a href="tel:+440123456789">+44
                                                0123 456 789</a></li>
                                        <li class="ec-footer-link"><span>Email:</span><a
                                                href="mailto:example@ec-email.com">+example@ec-email.com</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-2 ec-footer-info">
                            <div class="ec-footer-widget">
                                <h4 class="ec-footer-heading">Information</h4>
                                <div class="ec-footer-links">
                                    <ul class="align-items-center">
                                        <li class="ec-footer-link"><a href="about-us.html">About us</a></li>
                                        <li class="ec-footer-link"><a href="faq.html">FAQ</a></li>
                                        <li class="ec-footer-link"><a href="#">Delivery Information</a></li>
                                        <li class="ec-footer-link"><a href="contact-us.html">Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-2 ec-footer-account">
                            <div class="ec-footer-widget">
                                <h4 class="ec-footer-heading">Account</h4>
                                <div class="ec-footer-links">
                                    <ul class="align-items-center">
                                        <li class="ec-footer-link"><a href="#">My Account</a></li>
                                        <li class="ec-footer-link"><a href="track-order.html">Order History</a></li>
                                        <li class="ec-footer-link"><a href="#">Wish List</a></li>
                                        <li class="ec-footer-link"><a href="#">Specials</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-2 ec-footer-service">
                            <div class="ec-footer-widget">
                                <h4 class="ec-footer-heading">Services</h4>
                                <div class="ec-footer-links">
                                    <ul class="align-items-center">
                                        <li class="ec-footer-link"><a href="#">Discount Returns</a></li>
                                        <li class="ec-footer-link"><a href="#">Policy & policy </a></li>
                                        <li class="ec-footer-link"><a href="#">Customer Service</a></li>
                                        <li class="ec-footer-link"><a href="terms-condition.html">Term & condition</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-3 ec-footer-news">
                            <div class="ec-footer-widget">
                                <h4 class="ec-footer-heading">Newsletter</h4>
                                <div class="ec-footer-links">
                                    <ul class="align-items-center">
                                        <li class="ec-footer-link">Get instant updates about our new products and
                                            special promos!</li>
                                    </ul>
                                    <div class="ec-subscribe-form">
                                        <form id="ec-newsletter-form" name="ec-newsletter-form" method="post"
                                            action="#">
                                            <div id="ec_news_signup" class="ec-form">
                                                <input class="ec-email" type="email" required=""
                                                    placeholder="Enter your email here..." name="ec-email" value="" />
                                                <button id="ec-news-btn" class="button btn-primary" type="submit"
                                                    name="subscribe" value=""><i class="ecicon eci-paper-plane-o"
                                                        aria-hidden="true"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- Footer social Start -->
                        <div class="col text-left footer-bottom-left">
                            <div class="footer-bottom-social">
                                <span class="social-text text-upper">Follow us on:</span>
                                <ul class="mb-0">
                                    <li class="list-inline-item"><a class="hdr-facebook" href="#"><i class="ecicon eci-facebook"></i></a></li>
                                    <li class="list-inline-item"><a class="hdr-twitter" href="#"><i class="ecicon eci-twitter"></i></a></li>
                                    <li class="list-inline-item"><a class="hdr-instagram" href="#"><i class="ecicon eci-instagram"></i></a></li>
                                    <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i class="ecicon eci-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Footer social End -->
                        <!-- Footer Copyright Start -->
                        <div class="col text-center footer-copy">
                            <div class="footer-bottom-copy ">
                                <div class="ec-copy">Copyright Â© 2023 <a class="site-name text-upper"
                                        href="#">ekka<span>.</span></a>. All Rights Reserved</div>
                            </div>
                        </div>
                        <!-- Footer Copyright End -->
                        <!-- Footer payment -->
                        <div class="col footer-bottom-right">
                            <div class="footer-bottom-payment d-flex justify-content-end">
                                <div class="payment-link">
                                    <img src="/resources/images/icons/payment.png" alt="">
                                </div>

                            </div>
                        </div>
                        <!-- Footer payment -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area End -->
    
    <!-- Footer navigation panel for responsive display -->
    <div class="ec-nav-toolbar">
        <div class="container">
            <div class="ec-nav-panel">
                <div class="ec-nav-panel-icons">
                    <a href="#ec-mobile-menu" class="navbar-toggler-btn ec-header-btn ec-side-toggle"><i
                            class="fi-rr-menu-burger"></i></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="#ec-side-cart" class="toggle-cart ec-header-btn ec-side-toggle"><i
                            class="fi-rr-shopping-bag"></i><span
                            class="ec-cart-noti ec-header-count cart-count-lable">3</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="index.html" class="ec-header-btn"><i class="fi-rr-home"></i></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="wishlist.html" class="ec-header-btn"><i class="fi-rr-heart"></i><span
                            class="ec-cart-noti">4</span></a>
                </div>
                <div class="ec-nav-panel-icons">
                    <a href="login.html" class="ec-header-btn"><i class="fi-rr-user"></i></a>
                </div>

            </div>
        </div>
    </div>
    <!-- Footer navigation panel for responsive display end -->

    <!-- Recent Purchase Popup  -->
    <div class="recent-purchase">
        <img src="/resources/images/product-image/1.jpg" alt="payment image">
        <div class="detail">
            <p>Someone in new just bought</p>
            <h6>stylish baby shoes</h6>
            <p>10 Minutes ago</p>
        </div>
        <a href="javascript:void(0)" class="icon-btn recent-close">Ã</a>
    </div>
    <!-- Recent Purchase Popup end -->

    <!-- Cart Floating Button -->
    <div class="ec-cart-float">
        <a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
            <div class="header-icon"><i class="fi-rr-shopping-basket"></i>
            </div>
            <span class="ec-cart-count cart-count-lable">3</span>
        </a>
    </div>
    <!-- Cart Floating Button end -->

    <!-- Whatsapp -->
    <div class="ec-style ec-right-bottom">
        <!-- Start Floating Panel Container -->
        <div class="ec-panel">
            <!-- Panel Header -->
            <div class="ec-header">
                <strong>Need Help?</strong>
                <p>Chat with us on WhatsApp</p>
            </div>
            <!-- Panel Content -->
            <div class="ec-body">
                <ul>
                    <!-- Start Single Contact List -->
                    <li>
                        <a class="ec-list" data-number="918866774266"
                            data-message="Please help me! I have got wrong product - ORDER ID is : #654321485">
                            <div class="d-flex bd-highlight">
                                <!-- Profile Picture -->
                                <div class="ec-img-cont">
                                    <img src="/resources/images/whatsapp/profile_01.jpg" class="ec-user-img"
                                        alt="Profile image">
                                    <span class="ec-status-icon"></span>
                                </div>
                                <!-- Display Name & Last Seen -->
                                <div class="ec-user-info">
                                    <span>Sahar Darya</span>
                                    <p>Sahar left 7 mins ago</p>
                                </div>
                                <!-- Chat iCon -->
                                <div class="ec-chat-icon">
                                    <i class="fa fa-whatsapp"></i>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!--/ End Single Contact List -->
                    <!-- Start Single Contact List -->
                    <li>
                        <a class="ec-list" data-number="918866774266"
                            data-message="Please help me! I have got wrong product - ORDER ID is : #654321485">
                            <div class="d-flex bd-highlight">
                                <!-- Profile Picture -->
                                <div class="ec-img-cont">
                                    <img src="/resources/images/whatsapp/profile_02.jpg" class="ec-user-img"
                                        alt="Profile image">
                                    <span class="ec-status-icon ec-online"></span>
                                </div>
                                <!-- Display Name & Last Seen -->
                                <div class="ec-user-info">
                                    <span>Yolduz Rafi</span>
                                    <p>Yolduz is online</p>
                                </div>
                                <!-- Chat iCon -->
                                <div class="ec-chat-icon">
                                    <i class="fa fa-whatsapp"></i>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!--/ End Single Contact List -->
                    <!-- Start Single Contact List -->
                    <li>
                        <a class="ec-list" data-number="918866774266"
                            data-message="Please help me! I have got wrong product - ORDER ID is : #654321485">
                            <div class="d-flex bd-highlight">
                                <!-- Profile Picture -->
                                <div class="ec-img-cont">
                                    <img src="/resources/images/whatsapp/profile_03.jpg" class="ec-user-img"
                                        alt="Profile image">
                                    <span class="ec-status-icon ec-offline"></span>
                                </div>
                                <!-- Display Name & Last Seen -->
                                <div class="ec-user-info">
                                    <span>Nargis Hawa</span>
                                    <p>Nargis left 30 mins ago</p>
                                </div>
                                <!-- Chat iCon -->
                                <div class="ec-chat-icon">
                                    <i class="fa fa-whatsapp"></i>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!--/ End Single Contact List -->
                    <!-- Start Single Contact List -->
                    <li>
                        <a class="ec-list" data-number="918866774266"
                            data-message="Please help me! I have got wrong product - ORDER ID is : #654321485">
                            <div class="d-flex bd-highlight">
                                <!-- Profile Picture -->
                                <div class="ec-img-cont">
                                    <img src="/resources/images/whatsapp/profile_04.jpg" class="ec-user-img"
                                        alt="Profile image">
                                    <span class="ec-status-icon ec-offline"></span>
                                </div>
                                <!-- Display Name & Last Seen -->
                                <div class="ec-user-info">
                                    <span>Khadija Mehr</span>
                                    <p>Khadija left 50 mins ago</p>
                                </div>
                                <!-- Chat iCon -->
                                <div class="ec-chat-icon">
                                    <i class="fa fa-whatsapp"></i>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!--/ End Single Contact List -->
                </ul>
            </div>
        </div>
        <!--/ End Floating Panel Container -->
        <!-- Start Right Floating Button-->
        <div class="ec-right-bottom">
            <div class="ec-box">
                <div class="ec-button rotateBackward">
                    <img class="whatsapp" src="/resources/images/common/whatsapp.png" alt="whatsapp icon" />
                </div>
            </div>
        </div>
        <!--/ End Right Floating Button-->
    </div>
    <!-- Whatsapp end -->

    <!-- Feature tools -->
    <div class="ec-tools-sidebar-overlay"></div>
    <div class="ec-tools-sidebar">
        <div class="tool-title">
            <h3>Features</h3>
        </div>
        <div class="ec-tools-detail">
            <div class="ec-tools-sidebar-content ec-change-color ec-color-desc">
                <h3>Color Scheme</h3>
                <ul class="bg-panel">
                    <li class="active" data-color="01"><a href="#" class="colorcode1"></a></li>
                    <li data-color="02"><a href="#" class="colorcode2"></a></li>
                    <li data-color="03"><a href="#" class="colorcode3"></a></li>
                    <li data-color="04"><a href="#" class="colorcode4"></a></li>
                    <li data-color="05"><a href="#" class="colorcode5"></a></li>
                </ul>
            </div>
            <div class="ec-tools-sidebar-content">
                <h3>Backgrounds</h3>
                <ul class="bg-panel">
                    <li class="bg"><a class="back-bg-1" id="bg-1">Background-1</a></li>
                    <li class="bg"><a class="back-bg-2" id="bg-2">Background-2</a></li>
                    <li class="bg"><a class="back-bg-3" id="bg-3">Background-3</a></li>
                    <li class="bg"><a class="back-bg-4" id="bg-4">Default</a></li>
                </ul>
            </div>
            <div class="ec-tools-sidebar-content">
                <h3>Full Screen mode</h3>
                <div class="ec-fullscreen-mode">
                    <div class="ec-fullscreen-switch">
                        <div class="ec-fullscreen-btn">Mode</div>
                        <div class="ec-fullscreen-on">On</div>
                        <div class="ec-fullscreen-off">Off</div>
                    </div>
                </div>
            </div>
            <div class="ec-tools-sidebar-content">
                <h3>Dark mode</h3>
                <div class="ec-change-mode">
                    <div class="ec-mode-switch">
                        <div class="ec-mode-btn">Mode</div>
                        <div class="ec-mode-on">On</div>
                        <div class="ec-mode-off">Off</div>
                    </div>
                </div>
            </div>
            <div class="ec-tools-sidebar-content">
                <h3>RTL mode</h3>
                <div class="ec-change-rtl">
                    <div class="ec-rtl-switch">
                        <div class="ec-rtl-btn">Rtl</div>
                        <div class="ec-rtl-on">On</div>
                        <div class="ec-rtl-off">Off</div>
                    </div>
                </div>
            </div>

            <div class="ec-tools-sidebar-content">
                <h3>Clear local storage</h3>
                <a class="clear-cach" href="javascript:void(0)">Clear Cache & Default</a>
            </div>
        </div>
    </div>
    <!-- Feature tools end -->

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
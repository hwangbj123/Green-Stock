<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ include file="/WEB-INF/view/layout/header.jsp" %> --%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/notice2.css">
<link rel="icon" href="/resources/images/favicon/favicon.png"
	sizes="32x32" />
<link rel="apple-touch-icon"
	href="/resources/images/favicon/favicon.png" />
<meta name="msapplication-TileImage"
	content="/resources/images/favicon/favicon.png" />

<!-- css Icon Font -->
<link rel="stylesheet" href="/resources/css/vendor/ecicons.min.css" />

<!-- css All Plugins Files -->
<link rel="stylesheet" href="/resources/css/plugins/animate.css" />
<link rel="stylesheet"
	href="/resources/css/plugins/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/plugins/jquery-ui.min.css" />
<link rel="stylesheet" href="/resources/css/plugins/countdownTimer.css" />
<link rel="stylesheet" href="/resources/css/plugins/slick.min.css" />
<link rel="stylesheet" href="/resources/css/plugins/bootstrap.css" />

<!-- Main Style -->
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/responsive.css" />

<!-- Background css -->
<link rel="stylesheet" id="bg-switcher-css"
	href="/resources/css/backgrounds/bg-4.css">
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

</head>
<body>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		$(document).on(function() {
			$("#write").hide();
		});
		
	
	</script>
	<header class="ec-header">
		<!--Ec Header Top Start -->
		<div class="header-top">
			<div class="container">
				<div class="row align-items-center">
					<!-- Header Top social Start -->
					<div class="col text-left header-top-left d-none d-lg-block">
						<div class="header-top-social">
							<span class="social-text text-upper">Follow us on:</span>
							<ul class="mb-0">
								<li class="list-inline-item"><a class="hdr-facebook"
									href="#"><i class="ecicon eci-facebook"></i></a></li>
								<li class="list-inline-item"><a class="hdr-twitter"
									href="#"><i class="ecicon eci-twitter"></i></a></li>
								<li class="list-inline-item"><a class="hdr-instagram"
									href="#"><i class="ecicon eci-instagram"></i></a></li>
								<li class="list-inline-item"><a class="hdr-linkedin"
									href="#"><i class="ecicon eci-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- Header Top social End -->
					<!-- Header Top Message Start -->

					<!-- Header Top Message End -->
					<!-- Header Top Language Currency -->
					<div class="col header-top-right d-none d-lg-block">
						<div class="header-top-lan-curr d-flex justify-content-end">
							<!-- Currency Start -->
							<div class="header-top-curr dropdown">
								<button class="dropdown-toggle text-upper"
									data-bs-toggle="dropdown">
									Currency <i class="ecicon eci-caret-down" aria-hidden="true"></i>
								</button>
								<ul class="dropdown-menu">
									<li class="active"><a class="dropdown-item" href="#">USD
											$</a></li>
									<li><a class="dropdown-item" href="#">EUR €</a></li>
								</ul>
							</div>
							<!-- Currency End -->
							<!-- Language Start -->
							<div class="header-top-lan dropdown">
								<button class="dropdown-toggle text-upper"
									data-bs-toggle="dropdown">
									Language <i class="ecicon eci-caret-down" aria-hidden="true"></i>
								</button>
								<ul class="dropdown-menu">
									<li class="active"><a class="dropdown-item" href="#">English</a></li>
									<li><a class="dropdown-item" href="#">Italiano</a></li>
								</ul>
							</div>
							<!-- Language End -->

						</div>
					</div>
					<!-- Header Top Language Currency -->
					<!-- Header Top responsive Action -->
					<div class="col d-lg-none ">
						<div class="ec-header-bottons">
							<!-- Header User Start -->
							<div class="ec-header-user dropdown">
								<button class="dropdown-toggle" data-bs-toggle="dropdown">
									<i class="fi-rr-user"></i>
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a class="dropdown-item" href="register.html">Register</a></li>
									<li><a class="dropdown-item" href="checkout.html">Checkout</a></li>
									<li><a class="dropdown-item" href="login.html">Login</a></li>
								</ul>
							</div>
							<!-- Header User End -->
							<!-- Header Cart Start -->
							<a href="wishlist.html" class="ec-header-btn ec-header-wishlist">
								<div class="header-icon">
									<i class="fi-rr-heart"></i>
								</div> <span class="ec-header-count">4</span>
							</a>
							<!-- Header Cart End -->
							<!-- Header Cart Start -->
							<a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
								<div class="header-icon">
									<i class="fi-rr-shopping-bag"></i>
								</div> <span class="ec-header-count cart-count-lable">3</span>
							</a>
							<!-- Header Cart End -->
							<!-- Header menu Start -->
							<a href="#ec-mobile-menu"
								class="ec-header-btn ec-side-toggle d-lg-none"> <i
								class="fi fi-rr-menu-burger"></i>
							</a>
							<!-- Header menu End -->
						</div>
					</div>
					<!-- Header Top responsive Action -->
				</div>
			</div>
		</div>
		</header>
		<!-- Ec Header Top  End -->
		<!-- Ec Header Bottom  Start -->
		<div class="ec-header-bottom d-none d-lg-block">
			<div class="container position-relative">
				<div class="row">
					<div class="ec-flex">
						<!-- Ec Header Logo Start -->
						<div class="align-self-center">
							<div class="header-logo">
								<a href="index.html"><img
									src="/resources/images/logo/logo.png" alt="Site Logo" /><img
									class="dark-logo" src="/resources/images/logo/dark-logo.png"
									alt="Site Logo" style="display: none;" /></a>
							</div>
						</div>
						<!-- Ec Header Logo End -->

						<!-- Ec Header Search Start -->
						<div class="align-self-center">
							<div class="header-search">
								<form class="ec-btn-group-form" action="#">
									<input class="form-control ec-search-bar"
										placeholder="Search products..." type="text">
									<button class="submit" type="submit">
										<i class="fi-rr-search"></i>
									</button>
								</form>
							</div>
						</div>
						<!-- Ec Header Search End -->

						<!-- Ec Header Button Start -->
						<div class="align-self-center">
							<div class="ec-header-bottons">

								<!-- Header User Start -->
								<div class="ec-header-user dropdown">
									<button class="dropdown-toggle" data-bs-toggle="dropdown">
										<i class="fi-rr-user"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li><a class="dropdown-item" href="register.html">Register</a></li>
										<li><a class="dropdown-item" href="checkout.html">Checkout</a></li>
										<li><a class="dropdown-item" href="login.html">Login</a></li>
									</ul>
								</div>
								<!-- Header User End -->
								<!-- Header wishlist Start -->
								<a href="wishlist.html" class="ec-header-btn ec-header-wishlist">
									<div class="header-icon">
										<i class="fi-rr-heart"></i>
										<span class="ec-header-count">4</span>
									</div> 
								</a>
								<!-- Header wishlist End -->
								<!-- Header Cart Start -->
								<a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
									<div class="header-icon">
										<i class="fi-rr-shopping-bag"></i>
									</div> <span class="ec-header-count cart-count-lable">3</span>
								</a>
								<!-- Header Cart End -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Ec Header Button End -->
		<!-- Header responsive Bottom  Start -->
		<div class="ec-header-bottom d-lg-none">
			<div class="container position-relative">
				<div class="row ">

					<!-- Ec Header Logo Start -->
					<div class="col">
						<div class="header-logo">
							<a href="index.html"><img
								src="/resources/images/logo/logo.png" alt="Site Logo" /><img
								class="dark-logo" src="/resources/images/logo/dark-logo.png"
								alt="Site Logo" style="display: none;" /></a>
						</div>
					</div>
					<!-- Ec Header Logo End -->
					<!-- Ec Header Search Start -->
					<div class="col">
						<div class="header-search">
							<form class="ec-btn-group-form" action="#">
								<input class="form-control ec-search-bar"
									placeholder="Search products..." type="text">
								<button class="submit" type="submit">
									<i class="fi-rr-search"></i>
								</button>
							</form>
						</div>
					</div>
					<!-- Ec Header Search End -->
				</div>
			</div>
		</div>
		<!-- Header responsive Bottom  End -->
		<!-- EC Main Menu Start -->
		<div id="ec-main-menu-desk" class="d-none d-lg-block sticky-nav">
			<div class="container position-relative">
				<div class="row">
					<div class="col-md-12 align-self-center">
						<div class="ec-main-menu">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li class="dropdown position-static"><a
									href="javascript:void(0)">Categories</a>
									<ul class="mega-menu d-block">
										<li class="d-flex">
											<ul class="d-block">
												<li class="menu_title"><a href="javascript:void(0)">Classic
														Variation</a></li>
												<li><a href="shop-left-sidebar-col-3.html">Left
														sidebar 3 column</a></li>
												<li><a href="shop-left-sidebar-col-4.html">Left
														sidebar 4 column</a></li>
												<li><a href="shop-right-sidebar-col-3.html">Right
														sidebar 3 column</a></li>
												<li><a href="shop-right-sidebar-col-4.html">Right
														sidebar 4 column</a></li>
												<li><a href="shop-full-width.html">Full width 4
														column</a></li>
											</ul>
											<ul class="d-block">
												<li class="menu_title"><a href="javascript:void(0)">Classic
														Variation</a></li>
												<li><a href="shop-banner-left-sidebar-col-3.html">Banner
														left sidebar 3 column</a></li>
												<li><a href="shop-banner-left-sidebar-col-4.html">Banner
														left sidebar 4 column</a></li>
												<li><a href="shop-banner-right-sidebar-col-3.html">Banner
														right sidebar 3 column</a></li>
												<li><a href="shop-banner-right-sidebar-col-4.html">Banner
														right sidebar 4 column</a></li>
												<li><a href="shop-banner-full-width.html">Banner
														Full width 4 column</a></li>
											</ul>
											<ul class="d-block">
												<li class="menu_title"><a href="javascript:void(0)">Columns
														Variation</a></li>
												<li><a href="shop-full-width-col-3.html">3 Columns
														full width</a></li>
												<li><a href="shop-full-width-col-4.html">4 Columns
														full width</a></li>
												<li><a href="shop-full-width-col-5.html">5 Columns
														full width</a></li>
												<li><a href="shop-full-width-col-6.html">6 Columns
														full width</a></li>
												<li><a href="shop-banner-full-width-col-3.html">Banner
														3 Columns</a></li>
											</ul>
											<ul class="d-block">
												<li class="menu_title"><a href="javascript:void(0)">List
														Variation</a></li>
												<li><a href="shop-list-left-sidebar.html">Shop left
														sidebar</a></li>
												<li><a href="shop-list-right-sidebar.html">Shop
														right sidebar</a></li>
												<li><a href="shop-list-banner-left-sidebar.html">Banner
														left sidebar</a></li>
												<li><a href="shop-list-banner-right-sidebar.html">Banner
														right sidebar</a></li>
												<li><a href="shop-list-full-col-2.html">Full width
														2 columns</a></li>
											</ul>
										</li>
										<li>
											<ul class="ec-main-banner w-100">
												<li><a class="p-0" href="shop-left-sidebar-col-3.html"><img
														class="img-responsive"
														src="/resources/images/menu-banner/1.jpg" alt=""></a></li>
												<li><a class="p-0" href="shop-left-sidebar-col-4.html"><img
														class="img-responsive"
														src="/resources/images/menu-banner/2.jpg" alt=""></a></li>
												<li><a class="p-0" href="shop-right-sidebar-col-3.html"><img
														class="img-responsive"
														src="/resources/images/menu-banner/3.jpg" alt=""></a></li>
												<li><a class="p-0" href="shop-right-sidebar-col-4.html"><img
														class="img-responsive"
														src="/resources/images/menu-banner/4.jpg" alt=""></a></li>
											</ul>
										</li>
									</ul></li>
								<li class="dropdown"><a href="javascript:void(0)">Products</a>
									<ul class="sub-menu">
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Product page <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="product-left-sidebar.html">Product
														left sidebar</a></li>
												<li><a href="product-right-sidebar.html">Product
														right sidebar</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Product 360 <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="product-360-left-sidebar.html">360
														left sidebar</a></li>
												<li><a href="product-360-right-sidebar.html">360
														right sidebar</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Product video <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="product-video-left-sidebar.html">Video
														left sidebar</a></li>
												<li><a href="product-video-right-sidebar.html">Video
														right sidebar</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Product gallery <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="product-gallery-left-sidebar.html">Gallery
														left sidebar</a></li>
												<li><a href="product-gallery-right-sidebar.html">Gallery
														right sidebar</a></li>
											</ul></li>
										<li><a href="product-full-width.html">Product full
												width</a></li>
										<li><a href="product-360-full-width.html">360 full
												width</a></li>
										<li><a href="product-video-full-width.html">Video
												full width</a></li>
										<li><a href="product-gallery-full-width.html">Gallery
												full width</a></li>
									</ul></li>
								<li class="dropdown"><a href="javascript:void(0)">Pages</a>
									<ul class="sub-menu">
										<li><a href="about-us.html">About Us</a></li>
										<li><a href="contact-us.html">Contact Us</a></li>
										<li><a href="cart.html">Cart</a></li>
										<li><a href="checkout.html">Checkout</a></li>
										<li><a href="compare.html">Compare</a></li>
										<li><a href="faq.html">FAQ</a></li>
										<li><a href="login.html">Login</a></li>
										<li><a href="register.html">Register</a></li>
										<li><a href="track-order.html">Track Order</a></li>
										<li><a href="terms-condition.html">Terms Condition</a></li>
										<li><a href="privacy-policy.html">Privacy Policy</a></li>
									</ul></li>
								<li class="dropdown"><span class="main-label-note-new"
									data-toggle="tooltip" title="NEW"></span><a
									href="javascript:void(0)">Others</a>
									<ul class="sub-menu">
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Mail Confirmation <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="email-template-confirm-1.html">Mail
														Confirmation 1</a></li>
												<li><a href="email-template-confirm-2.html">Mail
														Confirmation 2</a></li>
												<li><a href="email-template-confirm-3.html">Mail
														Confirmation 3</a></li>
												<li><a href="email-template-confirm-4.html">Mail
														Confirmation 4</a></li>
												<li><a href="email-template-confirm-5.html">Mail
														Confirmation 5</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Mail Reset password <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="email-template-forgot-password-1.html">Reset
														password 1</a></li>
												<li><a href="email-template-forgot-password-2.html">Reset
														password 2</a></li>
												<li><a href="email-template-forgot-password-3.html">Reset
														password 3</a></li>
												<li><a href="email-template-forgot-password-4.html">Reset
														password 4</a></li>
												<li><a href="email-template-forgot-password-5.html">Reset
														password 5</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Mail Promotional <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="email-template-offers-1.html">Offer
														mail 1</a></li>
												<li><a href="email-template-offers-2.html">Offer
														mail 2</a></li>
												<li><a href="email-template-offers-3.html">Offer
														mail 3</a></li>
												<li><a href="email-template-offers-4.html">Offer
														mail 4</a></li>
												<li><a href="email-template-offers-5.html">Offer
														mail 5</a></li>
												<li><a href="email-template-offers-6.html">Offer
														mail 6</a></li>
												<li><a href="email-template-offers-7.html">Offer
														mail 7</a></li>
												<li><a href="email-template-offers-8.html">Offer
														mail 8</a></li>
											</ul></li>
										<li class="dropdown position-static"><span
											class="label-note-hot"></span> <a href="javascript:void(0)">Vendor
												account pages <i class="ecicon eci-angle-right"></i>
										</a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="vendor-dashboard.html">Vendor
														Dashboard</a></li>
												<li><a href="vendor-profile.html">Vendor Profile</a></li>
												<li><a href="vendor-uploads.html">Vendor Uploads</a></li>
												<li><a href="vendor-settings.html">Vendor Settings</a></li>
											</ul></li>
										<li class="dropdown position-static"><span
											class="label-note-trending"></span> <a
											href="javascript:void(0)">User account pages <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="user-profile.html">User Profile</a></li>
												<li><a href="user-history.html">History</a></li>
												<li><a href="wishlist.html">Wishlist</a></li>
												<li><a href="track-order.html">Track Order</a></li>
												<li><a href="user-invoice.html">Invoice</a></li>
											</ul></li>
										<li class="dropdown position-static"><a
											href="javascript:void(0)">Construction pages <i
												class="ecicon eci-angle-right"></i></a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="404-error-page.html">404 error page</a></li>
												<li><a href="under-maintenance.html">maintanence
														page</a></li>
												<li><a href="coming-soon.html">Coming soon page</a></li>
											</ul></li>
										<li class="dropdown position-static"><span
											class="label-note-new"></span> <a href="javascript:void(0)">Vendor
												Catalog pages <i class="ecicon eci-angle-right"></i>
										</a>
											<ul class="sub-menu sub-menu-child">
												<li><a href="catalog-single-vendor.html">Catalog
														Single Vendor</a></li>
												<li><a href="catalog-multi-vendor.html">Catalog
														Multi Vendor</a></li>
											</ul></li>
									</ul></li>
								<li class="dropdown"><a href="javascript:void(0)">Blog</a>
									<ul class="sub-menu">
										<li><a href="blog-left-sidebar.html">Blog left
												sidebar</a></li>
										<li><a href="blog-right-sidebar.html">Blog right
												sidebar</a></li>
										<li><a href="blog-detail-left-sidebar.html">Blog
												detail left sidebar</a></li>
										<li><a href="blog-detail-right-sidebar.html">Blog
												detail right sidebar</a></li>
										<li><a href="blog-full-width.html">Blog full width</a></li>
										<li><a href="blog-detail-full-width.html">Blog detail
												full width</a></li>
									</ul></li>
								<li class="dropdown"><a href="javascript:void(0)">Elements</a>
									<ul class="sub-menu">
										<li><a href="elemets-products.html">Products</a></li>
										<li><a href="elemets-typography.html">Typography</a></li>
										<li><a href="elemets-title.html">Titles</a></li>
										<li><a href="elemets-categories.html">Categories</a></li>
										<li><a href="elemets-buttons.html">Buttons</a></li>
										<li><a href="elemets-tabs.html">Tabs</a></li>
										<li><a href="elemets-accordions.html">Accordions</a></li>
										<li><a href="elemets-blog.html">Blogs</a></li>
									</ul></li>
								<li><a href="offer.html">Hot Offers</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Ec Main Menu End -->
		<div class="content container">
			<div
				class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
				
				<!-- 검색페이지 시작 -->
				<div class="container">
					<div class="row">					
						<form method="post" name="notice-search" action="">		
										<div class="font-size">
							<p class="breadcrumbs"></p>
								<i class="mdi mdi-chevron-right"> </i>
									</div>	
							<h2 style="width: 100%; text-align: center;">공지사항</h2>
							<div class="search-container" style="
							text-align: center;
							margin: 0 auto;							
							height: 100px;
							width: 600px;
							display: flex;
							justify-content: center;
							align-items: center;">						
							    <select class="custom-select" style="width: 150px">
							    <option value="" disabled selected>선택</option>
							    <option value="searchTitle">제목</option>
							    <option value="writer">작성자</option>
								</select>	
														   
							    <input type="text" class="form-control" placeholder="검색어 입력" name="searchText" maxlength="100" style="margin-right: 10px;">
							    <button type="submit" class="btn btn-success" style="
							    text-align: center;
							    width: 100px;
							    height: 50px;">검색</button>
							</div>
						</form>
					</div>	
				</div>
				<!-- 검색페이지 종료 -->
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card card-default">
						<div class="card-body">
							<div class="table-responsive">
								<div id="responsive-data-table_wrapper"
									class="dataTables_wrapper dt-bootstrap5 no-footer">
									<div class="row justify-content-between top-information">
										<div class="dataTables_length"
											id="responsive-data-table_length"></div>
										<div id="responsive-data-table_filter"
											class="dataTables_filter"></div>
									</div>
									<table id="responsive-data-table"
										class="table dataTable no-footer" style="width: 100%;"
										aria-describedby="responsive-data-table_info">
										<thead>
											<tr>
												<th class="noticeId" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1" aria-sort="ascending"
													aria-label="Product: activate to sort column descending">번호</th>
												<th class="notice-Title" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Name: activate to sort column ascending">제목</th>
												<th class="notice-userId" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Offer: activate to sort column ascending">작성자</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending">공개/비공개</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending">작성일</th>
												<th class="noticeCount" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Stock: activate to sort column ascending"
													style="width: 100px;">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${noticeList}" var="notice">
												<tr class="Noticeboard-list">
													<!-- <img class="tbl-thumb"></td> -->
													<td>${notice.id}</td>
													<td><a href="/notice/admin/view/${notice.id}">${notice.noticeTitle}</a></td>
													<td>${notice.userId}</td>
													<td>1</td>
													<td>${notice.noticeUpdated}</td>
													<td>조회수: ${notice.hitCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									
									<div class="write" style="text-align: right">	
										<a href="/notice/admin/write" class="btn btn-primary"
											style="display: inline-block; vertical-align: inherit; text-align: center; font-weight: bold; color: white;">작성하기</a>																												
												<%-- <div id = "paging">
												<div class="dataTables_info" id="responsive-data-table_info"
												role="status" aria-live="polite">Showing 1 to 20 of 57
												entries</div>																					
					
												<c:set var="prevPage" value="${page.prev}" />																																																				
												<c:set var="nowPage" value="${page.pageCriteriaDto.page}" />																									
												<c:set var="pageSize" value="10" />
												<div class = "pageing" style="text-align: center">																			
												<div class="pagination mx-auto">																																 																																																											
												<c:set var="nowPage" value="${page.pageCriteriaDto.page}" />

									
												<!-- 이전 기능 -->
												<c:if test="${page.endPage > startPage - pageSize}">
												    <c:choose>
												        <c:when test="${nowPage > 1}">
												            <a href="list?page=${nowPage - 1}" aria-controls="responsive-data-table" data-dt-idx="4" tabindex="0" class="page-link">이전</a>
												        </c:when>
												        <c:otherwise>												           
												            <a href="list?page=${nowPage - 1}" aria-controls="responsive-data-table" data-dt-idx="4" tabindex="0" class="page-link" hidden>이전</a>
												        </c:otherwise>
												    </c:choose>
												</c:if>
												
												<!-- 페이지 반복 -->																							
												<c:set var="startPage" value="${(nowPage - 1) - ((nowPage - 1) % pageSize) + 1}" />
												 <c:set var="endPage" value="${startPage + pageSize - 1}" />
												
												
												<div>
													<p>${page.startPage}</p>
												    
												</div>
												
												<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pageNum">
												    <c:choose>
												        <c:when test="${nowPage eq pageNum}">
												            <li class="page-item active">
												                <span class="page-link">${nowPage}</span>
												            </li>
												        </c:when>
												        <c:otherwise>
												            <li class="page-item">
												                <a class="page-link" href="/notice/admin/list?page=${pageNum}" aria-controls="responsive-data-table" tabindex="10">
												                    <c:out value="${pageNum}" />	
												                </a>
												            </li>
												        </c:otherwise>
													    </c:choose>
												</c:forEach>        
																									
												<!-- 다음 버튼  -->
												<c:if test="${page.endPage > startPage + pageSize - 1}">
												    <c:choose>
												        <c:when test="${page.endPage > nowPage + pageSize - 1}">
												            <a href="list?page=${nowPage + pageSize}" aria-controls="responsive-data-table" data-dt-idx="4" tabindex="0" class="page-link">다음</a>
												        </c:when>	
												        <c:otherwise>
												        	<a href="list?page=${page.endPage}" aria-controls="responsive-data-table" data-dt-idx="4" tabindex="0" class="page-link">다음</a>
												        </c:otherwise>												        					
												    </c:choose>
												</c:if>
												<!--  --> --%>
												
												<!-- 페이징 영역 -->
						<div class="ec-pro-pagination">
                            <span>Showing ${pagination.start}-${pagination.end} of ${pagination.totalCount} 개</span>
                            <ul class="ec-pro-pagination-inner">
                                <c:if test="${pagination.prevPageGroup}">
                                	<li><a class="next" href="/notice/admin/list?page=${pagination.currentPage - 1}">Prev <i class="ecicon eci-angle-left"></i></a></li>
                               	</c:if>
                            
                            	<c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
                                <li><a class="${num eq pagination.currentPage ? 'active' : ''}" href="/notice/admin/list?page=${num}">${num}</a></li>
                                </c:forEach>
                                <c:if test="${pagination.nextPageGroup}">
                                	<li><a class="next" href="/notice/admin/list?page=${pagination.currentPage + 1}">Next <i class="ecicon eci-angle-right"></i></a></li>
                               	</c:if>
                            </ul>
                        </div>

										<div class="row justify-content-between bottom-information">
												</div>																																								
											</div>										
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</body>
	</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
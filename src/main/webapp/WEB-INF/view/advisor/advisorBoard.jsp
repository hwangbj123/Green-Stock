<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Gstock</title>
    <link rel="icon" href="/resources/img/favicon.png" sizes="32x32" />
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
    <link rel="stylesheet" id="bg-switcher-css" href="/resources/css/backgrounds/bg-4.css" />
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

    <!-- kjh -->
    <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
  </head>
  <style>
    @font-face {
      font-family: 'Dovemayo';
      src: url('/resources/fonts/Dovemayo_gothic.ttf') format('truetype');
      font-weight: normal;
    }
    *:not(i),
    h5,
    h6,
    li {
      font-family: 'Dovemayo', sans-serif !important;
      font-weight: normal;
    }
    .advisorBoard {
      width: 50%;
    }
    .advisorBoard textarea {
      resize: none;
      border: 1px solid #e7e7e7;
    }
    .advisorBoard .hiddenPageArrow {
      visibility: hidden;
    }
  </style>
  <body>
    <%@ include file ="/WEB-INF/view/stock/header.jsp" %>
    <!-- CONTENT WRAPPER -->
    <div class="ec-content-wrapper container mb-5 advisorBoard">
      <div class="content">
        <div class="breadcrumb-wrapper">
          <div class="my-4">
            <h4>${advisorBoard.advisorNickname} 상담게시판</h4>
          </div>
        </div>
        <div class="row">
          <div class="ec-blogs-rightside col-lg-12 order-lg-last col-md-12 order-md-first">
            <!-- Blog content Start -->
            <div class="ec-blogs-content">
              <div class="ec-blogs-inner">
                <div class="ec-blog-main-img text-center">
                  <img class="blog-image" src="/upload/${advisorBoard.image}" alt="Blog" />
                </div>
                <div class="ec-blog-date">
                  <p class="date">${advisorBoard.createdAt.substring(0,10)} ${advisorBoard.createdAt.substring(11)} -</p>
                  <a href="javascript:void(0)">${replyTotal} Comments</a>
                </div>
                <div class="ec-blog-detail">
                  <h3 class="ec-blog-title">${advisorBoard.title}</h3>
                  <textarea name="" id="" cols="30" rows="10" readonly>${advisorBoard.content}</textarea>
                  <!-- <div class="ec-blog-sub-imgs">
								<div class="row">
									<div class="col-md-6">
										<img class="blog-image" src="assets/images/blog-image/2.jpg" alt="Blog">
									</div>
									<div class="col-md-6">
										<img class="blog-image" src="assets/images/blog-image/3.jpg" alt="Blog">
									</div>
								</div>
							</div> -->
                </div>
                <!-- <div class="ec-blog-tags">
							<a href="blog-left-sidebar.html">lifestyle ,</a>
							<a href="blog-left-sidebar.html">Outdoor ,</a>
							<a href="blog-left-sidebar.html">interior ,</a>
							<a href="blog-left-sidebar.html">sports ,</a>
							<a href="blog-left-sidebar.html">bloging ,</a>
							<a href="blog-left-sidebar.html">inspiration</a>
						</div> -->
                <div class="ec-blog-arrows">
                  <a
                    href="/advisor/sub/board/${advisorBoard.advisorNickname}/${advisorBoard.prevBoard.advisorBoardId}"
                    class="${empty advisorBoard.prevBoard ? 'hiddenPageArrow' : ''}"
                    ><i class="ecicon eci-angle-left"></i> Prev Post</a
                  >
                  <a
                    href="/advisor/sub/board/${advisorBoard.advisorNickname}/${advisorBoard.nextBoard.advisorBoardId}"
                    class="${empty advisorBoard.nextBoard ? 'hiddenPageArrow' : ''}"
                    >Next Post <i class="ecicon eci-angle-right"></i
                  ></a>
                </div>
                <div class="ec-blog-comments">
                  <div class="ec-blog-cmt-preview">
                    <div class="ec-blog-comment-wrapper mt-55">
                      <h4 class="ec-blog-dec-title">Comments : ${replyTotal}</h4>
                      <c:forEach var="entity" items="${page.content}">
                        <div class="ec-single-comment-wrapper mt-35">
                          <div class="ec-blog-comment-content">
                            <h5>${entity.userName}</h5>
                            <span>${entity.createdAt.substring(0, 10)} ${entity.createdAt.substring(11,16)}</span>
                            <p>${entity.content}</p>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="ec-blog-cmt-form">
                    <div class="ec-blog-reply-wrapper mt-50">
                      <h4 class="ec-blog-dec-title">Leave A Reply</h4>
                      <form class="ec-blog-form" action="#">
                        <div class="row">
                          <div class="col-md-12">
                            <div class="ec-text-leave">
                              <textarea placeholder="Message"></textarea>
                              <a href="#" class="btn btn-lg btn-secondary">Order Now</a>
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
      <!-- End Content -->
    </div>
    <!-- End Content Wrapper -->
    <%@ include file ="/WEB-INF/view/stock/footer.jsp" %>
  </body>
</html>

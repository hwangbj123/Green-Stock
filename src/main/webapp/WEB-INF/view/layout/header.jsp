<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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
    <link rel="stylesheet" id="bg-switcher-css" href="/resources/css/backgrounds/bg-4.css" />
    <!-- font-awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
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
    <header class="ec-header" style="position: relative !important; z-index: 200 !important">
      <!-- Header Start -->
      <div class="ec-header-bottom d-none d-lg-block">
        <div class="container position-relative">
          <div class="row">
            <div class="ec-flex">
              <!-- Header Logo Start -->
              <div class="align-self-center">
                <div class="header-logo">
                  <a href="/main"><img src="/resources/img/G_logo.jpg" alt="/resources/img/G_logo.jpg" /></a>
                </div>
              </div>
              <!-- Header Logo End -->

              <!-- Header Search Start -->
              <div class="align-self-center">
                <div class="header-search">
                  <form class="ec-btn-group-form" action="/stock/domestic" method="get">
                    <input class="form-control ec-search-bar" name="searchData" placeholder="종목명을 입력해주세요" type="text" required="required" />
                    <button class="submit" type="submit"><i class="fi-rr-search"></i></button>
                  </form>
                </div>
              </div>
              <!-- Header Search End -->

              <!-- Header Button Start -->
              <div class="align-self-center">
                <div class="ec-header-bottons">
                  <!-- Header User Start -->
                  <c:if test="${empty principal}">
                    <li>
                      <a href="http://localhost/user/sign-in" style="display: flex; align-items: center" class="login_btn"
                        ><span><i class="fa-solid fa-arrow-right-to-bracket"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">Login</span></a
                      >
                    </li>
                    <li>
                      <a href="http://localhost/user/sign-up" class="signIn_button" style="display: flex; align-items: center"
                        ><span><i class="fa-solid fa-user-plus"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">Sign-up</span></a
                      >
                    </li>
                  </c:if>
                  <c:if test="${principal.roletypeId == 1}">
                    <li>
                      <a href="http://localhost/user/verify-user" style="display: flex; align-items: center" class="login_btn"
                        ><span><i class="fa-solid fa-house-user"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">User-Info</span></a
                      >
                    </li>
                    <li>
                      <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                        ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a
                      >
                    </li>
                  </c:if>
                  <c:if test="${principal.roletypeId == 0}">
                    <li>
                      <a href="http://localhost/admin/main" style="display: flex; align-items: center" class="login_btn"
                        ><span><i class="fa-solid fa-screwdriver-wrench"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Admin-Page</span></a
                      >
                    </li>
                    <li>
                      <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                        ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a
                      >
                    </li>
                  </c:if>
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
          <div class="row">
            <!-- Ec Header Logo Start -->
            <div class="col">
              <div class="header-logo">
                <a href="index.html"><img src="/resources/img/G_logo.jpg" alt="Site Logo" /></a>
              </div>
            </div>
            <!-- Ec Header Logo End -->
            <!-- Ec Header Search Start -->
            <div class="col d-flex justify-content-center align-items-center">
              <div class="header-search">
                <form class="ec-btn-group-form" action="#">
                  <input class="form-control ec-search-bar" placeholder="Search products..." type="text" />
                  <button class="submit" type="submit"><i class="fi-rr-search"></i></button>
                </form>
              </div>
            </div>
            <!-- Ec Header Search End -->
          </div>
        </div>
      </div>
      <!-- Header responsive Bottom  End -->
      <!-- EC Main Menu Start -->
      <div id="ec-main-menu-desk" class="d-none d-lg-block sticky-nav" style="z-index: 100 !important">
        <div class="container position-relative">
          <div class="row">
            <div class="col-md-12 align-self-center">
              <div class="ec-main-menu">
                <ul>
                  <li><a href="/main">Home</a></li>
<!--                   <li class="dropdown position-static">
                    <a href="javascript:void(0)">Categories</a>
                    <ul class="mega-menu d-block">
                      <li class="d-flex">
                        <ul class="d-block">
                          <li class="menu_title"><a href="javascript:void(0)">Classic Variation</a></li>
                          <li><a href="shop-left-sidebar-col-3.html">Left sidebar 3 column</a></li>
                          <li><a href="shop-left-sidebar-col-4.html">Left sidebar 4 column</a></li>
                          <li><a href="shop-right-sidebar-col-3.html">Right sidebar 3 column</a></li>
                          <li><a href="shop-right-sidebar-col-4.html">Right sidebar 4 column</a></li>
                          <li><a href="shop-full-width.html">Full width 4 column</a></li>
                        </ul>
                        <ul class="d-block">
                          <li class="menu_title"><a href="javascript:void(0)">Classic Variation</a></li>
                          <li><a href="shop-banner-left-sidebar-col-3.html">Banner left sidebar 3 column</a></li>
                          <li><a href="shop-banner-left-sidebar-col-4.html">Banner left sidebar 4 column</a></li>
                          <li><a href="shop-banner-right-sidebar-col-3.html">Banner right sidebar 3 column</a></li>
                          <li><a href="shop-banner-right-sidebar-col-4.html">Banner right sidebar 4 column</a></li>
                          <li><a href="shop-banner-full-width.html">Banner Full width 4 column</a></li>
                        </ul>
                        <ul class="d-block">
                          <li class="menu_title"><a href="javascript:void(0)">Columns Variation</a></li>
                          <li><a href="shop-full-width-col-3.html">3 Columns full width</a></li>
                          <li><a href="shop-full-width-col-4.html">4 Columns full width</a></li>
                          <li><a href="shop-full-width-col-5.html">5 Columns full width</a></li>
                          <li><a href="shop-full-width-col-6.html">6 Columns full width</a></li>
                          <li><a href="shop-banner-full-width-col-3.html">Banner 3 Columns</a></li>
                        </ul>
                        <ul class="d-block">
                          <li class="menu_title"><a href="javascript:void(0)">List Variation</a></li>
                          <li><a href="shop-list-left-sidebar.html">Shop left sidebar</a></li>
                          <li><a href="shop-list-right-sidebar.html">Shop right sidebar</a></li>
                          <li><a href="shop-list-banner-left-sidebar.html">Banner left sidebar</a></li>
                          <li><a href="shop-list-banner-right-sidebar.html">Banner right sidebar</a></li>
                          <li><a href="shop-list-full-col-2.html">Full width 2 columns</a></li>
                        </ul>
                      </li>
                      <li>
                        <ul class="ec-main-banner w-100">
                          <li>
                            <a class="p-0" href="shop-left-sidebar-col-3.html"><img class="img-responsive" src="/resources/images/menu-banner/1.jpg" alt="" /></a>
                          </li>
                          <li>
                            <a class="p-0" href="shop-left-sidebar-col-4.html"><img class="img-responsive" src="/resources/images/menu-banner/2.jpg" alt="" /></a>
                          </li>
                          <li>
                            <a class="p-0" href="shop-right-sidebar-col-3.html"><img class="img-responsive" src="/resources/images/menu-banner/3.jpg" alt="" /></a>
                          </li>
                          <li>
                            <a class="p-0" href="shop-right-sidebar-col-4.html"><img class="img-responsive" src="/resources/images/menu-banner/4.jpg" alt="" /></a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </li> 
-->
                  <li class="dropdown">
                    <span class="main-label-note-new" data-toggle="tooltip" title="NEW"></span>
                    <a href="javascript:void(0)">Portfolio</a>
                    <ul class="sub-menu">
                      <li class="dropdown position-static">
                        <a href="javascript:void(0)">Product page <i class="ecicon eci-angle-right"></i></a>
                      </li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a href="javascript:void(0)">Advisor</a>
                    <ul class="sub-menu">
                      <li><a href="/advisor/list">주식 전문가 리스트</a></li>
                      <li><a href="/advisor/register">전문가 신청</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a href="/board/list">Community</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Ec Main Menu End -->
    </header>
  </body>
</html>

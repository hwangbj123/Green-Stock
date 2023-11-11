<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    ><span><i class="fa-solid fa-arrow-right-to-bracket"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">로그인</span></a
                  >
                </li>
                <li>
                  <a href="http://localhost/user/sign-up" class="signIn_button" style="display: flex; align-items: center"
                    ><span><i class="fa-solid fa-user-plus"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">회원가입</span></a
                  >
                </li>
              </c:if>
              <c:if test="${principal.roletypeId == 1}">
                <li>
                  <a href="http://localhost/user/verify-user" style="display: flex; align-items: center" class="login_btn"
                    ><span><i class="fa-solid fa-house-user"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">내 정보</span></a
                  >
                </li>
                <li>
                  <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                    ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">로그아웃</span></a
                  >
                </li>
              </c:if>
              <c:if test="${principal.roletypeId == 0}">
                <li>
                  <a href="http://localhost/admin/main" style="display: flex; align-items: center" class="login_btn"
                    ><span><i class="fa-solid fa-screwdriver-wrench"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">관리자 페이지</span></a
                  >
                </li>
                <li>
                  <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                    ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">로그아웃</span></a
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
              <li><a href="/main">메인</a></li>
              <li class="dropdown">
                <a href="/portfolio">포트폴리오</a>
              </li>
              <li class="dropdown">
                <a href="javascript:void(0)">주식전문가</a>
                <ul class="sub-menu">
                  <li><a href="/advisor/list">주식 전문가 리스트</a></li>
                  <li><a href="/advisor/register">전문가 신청</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="/board/list">커뮤니티</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Ec Main Menu End -->
</header>
<div class="sticky-header-next-sec ec-breadcrumb section-space-mb" style="display: none">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="row ec_breadcrumb_inner">
          <div class="col-md-6 col-sm-12">
            <h2 class="ec-breadcrumb-title">Products</h2>
          </div>
          <div class="col-md-6 col-sm-12">
            <!-- ec-breadcrumb-list start -->
            <ul class="ec-breadcrumb-list">
              <li class="ec-breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="ec-breadcrumb-item active">Products</li>
            </ul>
            <!-- ec-breadcrumb-list end -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

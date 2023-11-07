<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Ekka - Admin Dashboard eCommerce HTML Template." />

    <title>Gstock Admin</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
      rel="stylesheet"
    />

    <link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

    <!-- font-awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- PLUGINS CSS STYLE -->
    <link href="/resources/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="/resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

    <!-- Ekka CSS -->
    <link id="ekka-css" href="/resources/css/ekka.css" rel="stylesheet" />

    <!-- FAVICON -->
    <link href="/resources/img/favicon.png" rel="shortcut icon" />
    <style>
      .ec-brand a img {
        max-width: 100px;
      }
    </style>
  </head>

  <body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light" id="body">
    <!--  WRAPPER  -->
    <div class="wrapper">
      <!-- LEFT MAIN SIDEBAR -->
      <div class="ec-left-sidebar ec-bg-sidebar">
        <div id="sidebar" class="sidebar ec-sidebar-footer">
          <div class="ec-brand">
            <a href="/main" title="Gstock"><img src="/resources/img/G_logo.jpg" alt="" style="width: 100px !important" /> </a>
          </div>

          <!-- begin sidebar scrollbar -->
          <div class="ec-navigation" data-simplebar>
            <!-- sidebar menu -->
            <ul class="nav sidebar-inner" id="sidebar-menu">
              <!-- Dashboard -->
              <li class="active">
                <a class="sidenav-item-link" href="/admin/main">
                  <i class="mdi mdi-view-dashboard-outline"></i>
                  <span class="nav-text">Admin Main</span>
                </a>
                <hr />
              </li>
              <!-- Reviews -->
              <li>
                <a class="sidenav-item-link" href="/admin/user"> <i class="fas fa-user-edit" style="margin-right: 20px"></i> <span class="nav-text">회원 관리</span> </a>
              </li>
              <!-- Board -->
              <li>
                <a class="sidenav-item-link" href="/admin/board"> <i class="fas fa-user-edit" style="margin-right: 20px"></i> <span class="nav-text">게시판 관리</span> </a>
              </li>
              <!-- Chatting -->
              <li>
                <a class="sidenav-item-link" href="/admin/chat"> <i class="fas fa-user-edit" style="margin-right: 20px"></i> <span class="nav-text">채팅 관리</span> </a>
              </li>
              <!-- Category -->
              <li class="has-sub">
                <a class="sidenav-item-link" href="javascript:void(0)">
                  <i class="mdi mdi-dns-outline" style="margin-right: 20px"></i> <span class="nav-text">견본</span> <b class="caret"></b>
                </a>
                <div class="collapse">
                  <ul class="sub-menu" id="categorys" data-parent="#sidebar-menu">
                    <li class="">
                      <a class="sidenav-item-link" href="main-category.html"> <span class="nav-text">Main Category</span> </a>
                    </li>
                    <li class="">
                      <a class="sidenav-item-link" href="sub-category.html"> <span class="nav-text">Sub Category</span> </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!--  PAGE WRAPPER -->
      <div class="ec-page-wrapper">
        <!-- Header -->
        <header class="ec-main-header" id="header">
          <nav class="navbar navbar-static-top navbar-expand-lg">
            <!-- Sidebar toggle button -->
            <button id="sidebar-toggler" class="sidebar-toggle"></button>
            <!-- search form -->
            <div class="search-form d-lg-inline-block">
              <div class="input-group">
                <input type="text" name="query" id="search-input" class="form-control" placeholder="search.." autofocus autocomplete="off" />
                <button type="button" name="search" id="search-btn" class="btn btn-flat">
                  <i class="mdi mdi-magnify"></i>
                </button>
              </div>
              <div id="search-results-container">
                <ul id="search-results"></ul>
              </div>
            </div>

            <!-- navbar right -->
            <div class="navbar-right">
              <ul class="nav navbar-nav">
                <li style="margin-right: 50px">
                  <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                    ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a
                  >
                </li>
              </ul>
            </div>
          </nav>
        </header>

        <div class="content">
          <h3>ddd</h3>
          <div class="card-body">
            <div class="table-responsive">
              <table id="responsive-data-table" class="table centered-table">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Birth-Date</th>
                    <th>Join On</th>
                    <th>Sus-Date</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <td>admin</td>
                    <td>admin@naver.com</td>
                    <td>010-0000-0000</td>
                    <td>2023-11-06</td>
                    <td>2023-11-06</td>
                    <td>2023-11-06</td>
                    <td>
                      <div class="btn-group mb-1">
                        <button type="button" class="btn btn-outline-success">Info</button>
                        <button
                          type="button"
                          class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                          data-display="static"
                        >
                          <span class="sr-only">Info</span>
                        </button>

                        <div class="dropdown-menu"><a class="dropdown-item" href="#">Edit</a> <a class="dropdown-item" href="#">Delete</a></div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- 검색 div-->
            <form action="/admin/search-user" id="search-frm">
              <div class="search-form d-lg-inline-block">
                <div class="input-group" style="margin-top: 20px">
                  <input
                    type="text"
                    name="search"
                    id="c-search-input"
                    class="form-control"
                    placeholder="search user"
                    autofocus=""
                    autocomplete="off"
                    style="border: 1px solid #ddd"
                  />
                  <button type="button" id="search-btnn" class="btn btn-flat" style="border: 1px solid #ddd">
                    <i class="mdi mdi-magnify"></i>
                  </button>
                </div>
              </div>
            </form>
            <!--페이징 div -->
            <div id="customPagenation">
              <!--시작 페이지 -->

              <!-- 엔드 페이지 -->

              <!-- 이전 버튼 -->

              <!-- 페이지 넘버 반복문 -->

              <p
                class="page-a"
                id="customPageA"
                style="
                  background-color: #3474d4;
                  color: white;
                  cursor: pointer;
                  display: inline-block;
                  border: 1px solid lightgrey;
                  padding: 4px 12px;
                  margin: 1px;
                  border-radius: 5px;
                "
              >
                1
              </p>

              <!-- 이후 버튼 -->
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="footer mt-auto">
        <div class="copyright bg-white">
          <p>
            Copyright &copy; <span id="ec-year"></span><a class="text-primary" href="https://themeforest.net/user/ashishmaraviya" target="_blank"> Gstock Admin Dashboard</a>. All
            Rights Reserved.
          </p>
        </div>
      </footer>
    </div>
    <!-- End Page Wrapper -->
    <!-- End Wrapper -->

    <!-- Common Javascript -->
    <script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/plugins/simplebar/simplebar.min.js"></script>
    <script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
    <script src="/resources/plugins/slick/slick.min.js"></script>

    <!-- Chart -->
    <script src="/resources/plugins/charts/Chart.min.js"></script>
    <script src="/resources/js/myportfolioChart.js"></script>

    <!-- Google map chart -->
    <script src="/resources/plugins/charts/google-map-loader.js"></script>
    <script src="/resources/plugins/charts/google-map.js"></script>

    <!-- Date Range Picker -->
    <script src="/resources/plugins/daterangepicker/moment.min.js"></script>
    <script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="/resources/js/date-range.js"></script>

    <!-- Option Switcher -->
    <script src="/resources/plugins/options-sidebar/optionswitcher.js"></script>

    <!-- Ekka Custom -->
    <script src="/resources/js/ekka.js"></script>

    <!-- My Custom -->
    <script src="/resources/js/portfolio.js"></script>
  </body>
</html>

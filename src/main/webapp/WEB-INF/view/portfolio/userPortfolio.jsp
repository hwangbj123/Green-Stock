<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Ekka - Admin Dashboard eCommerce HTML Template.">

<title>Ekka - Admin Dashboard eCommerce HTML Template.</title>

<!-- GOOGLE FONTS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet">
<link href="resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

<!-- Ekka CSS -->
<link id="ekka-css" href="resources/css/ekka.css" rel="stylesheet" />

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon" />
<style>
.ui-autocomplete {
	background-color: white; /* 배경색을 흰색으로 설정 */
	color: black; /* 텍스트 색상을 흰색으로 설정 */
}
</style>
</head>

<body
	class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light"
	id="body">

	<!--  WRAPPER  -->
	<div class="wrapper">

		<!--  PAGE WRAPPER -->
		<div style="width: 100%;">
			<!-- <div class="ec-page-wrapper"> -->
			<div style="width: 100%; margin: auto;">

				<!-- Header -->
				<%@ include file="/WEB-INF/view/layout/header.jsp"%>

				<!-- CONTENT WRAPPER -->
				<div class="ec-content-wrapper" style="width: 50%; margin: auto;">
					<div class="content">
						<!-- Top Statistics -->
						<div id="smallCardOuterWrapper" class="row"></div>

						<div class="row">
							<div class="col-xl-4 col-md-12 p-b-15">
								<div class="card card-default" style="height: 100%">
									<div class="card-header justify-content-center">
										<h2>Portfolio Info</h2>
									</div>
									<div id="portfolioInfo" class="card-body"></div>
									<div class="card-footer d-flex flex-wrap bg-white p-0"></div>
								</div>
							</div>
							<div class="col-xl-4 col-md-12 p-b-15">
								<!-- Doughnut Chart -->
								<div class="card card-default" style="height: 100%">
									<div class="card-header justify-content-center">
										<h2>Orders Overview</h2>
									</div>
									<div id="donutChartBody" class="card-body"></div>
								</div>
							</div>
							<div class="col-xl-4 col-md-12 p-b-15">
								<!-- Sales Graph -->
								<div id="user-acquisition" class="card card-default">
									<div class="card-header">
										<h2>Ranking</h2>
									</div>
									<div id="rankingBody" style="overflow: auto" class="card-body">
										<div class="tab-content" id="rankingWrapper"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 p-b-15">
								<!-- Recent Order Table -->
								<div
									class="card card-table-border-none card-default recent-orders"
									id="recent-orders">
									<div class="card-header justify-content-between">
										<h2>My Stock</h2>
										<span id="addStock"
											style="width: 5%; height: 100%; cursor: pointer"
											class="mdi mdi-clipboard-plus"></span>
									</div>
									<div class="card-body pt-0 pb-5">
										<table id="myStockCardTable"
											class="table card-table table-responsive table-responsive-large"
											style="width: 100%">

										</table>
									</div>
									<div id="stockCardFooter"
										class="card-footer d-flex flex-wrap bg-white p-20"></div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-12 p-b-15">
								<!-- trade log table -->
								<div
									class="card card-table-border-none card-default recent-orders"
									id="recent-orders">
									<div class="card-header justify-content-between">
										<h2>Trade log</h2>
									</div>
									<div class="card-body pt-0 pb-5" style="overflow : auto; height : 300px;">
										<table id="myTradeLogTable"
											class="table card-table table-responsive table-responsive-large"
											style="width: 100%">

										</table>
									</div>
									<div id="stockCardFooter"
										class="card-footer d-flex flex-wrap bg-white p-20"></div>
								</div>
							</div>
						</div>



						<div class="row">
							<div class="col-xl-12 col-md-12 p-b-15">
								<!-- User activity statistics -->
								<div class="card card-default" id="user-activity">
									<div class="no-gutters">
										<div>
											<div class="card-header justify-content-between">
												<h2>Monthly Asset</h2>
												<!-- <div class="date-range-report ">
												<span></span>
											</div> -->
											</div>
											<div class="card-body">
												<div class="tab-content" id="userActivityContent">
													<div id="assetBody" class="tab-pane fade show active"
														id="user" role="tabpanel"></div>
												</div>
											</div>
											<!-- <div class="card-footer d-flex flex-wrap bg-white border-top">
											<a href="#" class="text-uppercase py-3">In-Detail
												Overview</a>
										</div> -->
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="col-xl-4 col-md-12 p-b-15">
							<div class="card card-default">
								<div class="card-header flex-column align-items-start">
									<h2>Current Users</h2>
								</div>
								<div class="card-body">
									<canvas id="currentUser" class="chartjs"></canvas>
								</div>
								<div class="card-footer d-flex flex-wrap bg-white border-top">
									<a href="#" class="text-uppercase py-3">In-Detail Overview</a>
								</div>
							</div>
						</div> --%>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
			<!-- End Content Wrapper -->

			<!-- Footer -->
			<!-- <footer class="footer mt-auto">
			<div class="copyright bg-white">
				<p>
					Copyright &copy; <span id="ec-year"></span><a class="text-primary"
						href="https://themeforest.net/user/ashishmaraviya" target="_blank">
						Ekka Admin Dashboard</a>. All Rights Reserved.
				</p>
			</div>
		</footer> -->
		</div>
	</div>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

	<!-- End Page Wrapper -->
	<!-- End Wrapper -->

	<!-- Common Javascript -->
	<script src="resources/plugins/jquery/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/plugins/simplebar/simplebar.min.js"></script>
	<script src="resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
	<script src="resources/plugins/slick/slick.min.js"></script>

	<!-- Chart -->
	<script src="resources/plugins/charts/Chart.min.js"></script>
	<script src="resources/js/myportfolioChart.js"></script>

	<!-- Google map chart -->
	<script src="resources/plugins/charts/google-map-loader.js"></script>
	<script src="resources/plugins/charts/google-map.js"></script>

	<!-- Date Range Picker -->
	<script src="resources/plugins/daterangepicker/moment.min.js"></script>
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="resources/js/date-range.js"></script>

	<!-- Option Switcher -->
	<script src="resources/plugins/options-sidebar/optionswitcher.js"></script>

	<!-- Ekka Custom -->
	<script src="resources/js/ekka.js"></script>

	<!-- My Custom -->
	<script src="resources/js/portfolio.js"></script>
</body>

</html>
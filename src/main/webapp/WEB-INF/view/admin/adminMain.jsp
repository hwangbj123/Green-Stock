<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<!-- CONTENT WRAPPER -->
<div class="ec-content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-xl-8 col-md-12 p-b-15">
				<!-- 유저정보 -->
				<div id="user-acquisition" class="card card-default">
					<div class="card-header">
						<h2>User Info</h2>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="responsive-data-table" class="table centered-table">
								<thead>
									<tr>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대전화</th>
										<th>생년월일</th>
										<th>가입일</th>
										<th>정지기간</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="user" items="${userList}">
										<tr>
											<td>${user.userName}</td>
											<td>${user.email}</td>
											<td>${user.tel}</td>
											<td><fmt:formatDate value="${user.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.suspensionEndDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- End of 유저정보  -->

			<div class="col-xl-4 col-md-12 p-b-15">
				<!-- Doughnut Chart -->
				<div class="card card-default">
					<div class="card-header justify-content-center">
						<h2 style="font-weight: bold">일일 방문자수</h2>
					</div>
					<div class="card-body">
						<canvas id="dailyView"></canvas>
					</div>
					<div class="card-footer d-flex flex-wrap bg-white p-0"></div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-8 col-md-12 p-b-15">
				<!-- User activity statistics -->
				<div class="card card-default" id="user-activity">
					<div class="no-gutters">
						<div>
							<div class="card-header justify-content-between">
								<h2>Board List</h2>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="responsive-data-table" class="table centered-table">
										<thead>
											<tr>
												<th style="max-width: 50px;">id</th>
												<th style="max-width: 50px;">cate</th>
												<th style="min-width: 150px;">title</th>
												<th>user</th>
												<th>date</th>
												<th style="max-width: 50px;">views</th>
												<th style="max-width: 50px;">rec</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="board" items="${boardList}">
												<tr>
													<td>${board.id}</td>
													<td>${board.categoryId}</td>
													<td><a href="/board/detail?boardId=${board.id}">
															${board.title}</a></td>
													<td>${board.userName}</td>
													<td><fmt:formatDate value="${board.date}"
															pattern="MM-dd HH:mm:ss" /></td>
													<td>${board.views}</td>
													<td>${board.recommand}</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="7" style="text-align: center;"><a
													href="/board/list">게시판 더 보기</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 							<div class="card-body"> -->
							<!-- 								<div class="tab-content" id="userActivityContent"> -->
							<!-- 									<div class="tab-pane fade show active" id="user" -->
							<!-- 										role="tabpanel"> -->
							<!-- 										<canvas id="activity" class="chartjs"></canvas> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<!-- 							<div class="card-footer d-flex flex-wrap bg-white border-top"> -->
							<!-- 								<a href="#" class="text-uppercase py-3">In-Detail Overview</a> -->
							<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-md-12 p-b-15">
				<div class="card card-default">
					<div class="card-header flex-column align-items-start">
						<h2>Current Users</h2>
					</div>
					<div class="card-body">
						<canvas id="cSubscribe" class="chartjs"></canvas>
					</div>
					<div class="card-footer d-flex flex-wrap bg-white border-top">
						<a href="#" class="text-uppercase py-3">In-Detail Overview</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-8 col-12 p-b-15">
				<!-- World Chart -->
				<div class="card card-default" id="analytics-country">
					<div class="card-header justify-content-between">
						<h2>Purchased by Country</h2>
						<div class="date-range-report ">
							<span></span>
						</div>
					</div>
					<div class="card-body vector-map-world-2">
						<div id="regions_purchase" style="height: 100%; width: 100%;"></div>
					</div>
					<div class="border-top mt-3">
						<div class="row no-gutters">
							<div class="col-lg-6">
								<div class="world-data-chart border-bottom pt-15px pb-15px">
									<canvas id="hbar1" class="chartjs"></canvas>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="world-data-chart pt-15px pb-15px">
									<canvas id="hbar2" class="chartjs"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer d-flex flex-wrap bg-white">
						<a href="#" class="text-uppercase py-3">In-Detail Overview</a>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-12 p-b-15">
				<!-- Top Sell Table -->
				<div class="card card-default Sold-card-table">
					<div class="card-header justify-content-between">
						<h2>Sold by Items</h2>
						<div class="tools">
							<button class="text-black-50 mr-2 font-size-20">
								<i class="mdi mdi-cached"></i>
							</button>
							<div class="dropdown show d-inline-block widget-dropdown">
								<a class="dropdown-toggle icon-burger-mini" href="#"
									role="button" id="dropdown-units" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									data-display="static"></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class="dropdown-item"><a href="#">Action</a></li>
									<li class="dropdown-item"><a href="#">Another action</a></li>
									<li class="dropdown-item"><a href="#">Something else
											here</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body py-0 compact-units" data-simplebar
						style="height: 534px;">
						<table class="table ">
							<tbody>
								<tr>
									<td class="text-dark">Backpack</td>
									<td class="text-center">9</td>
									<td class="text-right">33% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">T-Shirt</td>
									<td class="text-center">6</td>
									<td class="text-right">150% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Coat</td>
									<td class="text-center">3</td>
									<td class="text-right">50% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Necklace</td>
									<td class="text-center">7</td>
									<td class="text-right">150% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Jeans Pant</td>
									<td class="text-center">10</td>
									<td class="text-right">300% <i
										class="mdi mdi-arrow-down-bold text-danger pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Shoes</td>
									<td class="text-center">5</td>
									<td class="text-right">100% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">T-Shirt</td>
									<td class="text-center">6</td>
									<td class="text-right">150% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Watches</td>
									<td class="text-center">18</td>
									<td class="text-right">160% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">Inner</td>
									<td class="text-center">156</td>
									<td class="text-right">120% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
								<tr>
									<td class="text-dark">T-Shirt</td>
									<td class="text-center">6</td>
									<td class="text-right">150% <i
										class="mdi mdi-arrow-up-bold text-success pl-1 font-size-12"></i>
									</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="card-footer d-flex flex-wrap bg-white">
						<a href="#" class="text-uppercase py-3">View Report</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12 p-b-15">
				<!-- Recent Order Table -->
				<div class="card card-table-border-none card-default recent-orders"
					id="recent-orders">
					<div class="card-header justify-content-between">
						<h2>Recent Orders</h2>
						<div class="date-range-report">
							<span></span>
						</div>
					</div>
					<div class="card-body pt-0 pb-5">
						<table
							class="table card-table table-responsive table-responsive-large"
							style="width: 100%">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Product Name</th>
									<th class="d-none d-lg-table-cell">Units</th>
									<th class="d-none d-lg-table-cell">Order Date</th>
									<th class="d-none d-lg-table-cell">Order Cost</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>24541</td>
									<td><a class="text-dark" href=""> Coach Swagger</a></td>
									<td class="d-none d-lg-table-cell">1 Unit</td>
									<td class="d-none d-lg-table-cell">Oct 20, 2018</td>
									<td class="d-none d-lg-table-cell">$230</td>
									<td><span class="badge badge-success">Completed</span></td>
									<td class="text-right">
										<div class="dropdown show d-inline-block widget-dropdown">
											<a class="dropdown-toggle icon-burger-mini" href=""
												role="button" id="dropdown-recent-order1"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" data-display="static"></a>
											<ul class="dropdown-menu dropdown-menu-right">
												<li class="dropdown-item"><a href="#">View</a></li>
												<li class="dropdown-item"><a href="#">Remove</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>24541</td>
									<td><a class="text-dark" href=""> Toddler Shoes, Gucci
											Watch</a></td>
									<td class="d-none d-lg-table-cell">2 Units</td>
									<td class="d-none d-lg-table-cell">Nov 15, 2018</td>
									<td class="d-none d-lg-table-cell">$550</td>
									<td><span class="badge badge-primary">Delayed</span></td>
									<td class="text-right">
										<div class="dropdown show d-inline-block widget-dropdown">
											<a class="dropdown-toggle icon-burger-mini" href="#"
												role="button" id="dropdown-recent-order2"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" data-display="static"></a>
											<ul class="dropdown-menu dropdown-menu-right">
												<li class="dropdown-item"><a href="#">View</a></li>
												<li class="dropdown-item"><a href="#">Remove</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>24541</td>
									<td><a class="text-dark" href=""> Hat Black Suits</a></td>
									<td class="d-none d-lg-table-cell">1 Unit</td>
									<td class="d-none d-lg-table-cell">Nov 18, 2018</td>
									<td class="d-none d-lg-table-cell">$325</td>
									<td><span class="badge badge-warning">On Hold</span></td>
									<td class="text-right">
										<div class="dropdown show d-inline-block widget-dropdown">
											<a class="dropdown-toggle icon-burger-mini" href="#"
												role="button" id="dropdown-recent-order3"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" data-display="static"></a>
											<ul class="dropdown-menu dropdown-menu-right">
												<li class="dropdown-item"><a href="#">View</a></li>
												<li class="dropdown-item"><a href="#">Remove</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>24541</td>
									<td><a class="text-dark" href=""> Backpack Gents,
											Swimming Cap Slin</a></td>
									<td class="d-none d-lg-table-cell">5 Units</td>
									<td class="d-none d-lg-table-cell">Dec 13, 2018</td>
									<td class="d-none d-lg-table-cell">$200</td>
									<td><span class="badge badge-success">Completed</span></td>
									<td class="text-right">
										<div class="dropdown show d-inline-block widget-dropdown">
											<a class="dropdown-toggle icon-burger-mini" href="#"
												role="button" id="dropdown-recent-order4"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" data-display="static"></a>
											<ul class="dropdown-menu dropdown-menu-right">
												<li class="dropdown-item"><a href="#">View</a></li>
												<li class="dropdown-item"><a href="#">Remove</a></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td>24541</td>
									<td><a class="text-dark" href=""> Speed 500 Ignite</a></td>
									<td class="d-none d-lg-table-cell">1 Unit</td>
									<td class="d-none d-lg-table-cell">Dec 23, 2018</td>
									<td class="d-none d-lg-table-cell">$150</td>
									<td><span class="badge badge-danger">Cancelled</span></td>
									<td class="text-right">
										<div class="dropdown show d-inline-block widget-dropdown">
											<a class="dropdown-toggle icon-burger-mini" href="#"
												role="button" id="dropdown-recent-order5"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" data-display="static"></a>
											<ul class="dropdown-menu dropdown-menu-right">
												<li class="dropdown-item"><a href="#">View</a></li>
												<li class="dropdown-item"><a href="#">Remove</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-5">
				<!-- New Customers -->
				<div class="card ec-cust-card card-table-border-none card-default">
					<div class="card-header justify-content-between ">
						<h2>New Customers</h2>
						<div>
							<button class="text-black-50 mr-2 font-size-20">
								<i class="mdi mdi-cached"></i>
							</button>
							<div class="dropdown show d-inline-block widget-dropdown">
								<a class="dropdown-toggle icon-burger-mini" href="#"
									role="button" id="dropdown-customar" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									data-display="static"> </a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class="dropdown-item"><a href="#">Action</a></li>
									<li class="dropdown-item"><a href="#">Another action</a></li>
									<li class="dropdown-item"><a href="#">Something else
											here</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body pt-0 pb-15px">
						<table class="table ">
							<tbody>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u1.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Selena
														Wagner</h6>
												</a> <small>@selena.oi</small>
											</div>
										</div>
									</td>
									<td>2 Orders</td>
									<td class="text-dark d-none d-md-block">$150</td>
								</tr>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u2.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Walter
														Reuter</h6>
												</a> <small>@walter.me</small>
											</div>
										</div>
									</td>
									<td>5 Orders</td>
									<td class="text-dark d-none d-md-block">$200</td>
								</tr>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u3.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Larissa
														Gebhardt</h6>
												</a> <small>@larissa.gb</small>
											</div>
										</div>
									</td>
									<td>1 Order</td>
									<td class="text-dark d-none d-md-block">$50</td>
								</tr>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u4.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Albrecht
														Straub</h6>
												</a> <small>@albrech.as</small>
											</div>
										</div>
									</td>
									<td>2 Orders</td>
									<td class="text-dark d-none d-md-block">$100</td>
								</tr>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u5.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Leopold
														Ebert</h6>
												</a> <small>@leopold.et</small>
											</div>
										</div>
									</td>
									<td>1 Order</td>
									<td class="text-dark d-none d-md-block">$60</td>
								</tr>
								<tr>
									<td>
										<div class="media">
											<div class="media-image mr-3 rounded-circle">
												<a href="profile.html"><img
													class="profile-img rounded-circle w-45"
													src="assets/img/user/u3.jpg" alt="customer image"></a>
											</div>
											<div class="media-body align-self-center">
												<a href="profile.html">
													<h6 class="mt-0 text-dark font-weight-medium">Larissa
														Gebhardt</h6>
												</a> <small>@larissa.gb</small>
											</div>
										</div>
									</td>
									<td>1 Order</td>
									<td class="text-dark d-none d-md-block">$50</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-xl-7">
				<!-- Top Products -->
				<div class="card card-default ec-card-top-prod">
					<div class="card-header justify-content-between">
						<h2>Top Products</h2>
						<div>
							<button class="text-black-50 mr-2 font-size-20">
								<i class="mdi mdi-cached"></i>
							</button>
							<div class="dropdown show d-inline-block widget-dropdown">
								<a class="dropdown-toggle icon-burger-mini" href="#"
									role="button" id="dropdown-product" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									data-display="static"> </a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class="dropdown-item"><a href="#">Update Data</a></li>
									<li class="dropdown-item"><a href="#">Detailed Log</a></li>
									<li class="dropdown-item"><a href="#">Statistics</a></li>
									<li class="dropdown-item"><a href="#">Clear Data</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body mt-10px mb-10px py-0">
						<div class="row media d-flex pt-15px pb-15px">
							<div
								class="col-lg-3 col-md-3 col-2 media-image align-self-center rounded">
								<a href="#"><img src="assets/img/products/p1.jpg"
									alt="customer image"></a>
							</div>
							<div
								class="col-lg-9 col-md-9 col-10 media-body align-self-center ec-pos">
								<a href="#">
									<h6 class="mb-10px text-dark font-weight-medium">Baby
										cotton shoes</h6>
								</a>
								<p class="float-md-right sale">
									<span class="mr-2">58</span>Sales
								</p>
								<p class="d-none d-md-block">Statement belting with
									double-turnlock hardware adds “swagger” to a simple.</p>
								<p class="mb-0 ec-price">
									<span class="text-dark">$520</span>
									<del>$580</del>
								</p>
							</div>
						</div>
						<div class="row media d-flex pt-15px pb-15px">
							<div
								class="col-lg-3 col-md-3 col-2 media-image align-self-center rounded">
								<a href="#"><img src="assets/img/products/p2.jpg"
									alt="customer image"></a>
							</div>
							<div
								class="col-lg-9 col-md-9 col-10 media-body align-self-center ec-pos">
								<a href="#">
									<h6 class="mb-10px text-dark font-weight-medium">Hoodies
										for men</h6>
								</a>
								<p class="float-md-right sale">
									<span class="mr-2">20</span>Sales
								</p>
								<p class="d-none d-md-block">Statement belting with
									double-turnlock hardware adds “swagger” to a simple.</p>
								<p class="mb-0 ec-price">
									<span class="text-dark">$250</span>
									<del>$300</del>
								</p>
							</div>
						</div>
						<div class="row media d-flex pt-15px pb-15px">
							<div
								class="col-lg-3 col-md-3 col-2 media-image align-self-center rounded">
								<a href="#"><img src="assets/img/products/p3.jpg"
									alt="customer image"></a>
							</div>
							<div
								class="col-lg-9 col-md-9 col-10 media-body align-self-center ec-pos">
								<a href="#">
									<h6 class="mb-10px text-dark font-weight-medium">Long
										slive t-shirt</h6>
								</a>
								<p class="float-md-right sale">
									<span class="mr-2">10</span>Sales
								</p>
								<p class="d-none d-md-block">Statement belting with
									double-turnlock hardware adds “swagger” to a simple.</p>
								<p class="mb-0 ec-price">
									<span class="text-dark">$480</span>
									<del>$654</del>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>
<script>

var cUser = document.getElementById("cSubscribe");
if (cUser !== null) {
  var myUChart = new Chart(cUser, {
    type: "bar",
    data: {
      labels: [
        "1h",
        "10 m",
        "50 m",
        "30 m",
        "40 m",
        "20 m",
        "30 m",
        "25 m",
        "20 m",
        "5 m",
        "10 m"
      ],
      datasets: [
        {
          label: "signup",
          data: [15, 30, 27, 43, 39, 18, 42, 25, 13, 18, 59],
          backgroundColor: "#88aaf3"
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              drawBorder: true,
              display: false,
            },
            ticks: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: false, // hide main x-axis line
              beginAtZero: true,
              callback: function(tick, index, array) {
                return index % 2 ? "" : tick;
              }
            },
            barPercentage: 1.8,
            categoryPercentage: 0.2
          }
        ],
        yAxes: [
          {
            gridLines: {
              drawBorder: true,
              display: true,
              color: "#eee",
              zeroLineColor: "#eee"
            },
            ticks: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: true,
              beginAtZero: true
            }
          }
        ]
      },

      tooltips: {
        mode: "index",
        titleFontColor: "#888",
        bodyFontColor: "#555",
        titleFontSize: 12,
        bodyFontSize: 15,
        backgroundColor: "rgba(256,256,256,0.95)",
        displayColors: true,
        xPadding: 10,
        yPadding: 7,
        borderColor: "rgba(220, 220, 220, 0.9)",
        borderWidth: 2,
        caretSize: 6,
        caretPadding: 5
      }
    }
  });
}

console.log("여기1111111111111111111");
var dailyView = document.getElementById("dailyView");
if (dailyView !== null) {
  var dailyViewData = [
    {
      first: [0, 65, 52, 115, 98, 165, 125],
      second: [45, 38, 100, 87, 152, 187, 85]
    },
    {
      first: [0, 65, 77, 33, 49, 100, 100],
      second: [88, 33, 20, 44, 111, 140, 77]
    },
    {
      first: [0, 40, 77, 55, 33, 116, 50],
      second: [55, 32, 20, 55, 111, 134, 66]
    },
    {
      first: [0, 44, 22, 77, 33, 151, 99],
      second: [60, 32, 120, 55, 19, 134, 88]
    }
  ];

  var config = {
    // The type of chart we want to create
    type: "line",
    // The data for our dataset
    data: {
      labels: [
        "4 Jan",
        "5 Jan",
        "6 Jan",
        "7 Jan",
        "8 Jan",
        "9 Jan",
        "10 Jan"
      ],
      datasets: [
        {
          label: "dailyView",
          backgroundColor: "transparent",
          borderColor: "rgba(82, 136, 255, .8)",
          data: dailyViewData[0].first,
          lineTension: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255,255,255,1)",
          pointHoverBackgroundColor: "rgba(255,255,255,1)",
          pointBorderWidth: 2,
          pointHoverRadius: 7,
          pointHoverBorderWidth: 1
        },
    // Configuration options go here
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              display: false,
            },
            ticks: {
              fontColor: "#8a909d", // this here
            },
          }
        ],
        yAxes: [
          {
            gridLines: {
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif",
              display: true,
              color: "#eee",
              zeroLineColor: "#eee"
            },
            ticks: {
              // callback: function(tick, index, array) {
              //   return (index % 2) ? "" : tick;
              // }
              stepSize: 50,
              fontColor: "#8a909d",
              fontFamily: "Roboto, sans-serif"
            }
          }
        ]
      },
      tooltips: {
        mode: "index",
        intersect: false,
        titleFontColor: "#888",
        bodyFontColor: "#555",
        titleFontSize: 12,
        bodyFontSize: 15,
        backgroundColor: "rgba(256,256,256,0.95)",
        displayColors: true,
        xPadding: 10,
        yPadding: 7,
        borderColor: "rgba(220, 220, 220, 0.9)",
        borderWidth: 2,
        caretSize: 6,
        caretPadding: 5
      }
    }
  };

  var ctx = document.getElementById("dailyView").getContext("2d");
  var myLine = new Chart(ctx, config);
  var items = document.querySelectorAll("#user-activity .nav-tabs .nav-item");
  items.forEach(function(item, index){
    item.addEventListener("click", function() {
      config.data.datasets[0].data = activityData[index].first;
      config.data.datasets[1].data = activityData[index].second;
      myLine.update();
    });
  });
}
</script>
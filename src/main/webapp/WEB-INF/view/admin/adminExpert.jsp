<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>

<style>
.centered-table td, .centered-table th {
	vertical-align: middle;
}

#customPageA {
	display: inline-block;
	border: 1px solid lightgrey;
	padding: 4px 12px;
	margin: 1px;
	border-radius: 5px;
}

#customPagenation {
	width: 100%;
	margin: auto;
	text-align: center;
	margin-top: 0px;
	display: flex;
	justify-content: center;
}
</style>
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h2>전문가 신청 목록</h2>
				<p class="breadcrumbs">
					<span><a href="index.html">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>Expert
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="ec-vendor-list card card-default">
					<div class="card-body">
						<div class="table-responsive">
							<table id="responsive-data-table" class="table centered-table">
								<thead>
									<tr>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대폰</th>
										<th>생일</th>
										<th>가입일</th>
										<th>신청일</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="expert" items="${expertList}">
										<tr id="tr_${expert.id}">
											<td>${expert.advisorFullName}</td>
											<td>${expert.email}</td>
											<td>${expert.tel}</td>
											<td><fmt:formatDate value="${expert.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.createdAt}"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<div class="btn-group mb-1">
													<div>
														<button onclick="infoClicked(`${expert}`)"
															data-bs-toggle="modal" data-bs-target="#modalContact"
															class="btn btn-outline-success view-detail" type="button">Info</button>
														<button onclick="approveClicked(`${expert.advisorId}`,`${expert.email}`)"
															class="btn btn-success">승인</button>
														<button class="btn btn-danger" data-bs-toggle="modal"
															data-bs-target="#modal-refuse-contact"
															onclick="refuseClicked(`${expert.advisorId}`,`${expert.email}`)">반려</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									<c:forEach var="expert" items="${refusedList}">
										<tr id="tr_${expert.id}">
											<td>${expert.advisorFullName}</td>
											<td>${expert.email}</td>
											<td>${expert.tel}</td>
											<td><fmt:formatDate value="${expert.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.createdAt}"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<div class="btn-group mb-1">
													<div>
														<button onclick="infoClicked(`${expert}`)"
															data-bs-toggle="modal" data-bs-target="#modalContact"
															class="btn btn-outline-success view-detail" type="button">Info</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 검색 div-->
						<form action="/admin/search-user" id="search-frm">
							<div class="search-form d-lg-inline-block">
								<div class="input-group" style="margin-top: 20px;">
									<input type="text" name="search" id="c-search-input"
										class="form-control" placeholder="search user" autofocus
										autocomplete="off" style="border: 1px solid #ddd;" />
									<button type="button" id="search-btnn" class="btn btn-flat"
										style="border: 1px solid #ddd;">
										<i class="mdi mdi-magnify"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modal-refuse-contact" id="modal-refuse-contact"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div style="border: none;">
					<div style="border: none;" class="modal-header px-4">
						<input id="refuseMsg" style="border: none; heigth: 70%; width: 80%;" type="text"
							placeholder="반려메시지 작성"><button onclick="modalConfirmClicked()" class="btn btn-primary">확인</button> 
							<input id="hidden_email"
							type="hidden"> <input id="hidden_advisorId" type="hidden">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<div class="modal fade modal-contact-detail" id="modalContact"
	tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header justify-content-end border-bottom-0">
				<button type="button" class="btn-edit-icon">
					<!-- data-bs-dismiss="modal"
										aria-label="Close"  modal close-->
				</button>
				<button id="closeButton" type="button" class="btn-close-icon"
					data-bs-dismiss="modal">
					<i class="mdi mdi-close"></i>
				</button>
			</div>
			<div class="modal-body pt-0">
				<div class="row no-gutters">
					<div class="col-md-6">
						<div class="profile-content-left px-4">
							<div class="text-center widget-profile px-0 border-0">
								<div style="width: 300px; height: 300px;"
									class="card-img mx-auto rounded-circle">
									<img id="modal-image" src="assets/img/user/u6.jpg"
										alt="user image" />
								</div>
								<div class="card-body">
									<h3 id="modal-username">John Devilo</h3>
								</div>
							</div>

							<div class="d-flex justify-content-between">
								<div style="width: 33%;">
									<h6 style="text-align: center;" class="text-dark pb-2">전문분야</h6>
									<div id="modal-speciality"
										style="word-wrap: break-word; text-align: center;">해외주식</div>
								</div>

								<div style="width: 33%;">
									<h6 style="text-align: center;" class="text-dark pb-2">이메일</h6>
									<div id="modal-email" style="word-wrap: break-word;">johnexample@gmail.com</div>
								</div>

								<div style="width: 33%;">
									<div id="phoneWrap" style="text-align: center;">
										<h6 class="text-dark pb-2">휴대폰</h6>
									</div>
									<div id="modal-phone" style="word-wrap: break-word;">010-1010-1010</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div id="modal-portfolio-info" class="contact-info px-4">
							<h3 class="text-dark mb-1">전문가 상세</h3>
							<h4 style="font-weight: bold"
								class="text-dark font-weight-medium pt-4 mb-2">이력</h4>
							<h5 id="modal-career">어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고</h5>
							<h4 style="font-weight: bold"
								class="text-dark font-weight-medium pt-4 mb-2">자기소개</h4>
							<h5 id="modal-introduction">portfolio for Test</h5>
							<!-- <button class = "btn btn-primary btn-pill my-4">저장</button>
												<button class = "btn btn-primary btn-pill my-4">삭제</button> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>

<!-- custom Js -->
<script src="/resources/js/custom/adminExpert.js"></script>
<!-- <script src="/resources/js/custom/adminUser.js"></script> -->
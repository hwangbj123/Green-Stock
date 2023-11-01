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
	margin-top: 50px;
	display: flex;
	justify-content: center;
}
</style>
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>User List</h1>
				<p class="breadcrumbs">
					<span><a href="index.html">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>User
				</p>
			</div>
			<div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addUser">Suspended User</button>
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
										<th>Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Birth-Date</th>
										<th>Join On</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="user" items="${userList}">
										<tr>
											<td>${user.userName}</td>
											<td>${user.email}</td>
											<td>${user.tel}</td>
											<td>${user.birthDate}</td>
											<td><fmt:formatDate value="${user.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>-</td>
											<td>
												<div class="btn-group mb-1">
													<button type="button" class="btn btn-outline-success">Info</button>
													<button type="button"
														class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
														data-bs-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false" data-display="static">
														<span class="sr-only">Info</span>
													</button>

													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Edit</a> <a
															class="dropdown-item" href="#">Delete</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!----------페이징 div -->
						<div id="customPagenation">
							<!-- 	    		시작 페이지 -->
							<c:choose>
								<c:when test="${page.paging.page>4}">
									<c:set var="startPage" value="${page.paging.page-4}" />
								</c:when>
								<c:otherwise>
									<c:set var="startPage" value="1" />
								</c:otherwise>
							</c:choose>

							<!-- 				엔드 페이지	    		 -->
							<c:choose>
								<c:when test="${page.endPage < page.paging.page+4}">
									<c:set var="endPage" value="${page.endPage}" />
								</c:when>
								<c:otherwise>
									<c:set var="endPage" value="${page.paging.page+4}" />
								</c:otherwise>
							</c:choose>

							<!-- 	    		이전 버튼 -->
							<c:if test="${startPage ne 1}">
								<a class="page-a" style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
									href="user?page=${page.paging.page-5}"> prev </a>
							</c:if>
							<!-- 	    		페이지 넘버 반복문 -->
							<c:set var="nowPage" value="${startPage}" />
							<c:forEach begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${page.paging.page eq nowPage}">
										<p class="page-a" id="customPageA"
											style="background-color: #3474D4; color: white; cursor: pointer; display: inline-block; border: 1px solid lightgrey; padding: 4px 12px;	margin: 1px; border-radius: 5px;">
											<c:out value="${nowPage}" />
										</p>
									</c:when>
									<c:otherwise>
										<a class="page-a" id="customPageA" href="user?page=${nowPage}" style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"> <c:out
												value="${nowPage}" />
										</a>
									</c:otherwise>
								</c:choose>
								<c:set var="nowPage" value="${nowPage+1}" />
							</c:forEach>
							<!-- 	    		이후 버튼 -->
							<c:if test="${page.endPage > startPage+9}">
								<c:choose>
									<c:when test="${page.endPage > page.paging.page+5}">
										<a class="page-a" style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;" href="user?page=${page.paging.page+5}">
											next </a>
									</c:when>
									<c:otherwise>
										<a class="page-a" style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;" href="user?page=${page.endPage}"> next </a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="modal fade modal-add-contact" id="addUser" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<form action="/admin/suspended" method="post">
					<div class="modal-header px-4">
						<h5 class="modal-title" id="exampleModalCenterTitle">Account
							suspension</h5>
					</div>

					<div class="modal-body px-4">
						<div class="row mb-2">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="firstName">유저이름</label> <input type="text"
										class="form-control" id="suspensionDate" name="userName"
										placeholder="username">
								</div>
								<div class="form-group">
									<label for="firstName">정지기간</label> <input type="number"
										class="form-control" id="suspensionDate" name="suspendDate"
										placeholder="ex : 30(단위 일)">
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer px-4">
						<button type="button" class="btn btn-secondary btn-pill"
							data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary btn-pill">정지하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>
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

.board-tb{
	width: 100%;
	min-height: 500px;
	text-align: center;
	margin: 20px auto;
}
.board-tb tr:first-child{
	background-color: #f7f7f7; 
	height: 50px; 
	border-bottom: 1px solid lightgrey;
}
.input-group select{
	border: 1px solid #ddd;
}
.input-group select:first-child{
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
}
.delete-btn{
	width: 100%; 
/* 	background-color: rgba(226,24,17,0.7); */
	border: 1px solid rgba(226,24,17,0.7); 
	border-radius: 5px; 
	color: rgba(226,24,17,0.7);

	
}
</style> 
<html>
<body>
<div class="ec-content-wrapper"></div>
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>Notice List</h1>
				<p class="breadcrumbs">
					<span><a href="/admin/main">Main</a></span>
					<i class="mdi mdi-chevron-right"></i>Notice 
					</p>
			</div>
		</div>
				<!-- 검색페이지 시작 -->
				<div class="container">
					<div class="row">					
						<form method="post" name="notice-search" action="">		
						<div class="font-size">
							<p class="breadcrumbs"></p>
								<i class="mdi mdi-chevron-right"></i></div>
								
								
									
							<h2 style="width: 100%; text-align: center;">공지사항</h2>
							<div class="search-container" style="
							text-align: center;
							margin: 0 auto;							
							height: 100px;
							width: 600px;
							display: flex;
							justify-content: center;
							align-items: center;">						
							    <select class="custom-select" style="margin: 19px;height: 40px;width: 150px;">
							    <option value="" disabled="" selected="">선택</option>
							    <option value="searchTitle">제목</option>
							    <option value="writer">작성자</option>
								</select>
							    												 
							    <input type="text" class="form-control" placeholder="검색어 입력" name="searchText" maxlength="100" style="margin-right: 10px;">
							    <button type="submit" class="btn btn-success" style="
							    text-align: center;
							    width: 100px;
							    height: 42px;">검색</button>
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
													aria-label="Name: activate to sort column ascending"
													style="text-align: center;">제목</th>
												<th class="notice-userId" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Offer: activate to sort column ascending"style="text-align: center;">작성자</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending"style="text-align: center;">공개/비공개</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending"style="text-align: center;">작성일</th>
												<th class="noticeCount" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Stock: activate to sort column ascending"
													style="width: 100px; text-align: center;">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${noticeList}" var="notice">
												<tr class="Noticeboard-list">
													<!-- <img class="tbl-thumb"></td> -->
													<td>${notice.id}</td>
													<td style="text-align: center;">
													<a href="/notice/admin/view/${notice.id}" >
													${notice.noticeTitle}</a>
													</td>
													<td style="text-align: center;">${notice.userId}</td>
													<td style="text-align: center;">1</td>
													<td style="text-align: center;">${notice.noticeUpdated}</td>
													<td style="text-align: center;">${notice.hitCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>																	
									<div class="write" style="text-align: right">	
										<a href="/notice/admin/write" class="btn btn-primary"
											style="display: inline-block; vertical-align: inherit; text-align: center; font-weight: bold; color: white;">작성하기</a>																																																																																																
												<!-- 페이징 영역 -->										
											<div class="ec-pro-pagination">
					                            <span>Showing ${pagination.start}-${pagination.end} 전채 ${pagination.totalCount} 개</span>
					                            <ul class="ec-pro-pagination-inner">
					                                <c:if test="${pagination.prevPageGroup}">
					                                	<li>
					                                	<a class="next" href="/notice/admin/list?page=${pagination.currentPage -1}">Prev <i class="ecicon eci-angle-left"></i></a>
					                                	</li>
					                               	</c:if>
					                            
					                            	<c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
					                                <li>
					                                <a class="${num eq pagination.currentPage ? 'active' : ''}" href="/notice/admin/list?page=${num}">${num}</a>
					                                </li>
					                                </c:forEach>
					                                <c:if test="${pagination.nextPageGroup}">
					                                	<li><a class="next" href="/notice/admin/list?page=${pagination.currentPage + 1}">Next <i class="ecicon eci-angle-right"></i></a></li>
					                               	</c:if>
					                            </ul>
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
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>
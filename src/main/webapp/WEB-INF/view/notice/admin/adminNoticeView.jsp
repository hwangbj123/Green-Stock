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
        <!-- Header responsive Bottom  End -->        
        <!-- Ec Main Menu End -->	
	<div class="content container" style="width : 50%;">
		<div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">					
			
			<div>
				<p class="breadcrumbs">										
					<i class="mdi mdi-chevron-right">
					</i>
					<h2 style="width: 900px; text-align: center;">상세보기</h2>
					<div class="search-container" >					
				</div>					
			</div>			
		</div>
			<div class="row">
			<div class="col-12">
				<div class="card card-default" style="width: 900px">					
					<div class="card-body" style="width:900px" >
						<h4>제목 :${view.noticeTitle}</h4> 
						<p>작성자 :${view.userId}</p>  
						<p style="">${view.noticeCreated}</p>						
						<p>${view.hitCount}</p>					
						<p><textarea readonly="readonly" style ="width: 852px; height: 23em; border: none; resize: none">${view.noticeContent}</textarea></p>
						<table class="table-responsive">
						    <tr>
					      	<td><a href = "/notice/admin/update/${view.id}" class="btn btn-primary" style="margin :5px">수정하기</a></td>
					      	<td><a href = "/notice/admin/delete/${view.id}" class="btn btn-primary" style="margin :5px">삭제하기</a></td>
					          <td><a href = "/notice/admin/list" class="btn btn-primary" style="margin :5px">목록으로</a></td>
					      	</tr>							  
						</table>														 							   			
						</div>
					</div>
				</div>
			</div>	
		</div>		
</html>
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>
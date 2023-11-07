<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<div class="container d-flex align-items-center justify-content-center card-body" style="height:80vh;">
	<div id="user-acquisition" class="card card-default d-flex align-items-center justify-content-center" style="width: 35%; padding: 40px;">
		<div class="card-header bg-white" style="margin-bottom: 40px;">
			<h2 class="text-dark">결제 완료</h2>
		</div>
		<div class="card-body">
			<p>결제 번호 : ${payInfo.tid}</p>
			<p>결제 상품 : ${payInfo.item_name}</p>
			<p>결제 총액 : ${payInfo.amount.total}</p>
			<p>결제 승인 시각 : ${payInfo.approved_at}</p>
		</div>
		
		<div>
			<a class="btn btn-primary" style="margin-top:30px;">돌아가기</a>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
<!-- Javascript -->
<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
<script src="/resources/plugins/slick/slick.min.js"></script>

<!-- Ekka Custom -->
<script src="/resources/js/ekka.js"></script>

</body>
</html>
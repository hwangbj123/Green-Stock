<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
	<h1>카카오 페이지 결제 완료</h1>
	<p>${payInfo.approved_at}</p>
	<p>${payInfo.partner_order_id}</p>
	<p>${payInfo.item_name}</p>
	<p>${payInfo.amount.total}</p>
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
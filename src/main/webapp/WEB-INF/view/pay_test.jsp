<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="Ekka - Admin Dashboard HTML Template.">

		<title>Green Stock</title>
		
		<!-- GOOGLE FONTS -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

		<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
		
		<!-- Ekka CSS -->
		<link id="ekka-css" rel="stylesheet" href="/resources/css/ekka.css" />
		
		<!-- FAVICON -->
		<link href="/resources/img/favicon.png" rel="shortcut icon" />
	</head>
	
	<body class="sign-inup" id="body">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
		<!-- start of main  -->
		<div class="container d-flex align-items-center justify-content-center form-height pt-24px pb-24px">
		    <div class="row justify-content-center">
		      <div class="col-lg-4 col-md-10">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5">
		            <h4 class="text-dark mb-5">결제정보</h4>
		
		            <form action="/pay/kakao" method="post" class="signUpForm" id="form-payment">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4">
		                  	<input type="text" class="form-control" id="userName" placeholder="실명" name="userName" value="${principal.userName}">
		                </div>

				        <div class="input-group">
			                <input type="text" class="form-control" id="email" placeholder="Email" name="email" value="${principal.email}">
			                <input type="hidden" class="form-control" id="pEmail" placeholder="Email" value="${principal.email}">
		                </div>
<!-- 				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="email" placeholder="Email" name="email">
		                </div> -->
		                		
				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="tel" placeholder="Phone" name="tel" value="${principal.tel}">
		                </div>
		                
		                <div class="col-md-12 row">
		                  <button type="button" class="btn btn-primary btn-block mb-4 bg-primary" id="btn-kakao-pay" style="margin-left: 40px;">구독하기</button>
		                </div>
		              </div>
		              <input type="hidden" class="form-control" id="userId" name="id" value="${principal.id}">
		            </form>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		<!-- end of main  -->
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		<!-- Javascript -->
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
		
		<script>
 		// 카카오결제
		$(function(){
			$("#btn-kakao-pay").click(function(){
				
				// 필수입력값을 확인.
				var name = $("#form-payment input[name='userName']").val();
				var tel = $("#form-payment input[name='tel']").val();
				var email = $("#form-payment input[name='email']").val();
				
/* 				if(name == ""){
					$("#form-payment input[name='pay-name']").focus()
				}
				if(tel == ""){
					$("#form-payment input[name='pay-tel']").focus()
				}
				if(email == ""){
					$("#form-payment input[name='pay-email']").focus()
				} */
				
				// 결제 정보를 form에 저장한다.
				let totalPayPrice = parseInt($("#total-pay-price").text().replace(/,/g,''))
				let totalPrice = parseInt($("#total-price").text().replace(/,/g,''))
				
				// 카카오페이 결제전송
				$.ajax({
					type:'post'
					,url:'/pay/kakao'
					,data:{
						name: name
						,tel:tel
						,email:email
					},
					success:function(response){
						let Url = response;
						console.log(Url);
						location.href = Url;
					}
				})
			})
		})
		</script>
	</body>
</html>
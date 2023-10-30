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
		<!-- 아이디찾기  -->
		<div class="container d-flex align-items-center justify-content-center form-height pt-24px pb-24px">
		    <div class="row justify-content-center col-md-6">
		      <div class="col-md-10" style="height:446px;">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/logo/logo-login.png" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5" style="height:365px;">
		            <h4 class="text-dark mb-5">아이디 찾기</h4>
		
		            <form action="/user/find-id" method="post" class="signUpForm" style="margin-top: 50px;">
		              <div class="row">
				        <div class="form-group col-md-12 mb-4">
				            <input type="text" class="form-control" id="IdEmail" placeholder="Email" name="email">
		                </div>
		                
		                <div class="col-md-12" style="margin-top: 40px;">
		                  <button type="button" class="btn btn-primary btn-block mb-4 bg-primary" id="findIdBtn">아이디 찾기</button>
		                </div>
		              </div>
		            </form>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- 비밀번호 찾기  -->
		    <div class="row justify-content-center">
		      <div class="col-md-10">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/logo/logo-login.png" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5">
		            <h4 class="text-dark mb-5">비밀번호 찾기</h4>
		            <form action="/user/sign-up" method="post" class="signUpForm">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4">
		                  	<input type="text" class="form-control" id="userName" placeholder="Username" name="userName">
		                </div>
		
				        <div class="input-group">
			                <input type="text" class="form-control" id="email" placeholder="Email" name="email">
		                </div>
		                <div class="col-md-12">
		                  <button class="btn btn-primary btn-block mb-4 bg-primary">비밀번호 찾기</button>
		                </div>
		              </div>
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
		//아이디 찾기
		var $IdEmail = $("#IdEmail");
		var $findIdBtn = $("#findIdBtn");
		$(document).ready(function () {
    	$findIdBtn.click(function() {
	        //이메일 유효성 검사
	        const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zAZ])*.[a-zA-Z]{2,3}$/i;
	        
	        if(!emailRegex.test($IdEmail.val())) {
	            alert('이메일 형식을 확인해주세요 ex) dltmdgh757@naver.com');
	            $('#IdEmail').focus();
	            return false;
	        }
        
        //인증메일 보내기
	        $.ajax({
	            type : "POST",
	            url : "/user/find-id",
	            data : {
	                "email" : $IdEmail.val()
	            },
	            success : function(data){
	                if(data != null && data.trim() !== ""){
	                	console.log("발송됨");
	                    alert("해당 이메일로 아이디 발송이 완료되었습니다. \n 확인부탁드립니다.");
	                }
	                else {
	                    alert("이메일이 확인되지 않습니다. \n 확인부탁드립니다.");
	                }
	            }
	        });
	    });
	});
		</script>
	</body>
</html>
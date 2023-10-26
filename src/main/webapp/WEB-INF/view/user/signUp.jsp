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
		                <img class="ec-brand-icon" src="/resources/img/logo/logo-login.png" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5">
		            <h4 class="text-dark mb-5">Register</h4>
		
		            <form action="/user/sign-up" method="post" class="signUpForm">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4" style="margin-bottom:0px !important;">
		                  <div class="input-group">
		                  	<input type="text" class="form-control" id="userName" placeholder="Username" name="userName">
		                  	<div class="input-group-append">
		                  		<button class="btn btn-primary bg-primary" type="button" id="checkId">중복확인</button>
		                  	</div>
		                  </div>
		                </div>
		                
		                <div class="form-group col-md-12 ">
		                  <input type="password" class="form-control" id="password" placeholder="Password" name="password">
		                </div>
		
		                <div class="form-group col-md-12 ">
		                  <input type="password" class="form-control" id="cpassword" placeholder="Confirm Password">
		                </div>
		
				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="email" placeholder="Email" name="email">
		                </div>
		                		
				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="tel" placeholder="Phone" name="tel">
		                </div>
		                
		            	<div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="bDate" placeholder="Birthdate Ex : 1994-04-26" name="birthDate">
		                </div>
		                
		                <div class="col-md-12">
		                  <button type="submit" class="btn btn-primary btn-block mb-4 bg-primary">Register</button>
		                  <p class="sign-upp">Already have an account?
		                    <a class="text-blue" href="/user/sign-in">Sign in</a>
		                  </p>
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
		<script>
			let emailCheck = false;
			let idCheck = false;
			let telCheck = false;
			let startTime1;
			let startTime2;
	
			//아이디 중복확인
			$('#checkId').on('click', () => {
	
				let idval = $('#userName').val();
				let idvalcheck = /^[a-z0-9]+$/;
				if (!idvalcheck.test(idval) || idval.length < 4) {
					alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
					$('#userName').focus();
					return false
				}
				
				$.ajax({
					type : "POST",
					url : "/user/duplicate-check",
					data : {
						"username" : idval
					},
					success : function(data){
						if (data === 200) {
								alert('사용 가능한 아이디입니다.');
								idCheck = true;
								$("#checkId").prop("disabled", true);
								$("#checkId").css("background", "#bbbbbb");
								$("#userName").prop("readonly", true);
								$("#userName").css("background", "#f3f3f3");
							} else {
							alert('사용중인 아이디 입니다.');
							$('#userName').focus();
						}
					}
					,error: function(){
						alert('서버 에러입니다.');
					}
				});
			});
			
			//페스워드 일치확인
			$('.signUpForm').on('submit', () => {
				
				let pwdval = $('#password').val();
				let pwdokval = $('#cpassword').val();
				let pwdcheck = /^[a-zA-Z0-9]+$/;
			
				if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
					alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
					$('#password').focus();
					return false;
				} else {
					if (pwdokval) {
						if (pwdval !== pwdokval) {
							alert('비밀번호가 일치하지 않습니다.');
							$('#cpassword').focus();
							return false;
						}
					} else {
						alert('비밀번호 확인란을 입력하십시오.');
						$('#cpassword').focus();
						return false;
					}
				}
			
			
				//생년월일 형식 확인
				let dateval = $('#bDate').val();
				const dateRegex = /^\d{4}\d{2}\d{2}$/; // YYYYMMDD 형식의 정규식
				const dateRegex2 = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식의 정규식
				const dateRegex3 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // YYYYMMDD 각 자리에 유효한 생년월일인지 확인
				const dateRegex4 = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/; // YYYY-MM-DD 각 자리에 유효한 생년월일인지 확인
			
				if (dateRegex.test(dateval) || dateRegex2.test(dateval)) {
					if (dateRegex3.test(dateval) || dateRegex4.test(dateval)) {
						
					}
					else {
						alert('생년월일 숫자를 확인해주세요');
						$('#bDate').focus();
						return false;
					}
				} else {
					alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
					$('#bDate').focus();
					return false
				}
				
				if(!idCheck) {
					alert('아이디 중복검사를 해주세요');
					$('#userName').focus();
					return false;
				}
			});
		</script>
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
	</body>
</html>
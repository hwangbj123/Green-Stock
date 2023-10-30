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
		            <form action="/user/modify-pw" method="post" class="signUpForm">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4">
		                  	<input type="text" class="form-control" id="pwUserName" placeholder="Username" name="userName">
		                </div>
		                
				        <div class="input-group" style="margin-bottom:0px !important;">
			                <input type="text" class="form-control" id="pwEmail" placeholder="Email" name="email">
			                <div class="input-group-append">
			                	<button class="btn btn-primary bg-primary" type="button" id="checkEmail">이메일 확인</button>
			                </div>
		                </div>
		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="emconfirm" placeholder="인증번호를 입력하세요." style="display: none; margin-top:20px;">
		                  <label class="form-label my-0" id="emailconfirmTxt" style="display: none; margin-left: 10px;"> </label><span id='timer2'></span>
		                </div>
		                		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="password" placeholder="New Password" name="password" style="display: none;">
		                </div>
		
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="cpassword" placeholder="Confirm Password" style="display: none;">
		                </div>
		                
		                <div class="col-md-12">
		                  <button type = "submit" class="btn btn-primary btn-block mb-4 bg-primary">비밀번호 변경</button>
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
	            alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
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
	                    alert("해당 이메일로 아이디 발송이 완료되었습니다. \n확인부탁드립니다.");
	                }
	                else {
	                    alert("이메일이 확인되지 않습니다. \n확인부탁드립니다.");
	                }
		            }
		        });
		    });
		});
	
		//비밀번호 변경
			var $email = $("#pwEmail");
			var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
			var $emailconfirm = $("#emconfirm"); // 인증번호 확인input
			var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
			var $password = $("#password");
			var $cpassword = $("#cpassword");
			var $username = $("#pwUserName");
			let interval2;
			
			$checkEmail.click(function() {
				
				//유저이름 유효성
				let idval = $('#pwUserName').val();
				let idvalcheck = /^[a-z0-9]+$/;
				if (!idvalcheck.test(idval) || idval.length < 4) {
					alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
					$('#userName').focus();
					return false
				}
				
				//이메일 유효성 검사
				const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				if(!emailRegex.test($email.val())) {
					alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
					$('#email').focus();
					return false;
				}
				
				$("#pwEmail").prop("disabled", true);
				$("#pwEmial").css("background", "#f3f3f3");
				$("#checkEmail").prop("disabled", true);
				$("#checkEmail").css("background", "#f3f3f3");
				$("#pwUserName").prop("disabled", true);
				$("#pwUserName").css("background", "#f3f3f3");
				
				//인증메일 보내기
				$.ajax({
					type : "POST",
					url : "/user/find-pw",
					data : {
						"email" : $email.val(),
						"username" : $username.val()
					},
					success : function(data){
						
						if(data != null && data.trim() !== "") {
							$emailconfirm.css('display', '');
							$emailconfirmTxt.css('display', '');
							alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n확인부탁드립니다.");
							$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 발송되었습니다</span>")
							$("#emconfirmchk").css({
								"color" : "green",
								"font-weight" : "bold",
								"font-size" : "12px"
							});
							
							$("#timer2").css({
								"color" : "#7800f7",
								"font-weight" : "bold",
								"font-size" : "12px"
							});

							startTime2 = new Date().getTime() + 5 * 60 * 1000;
							interval2 = setInterval(updateTimer2, 1000);
							
							chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
						} else {
							alert("일치하는 정보의 유저가 없습니다. \n확인부탁드립니다.");
						}
					}
				});
			});
			
			function updateTimer2() {
				  
				  const currentTime = new Date().getTime();
				  const timeDifference = startTime2 - currentTime;

				  if (timeDifference <= 0) {
				    $("#timer2").text("시간 종료");
				    $("#timer2").css({
						"color" : "red"
					});
				    $emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
				    $("#emconfirmchk").css({
						"color" : "#FA3E3E",
						"font-weight" : "bold",
						"font-size" : "12px"
					});
				    clearInterval(interval2);
				  } else {
				    const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
				    const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
				    $("#timer2").text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
				  }
				}
			
			function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt){
				$emailconfirm.on("keyup", function(){
					$("#email").prop("readonly", true);
					$("#email").css("background", "#f3f3f3");
					if ($("#timer2").text() === "시간 종료") {
						$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
						$("#emconfirmchk").css({
							"color" : "#FA3E3E",
							"font-weight" : "bold",
							"font-size" : "12px"
						});
						$("#timer2").css({
							"color" : "white",
						});
						clearInterval(interval2);
						$("#pwEmail").prop("disabled", false);
						$("#pwEmial").css("background", "#f3f3f3");
						$("#checkEmail").prop("disabled", false);
						$("#checkEmail").css("background", "#f3f3f3");
						$("#pwUserName").prop("disabled", false);
						$("#pwUserName").css("background", "#f3f3f3");
						return false;
					}
					if (data != $emailconfirm.val()) {
						$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>");
						$("#emconfirmchk").css({
							"color" : "#FA3E3E",
							"font-weight" : "bold",
							"font-size" : "12px"
						});
					} else {
						clearInterval(interval2);
						$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>");
						$("#emconfirmchk").css({
							"color" : "#0D6EFD",
							"font-weight" : "bold",
							"font-size" : "12px"
						});
						$("#timer2").css({
							"display" : "none"
						});
						$("#emconfirm").prop("disabled", true);
						$("#emconfirm").css("background", "#f3f3f3");
						$password.css('display', '');
						$cpassword.css('display', '');
						emailCheck = true;
					}
				});
			}	
	
			$('.signUpForm').on('submit', () => {
				
				$("#pwUserName").prop("disabled", false);
				
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
				
				if(!emailCheck) {
					alert('이메일 인증을 진행해주세요');
					$('#email').focus();
					return false;
				}
		});
		</script>
	</body>
</html>
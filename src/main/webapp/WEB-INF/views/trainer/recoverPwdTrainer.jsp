<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/modernizr/modernizr.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery/jquery.js"></script>
</head>
<body>


		<!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
				<a href="/" class="logo pull-left">
					<img src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" height="54" alt="Porto Admin" />
				</a>

				<div class="panel panel-sign">
					<div class="panel-title-sign mt-xl text-right">
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i>비밀번호 재설정</h2>
					</div>
					<div class="panel-body">
						<div class="alert alert-info">
							<p class="m-none text-semibold h6">새로운 출근번호를 입력해주세요.</p>
						</div>

						<form method="post" action="changePwd.utr">
							<input type="hidden" name="trainerNo" value="${ t.trainerNo }">
							<input class="form-control input-lg mb-md" type="password" name="newPwd" placeholder="새로운 출근번호" required>
							<div id="change_text1" style="display:none;"></div>
							<input class="form-control input-lg mb-md" type="password" id="checkInput" name="newPWdCheck" readonly placeholder="새로운 출근번호 확인" required>
							<div id="change_text2" style="display:none;"></div>
							<button type="submit" id="change_btn" class="mb-xs mt-xs mr-xs btn btn-primary btn-lg btn-block">변경하기</button>
						</form>
					</div>
					<br>
				</div>
			</div>
		</section>
		<!-- end: page -->
		
		
		<script>
			$(function(){
				var $newPwd = $('input[name=newPwd]');
				var $newPwdCheck = $('input[name=newPWdCheck]');
				
				
				$newPwd.keyup(function(){
					
					if($newPwd.val().length >= 4){
						
					$.ajax({
						url:'pwdCheck.utr',
						data: {pwd:$newPwd.val()},
						type:"post",
						success:function(result){
							console.log(result);
							
							if(result > 0){ // 중복
								
								idCheckValidate(1);
							
							}else{ // 미중복

								idCheckValidate(0);
									$newPwdCheck.keyup(function(){
										
										if($newPwd.val() == $newPwdCheck.val()){ // 일치
											idCheckValidate(2);
										}else{	// 미일치
											idCheckValidate(3);
										}
								})
							}
							
						},error:function(){
						}
					})
					
					}else{
						idCheckValidate(4);
					}	
				})
						
			})
			
			
		function idCheckValidate(data){
			
			if(data == 0){ // 미중복
				$('#checkInput').removeAttr("readonly");
			}else if(data == 1){ // 중복 
				$('#change_btn').attr("disabled", true);
				$('#change_text1').css("color", "red").text("이미 있는 번호입니다. 다시 입력해주세요.");
				$('#change_text1').show();
			}else if(data == 2){ // 일치
				$('#change_btn').attr("disabled", false);
				$('#change_text2').css("color", "green").text("사용할 수 있는 출근 번호입니다!");
				$('#change_text2').show();
				$('#change_text1').css('display', 'none');
			}else if(data == 3){	// 미일치
				$('#change_btn').attr("disabled", true);
				$('#change_text2').css("color", "red").text("입력된 값이 다릅니다. 다시 작성해주세요.");
				$('#change_text2').show();
				$('#change_text1').css('display', 'none');
			}else{
				$('#checkInput').attr("readonly", true);
			}
		}
		</script>
		
		




	<!-- Theme Base, Components and Settings -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.init.js"></script>
		

</body>
</html>
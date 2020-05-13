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
							<p class="m-none text-semibold h6">등록 시 입력했던 핸드폰 번호를 입력해주세요.</p>
						</div>

						<form method="post" action="searchPhone.utr">
							<div class="form-group mb-none">
								<div class="input-group">
									<input name="phone" type="text" placeholder="-를 생략해주세요." class="form-control input-lg" />
									<span class="input-group-btn">
										<button class="btn btn-primary btn-lg" type="submit">Submit</button>
									</span>
								</div>
							</div>
						</form>
						
						<br>
					</div>
				</div>

			</div>
		</section>
		<!-- end: page -->
		
		
		
		<!-- Theme Base, Components and Settings -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.init.js"></script>
		
</body>
</html>
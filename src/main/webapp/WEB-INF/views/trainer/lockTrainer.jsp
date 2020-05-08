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
	
	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/morris/morris.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jstree/themes/default/style.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
	
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
	

	<section class="body-sign body-locked">
		<div class="center-sign">
			<div class="panel panel-sign">
				<div class="panel-body">
					<form action="login.utr" method="post">
						<div class="current-user text-center">
							<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ t.trainerThumbnail }" alt="${ t.trainerName }" class="img-circle user-image" />
							<h2 class="user-name text-dark m-none">${ t.trainerName }</h2>
							<p class="user-email m-none">트레이너</p>
						</div>
						<div class="form-group mb-lg">
							<div class="input-group input-group-icon">
								<input id="pwd" type="password" class="form-control input-lg" placeholder="출근번호" name="trainerPwd">
								<span class="input-group-addon">
									<span class="icon icon-lg">
										<i class="fa fa-lock"></i>
									</span>
								</span>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<p class="mt-xs mb-none">
									<a href="${ pageContext.servletContext.contextPath }">선택된 본인이 아닙니까?</a>
								</p>
							</div>
							<div class="col-xs-6 text-right">
								<button type="submit" class="btn btn-primary">로그인</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
			
			
	<!-- jsp파일들 -->
	<jsp:include page="../common/footerjs.jsp" />
</body>
</html>
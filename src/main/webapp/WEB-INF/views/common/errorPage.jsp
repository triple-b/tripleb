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
	<section class="body-error error-outside">
				<div class="center-error">

					<div class="error-header">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-8">
										<a href="/" class="logo">
											<img src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" height="54" alt="TripleB" />
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="main-error mb-xlg">
								<h2 class="error-code text-dark text-center text-semibold m-none">ERROR <i class="fa fa-file"></i></h2>
								<p class="error-explanation text-center">${ msg } <a href="javascript:history.back();"> 뒤로가기</a></p>
							</div>
						</div>
					</div>
				</div>
			</section>
		
	
	<!-- jsp파일들 -->
	<jsp:include page="footerjs.jsp" />
	
	

</body>
</html>
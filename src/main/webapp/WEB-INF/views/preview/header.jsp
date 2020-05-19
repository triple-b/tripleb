<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<!-- Web Fonts  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
	
	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.css" />
	
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
	<header class="header">
	
		<!-- ***** 로고 부분 ***** -->
		<div class="logo-container">
			<a href="${ pageContext.servletContext.contextPath }" class="logo">
				<img src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" height="35" alt="TripleB" />
			</a>
			<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>
	
		<!-- ***** start: search & user box ***** -->
		<div class="header-right">
	
			<span class="separator"></span>
			<div id="userbox" class="userbox">
				<a href="#" data-toggle="dropdown">
					<figure class="profile-picture">
						<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ loginUser.trainerThumbnail }" class="img-circle" data-lock-picture="${ pageContext.servletContext.contextPath }/resources/assets/images/!logged-user.jpg" />
					</figure>
					<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@JSOFT.com">
						<span class="name">${ loginUser.trainerName } 트레이너</span>
						<span class="role">
							<c:choose>
								<c:when test="${ loginUser.trainerGrade eq 'B'}">
								사원
								</c:when>
								<c:when test="${ loginUser.trainerGrade eq 'E'}">
								팀장
								</c:when>
								<c:otherwise>
								대표
								</c:otherwise>
							</c:choose>
						</span>
					</div>
	
					<i class="fa custom-caret"></i>
				</a>
	
				<div class="dropdown-menu">
					<ul class="list-unstyled">
						<li class="divider"></li>
						<li>
							<a role="menuitem" tabindex="-1" href="profileForm.utr"><i class="fa fa-user"></i> 프로필</a>
						</li>
						<li>
							<a role="menuitem" tabindex="-1" href="loginForm.utr"><i class="fa fa-power-off"></i>출/퇴근</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end: search & user box -->

	</header>
</body>
</html>
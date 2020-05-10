<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TemplateSetting</title>
	<style>
		.item-price {
			color: #756f6f; 
			padding: 2px; 
		}
		.pricing-table-template {
			/* margin: 25px 0; */
			padding-left: 0;
			text-align: center;
		}
		.pricing-table-template ul {
			list-style: none;
			margin: 30px 0 0 0;
			padding: 0;
		}
		.pricing-table-template li {
			border-top: 1px solid #ddd;
			margin: 5px 0 0 0;
			padding: 10px;
		}
		.pricing-table-template h3 {
			background-color: #eee;
			border-radius: 2px 2px 0 0;
			/*font-size: 20px;*/
			font-weight: normal;
			margin: -20px -20px 50px -20px;
			padding: 20px;
		}
		.pricing-table-template h3 span {
			background: #FFF;
			border: 5px solid #FFF;
			border-radius: 100px;
			box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
			color: #cccccc;
			display: block;
			font: bold;	
			font-size: 20px;
			height: 70px;
			margin: 20px auto -65px;
			padding-top: 20px;
			width: 280px;
		}
		.pricing-table-template .most-popular {
			border: 3px solid #CCC;
			box-shadow: 11px 0 10px -10px rgba(0, 0, 0, 0.1), -11px 0 10px -10px rgba(0, 0, 0, 0.1);
			padding: 30px 20px;
			top: -10px;
			z-index: 2;
		}
		.pricing-table-template .most-popular h3 {
			background-color: #cccccc;
			color: #FFF;
			padding-top: 30px;
		}
		.pricing-table-template .plan-ribbon-wrapper {
			height: 88px;
			overflow: hidden;
			position: absolute;
			right: -5px;
			top: -5px;
			width: 85px;
		}
		.pricing-table-template .plan-ribbon {
			-webkit-transform: rotate(45deg);
			-moz-transform: rotate(45deg);
			-ms-transform: rotate(45deg);
			-o-transform: rotate(45deg);
			transform: rotate(45deg);
			background-image: -webkit-linear-gradient(top, #bfdc7a, #8ebf45);
			background-image: linear-gradient(to bottom, #bfdc7a, #8ebf45);
			background-color: #bfdc7a;
			box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.3);
			color: #333;
			font-size: 14px;
			left: -5px;
			padding: 7px 0;
			position: relative;
			text-align: center;
			top: 15px;
			width: 120px;
		}
		.pricing-table-template .plan-ribbon:before {
			left: 0;
			border-left: 3px solid transparent;
			border-right: 3px solid transparent;
			bottom: -3px;
			content: "";
			position: absolute;
		}
		.pricing-table-template .plan-ribbon:after {
			border-left: 3px solid transparent;
			border-right: 3px solid transparent;
			bottom: -3px;
			content: "";
			position: absolute;
			right: 0;
		}
		.pricing-table-template .plan {
			background: #FFF;
			border: 1px solid #ddd;
			border-radius: 5px;
			color: #333;
			margin-bottom: 35px;
			margin-right: 0;
			padding: 20px;
			position: relative;
		}
		.pricing-table-template .btn {
			margin-top: 5px;
		}
		/* dark */
		html.dark .pricing-table-template li {
			border-top-color: #21262d;
		}
		html.dark .pricing-table-template h3 {
			background-color: #21262d;
			text-shadow: none;
		}
		html.dark .pricing-table-template h3 span {
			background: #2e353e;
			border-color: #242830;
			box-shadow: 0 5px 20px #242830 inset, 0 3px 0 #282d36 inset;
			color: #ebebeb;
		}
		html.dark .pricing-table-template .most-popular {
			border-color: #282d36;
		}

		html.dark .pricing-table-template .most-popular h3 {
			background-color: #282d36;
			color: #808697;
			text-shadow: none;
		}

		html.dark .pricing-table-template .plan-ribbon {
			background-color: #282d36;
		}
		html.dark .pricing-table-template .plan {
			background: #282d36;
			border: 1px solid #282d36;
			color: #808697;
			text-shadow: none;
		}
		.panel-body-template {
   			background: #fdfdfd;   
   			height: 540px;
			/*display:inline-block*/
		}
	</style>
</head>
<body>
	<section class="body">
		<!-- 상단 페이지 -->
		<jsp:include page="../common/header.jsp" />
		<!--/ 상단 페이지 -->
		<!-- 전체 레이어 : 오른쪽 사이드바 제외 -->
		<div class="inner-wrapper">
			<!-- 왼쪽 메뉴 페이지 -->
			<jsp:include page="../common/sidebarLeft.jsp" />
			<!--/ 왼쪽 메뉴 페이지 -->
			<!-- 오른쪽 content 페이지 : 메뉴 선택시 수정되는 부분 -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>템플릿 관리</h2>
					<div class="right-wrapper pull-right">			
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<!-- 서비스 항목 선택 -->
				<div class="row">
					<!-- 서비스 항목 리스트 -->
					<div class="col-md-8" >
						<section class="panel">
							<header class="panel-heading">			
								<h2 class="panel-title">서비스 항목</h2>
								<p class="panel-subtitle">구매할 서비스를 선택해주세요</p>
							</header>
							<div class="panel-body-template">
								<div id="treeAjaxJSON" class="jstree jstree-4 jstree-default" role="tree">
									<ul class="jstree-container-ul jstree-children">
										<li class="jstree-initial-node jstree-loading jstree-leaf jstree-last">
											<i class="jstree-icon jstree-ocl"></i>
											<a class="jstree-anchor" href="#">
												
												
											</a>
										</li>
									</ul>
								</div>		
							</div>
						</section>		
					</div>
					<!--/ 서비스 항목 리스트 -->
					<!-- 구매 가격 -->
					<div class="pricing-table-template">
						<div class="col-lg-4">
							<div class="plan" style="height:620px;">
								<h3>Price List<span><strong id="totalprice" class="item-price">0</strong>원<a style="font-size:12px"> (월사용료)</a></span></h3>				
								<a class="btn btn-lg btn-primary" style="margin:10px 0 0 0; padding-top: 0px;padding-bottom: 5px;border-top-width: 5px;" href="#">미리보기</a>
								<a class="btn btn-lg btn-primary" style="margin:10px 0 0 0; padding-top: 0px;padding-bottom: 5px;border-top-width: 5px;" href="#">구매하기</a>
								<ul>
									<c:forEach items="${ list }" var="i">			
										<li class="item-price">${ i.templateItemName } : <strong id="item${ i.templateItemNo }">0</strong>원</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--/구매 가격-->	
				</div>
				<!--/ 서비스 항목 선택 -->
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jstree/jstree.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/templateInfo.js"></script>
	
</body>
</html>
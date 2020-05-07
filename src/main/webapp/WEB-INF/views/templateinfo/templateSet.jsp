<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TemplateSetting</title>
	<style>
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
   			height: 510px;
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
								<div id="treeCheckbox" class="jstree jstree-2 jstree-default" role="tree" aria-activedescendant="j2">
									<ul class="jstree-container-ul jstree-children">
										<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-group&quot; }" aria-expanded="true" id="j2_1" class="jstree-node jstree-open" aria-selected="false">
											<i class="jstree-icon jstree-ocl"></i>
											<a class="jstree-anchor" href="#">
												<i class="jstree-icon jstree-checkbox"></i>
												<i class="jstree-icon jstree-themeicon fa fa-group jstree-themeicon-custom"></i><span class="ft20">회원관리</span>										 
											</a>
											<ul role="group" class="jstree-children">
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_1_1" aria-selected="true">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">회원관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
										
												<li role="treeitem-sub" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_1_2" class="jstree-node  jstree-leaf" aria-selected="false">
													
													<div class="jstree-anchor" onclick="setPrice();">
														<div style="width:100px; display: inline-block;">블랙리스트</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</div>
												</li>
										
											</ul>
										</li>
										
										<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-user&quot; }" aria-expanded="true" id="j2_2" class="jstree-node  jstree-open" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-user jstree-themeicon-custom"></i>
													<span class="ft20">트레이너관리	</span>											 
											   </a>
											   	<ul role="group" class="jstree-children" style="">
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_2_1" price="5000" item="트레이너" class="jstree-node  jstree-leaf" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file-text jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">트레이너현황</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
																<i class="fa fa-krw"></i>500,000
															</div>
														</a>
													</li>
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_2_2" class="jstree-node  jstree-leaf" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">수강생관리</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
																<i class="fa fa-krw"></i>500,000
															</div>
														</a>
													</li>
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_2_3" class="jstree-node  jstree-leaf" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">수업관리</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; font-weight:600; margin-right:10px;">
																<i class="fa fa-krw"></i>500,000
															</div>
														</a>
													</li>
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_2_4" class="jstree-node  jstree-leaf jstree-last" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">건의사항</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; margin-right:10px;">
																<i class="fa fa-krw"></i>50,000
															</div>
														</a>
													</li>
												</ul>
											</li>
											<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-list-ul&quot; }" aria-expanded="true" id="j2_3" class="jstree-node jstree-open" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-list-ul jstree-themeicon-custom"></i>
													<span class="ft20">서비스관리</span>																						 
											   </a>
											   <ul role="group" class="jstree-children" style="">
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_3_1" class="jstree-node  jstree-leaf" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">상품관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_3_2" class="jstree-node  jstree-leaf" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">PT회원관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
											</ul>
											</li>
											<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-building-o&quot; }" aria-expanded="true" id="j2_4" class="jstree-node jstree-open" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-building-o jstree-themeicon-custom"></i>
													<span class="ft20">시설관리</span>												 
											   </a>
											   <ul role="group" class="jstree-children" style="">
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_4_1" class="jstree-node  jstree-leaf" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">시설관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_4_2" class="jstree-node  jstree-leaf" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">비품관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_4_3" class="jstree-node  jstree-leaf" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">시설점검</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; font-weight:600; margin-right:10px;">
															<i class="fa fa-krw"></i>500,000
														</div>
													</a>
												</li>
												<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_4_4" class="jstree-node  jstree-leaf jstree-last" aria-selected="false">
													<i class="jstree-icon jstree-ocl"></i>
													<a class="jstree-anchor" href="#">
														<i class="jstree-icon jstree-checkbox"></i>
														<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
														<div style="width:100px; display: inline-block;">락커관리</div>
														<div style="text-align:right; width:100px; display: inline-block; font-weight:600; margin-right:10px;">
															<i class="fa fa-krw"></i>50,000
														</div>
													</a>
												</li>
											</ul>
											</li>
											<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-bar-chart-o&quot; }" aria-expanded="true" id="j2_5" class="jstree-node jstree-open" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-bar-chart-o jstree-themeicon-custom"></i>
													<span class="ft20">매출관리</span>											 
												</a>
												<ul role="group" class="jstree-children" style="">
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_5_1" class="jstree-node  jstree-leaf" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">매출현항</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
																<i class="fa fa-krw"></i>500,000
															</div>
														</a>
													</li>
													<li role="treeitem" data-jstree="{ &quot;type&quot; : &quot;file&quot; }" id="j2_5_2" class="jstree-node  jstree-leaf" aria-selected="false">
														<i class="jstree-icon jstree-ocl"></i>
														<a class="jstree-anchor" href="#">
															<i class="jstree-icon jstree-checkbox"></i>
															<i class="jstree-icon jstree-themeicon fa fa-file jstree-themeicon-custom"></i>
															<div style="width:100px; display: inline-block;">매출통계</div>
															<div style="text-align:right; width:100px; display: inline-block; font-weight:600; text-align:right; margin-right:10px;">
																<i class="fa fa-krw"></i>500,000
															</div>
														</a>
													</li>
												</ul>
											</li>
											<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-calendar&quot; }" aria-expanded="false" id="j2_6" class="jstree-node jstree-closed" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-calendar jstree-themeicon-custom"></i>
													<span class="ft20">일정관리</span>												 
												</a>
											</li>
											<li role="treeitem" data-jstree="{ &quot;icon&quot; : &quot;fa fa-bullhorn&quot; }" aria-expanded="false" id="j2_7" class="jstree-node  jstree-last jstree-closed" aria-selected="false">
												<i class="jstree-icon jstree-ocl"></i>
												<a class="jstree-anchor" href="#">
													<i class="jstree-icon jstree-checkbox"></i>
													<i class="jstree-icon jstree-themeicon fa fa-bullhorn jstree-themeicon-custom"></i>
													<span class="ft20">공지사항</span>												 
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
							<div class="plan">
								<h3>Price List<span><i class="fa fa-krw"></i><strong>5,800,000</strong> <a style="font-size:10px"> (월사용료)</a></span></h3>				
								<a class="btn btn-lg btn-primary" style="margin:10px 0 0 0; padding-top: 0px;padding-bottom: 5px;border-top-width: 5px;" href="#">미리보기</a>
								<a class="btn btn-lg btn-primary" style="margin:10px 0 0 0; padding-top: 0px;padding-bottom: 5px;border-top-width: 5px;" href="#">구매하기</a>
								<ul>
									<li>회원관리 <i class="fa fa-krw"></i><b>1,000,000</b></li>
									<li>트레이너관리 <i class="fa fa-krw"></i><b>1,500,000</b></li>
									<li>서비스관리 <i class="fa fa-krw"></i><b>2,000,000</b></li>
									<li>시설관리 <i class="fa fa-krw"></i><b>0</b></li>
									<li>매출관리 <i class="fa fa-krw"></i><b>0</b></li>
									<li>일정관리 <i class="fa fa-krw"></i><b>1,200,000</b></li>
									<li>공지사항 <i class="fa fa-krw"></i><b>100,000</b></li>
								</ul>
								<p style="height:10px"></p>
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
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.treeview.js"></script>
	<script>
		function setPrice() {
			alert("test");
		}
	</script>
</body>
</html>
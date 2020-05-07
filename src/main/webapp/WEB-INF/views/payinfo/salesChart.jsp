<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="body">

	<!-- 상단 페이지 -->
	<jsp:include page="../common/header.jsp" />

		<div class="inner-wrapper">
			<!-- 왼쪽메뉴 페이지 -->
			<jsp:include page="../common/sidebarLeft.jsp" />
			
			<!-- 오른쪽 페이지 -->	
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>매출 관리</h2>
					<div class="right-wrapper pull-right">					
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<!-- 월 매출 현황 -->
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>						
								<h2 class="panel-title">월 매출 현황</h2>
							</header>
							<div class="panel-body">
								<div class="row">																									
									<table width="100%">
										<tr style="text-align: center;">
											<td width="2%"></td>
											<td width="22%"><h4>이전달</h4></td>
											<td width="2%"></td>
											<td width="22%"><h4><b>2020년 4월</b></h4></td>
											<td width="2%"></td>
											<td width="22%"><h4>다음달</h4></td>
											<td width="3%"></td>
											<td width="24%"><h4><b>목표 달성률</b></h4></td>
										</tr>
										<tr style="text-align: center;">
											<td></td>
											<td>
												<section class="panel panel-featured-left panel-featured-secondary">
													<div class="panel-body">
														<div class="widget-summary widget-summary-md">
															<div class="widget-summary-col widget-summary-col-icon">
																<div class="summary-icon bg-secondary">
																	<i class="fa fa-krw"></i>
																</div>
															</div>
															<div class="widget-summary-col">
																<div class="summary">
																	<h4 class="title">총 매출액</h4>
																	<div class="info">
																		<strong class="amount-sale"><i class="fa fa-krw"></i> 14,890,000</strong>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</td>
											<td></td>
											<td>
												<section class="panel panel-featured-left panel-featured-tertiary">
													<div class="panel-body">
														<div class="widget-summary widget-summary-md">
															<div class="widget-summary-col widget-summary-col-icon">
																<div class="summary-icon bg-tertiary">
																	<i class="fa fa-credit-card"></i>
																</div>
															</div>
															<div class="widget-summary-col">
																<div class="summary">
																	<h4 class="title">카드</h4>
																	<div class="info">
																		<strong class="amount-sale"><i class="fa fa-krw"></i> 14,890,000</strong>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</td>
											<td></td>
											<td>
												<section class="panel panel-featured-left panel-featured-quartenary">
													<div class="panel-body">
														<div class="widget-summary widget-summary-md">
															<div class="widget-summary-col widget-summary-col-icon">
																<div class="summary-icon bg-quartenary">
																	<i class="fa fa-money"></i>
																</div>
															</div>
															<div class="widget-summary-col">
																<div class="summary">
																	<h4 class="title">현금</h4>
																	<div class="info">
																		<strong class="amount-sale"><i class="fa fa-krw"></i> 0</strong>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</td>
											<td></td>
											<td>
												<div class="liquid-meter-wrapper liquid-meter-sm mt-lg">
													<div class="liquid-meter liquid-meter-loaded"><svg preserveAspectRatio="xMidYMid meet" viewBox="0 0 220 220" width="100%" height="100%"><desc>Created with Snap</desc><defs><linearGradient x1="0" y1="0" x2="100" y2="100" gradientUnits="userSpaceOnUse" id="Sk9axui5w2"><stop offset="0%" stop-color="#ffffff"></stop><stop offset="100%" stop-color="#f9f9f9"></stop></linearGradient><mask id="Sk9axui5w8"><circle cx="110" cy="110" r="87" fill="#ffffff" style=""></circle></mask><mask id="Sk9axui5wi"><circle cx="110" cy="110" r="87" fill="#ffffff" style=""></circle></mask></defs><circle cx="110" cy="110" r="95" fill="url('#Sk9axui5w2')" stroke="#f2f2f2" style="stroke-width: 15;"></circle><path id="front" fill="#0088cc" mask="url('#Sk9axui5w8')" stroke="#33bbff" style="stroke-width: 1;" d="M0,133.4 C114.4,143.4 163.4,157.4 220,154.4 L220,220 L0,220 z"></path><text x="50%" y="50%" fill="#333333" dy=".4em" stroke="#333333" style="font-family: &quot;Open Sans&quot;; font-size: 24px; font-weight: 600; text-anchor: middle;"><tspan>35</tspan><tspan stroke="none" style="font-size: 24px;">%</tspan></text></svg><meter min="0" max="100" value="35" id="meter"></meter></div>
												</div>	
											</td>
										</tr>
									</table>
								</div>
							</div>	
						</section>
					</div>
				</div>			
				<!-- /월 매출 현황 -->
				<!-- 전체매출 현황 -->
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>						
								<h2 class="panel-title">전체 월별 매출 현황</h2>
							</header>
							<div class="panel-body">
					
								<!-- Morris: Bar -->
								<div class="chart chart-md" id="morrisBar" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
								</div>
								<script type="text/javascript">
				
									var morrisBarData = [{
										y: '1월',
										a: 30,
										b: 40,
										c: 30
									}, {
										y: '2월',
										a: 100,
										b: 25,
										c: 30
									}, {
										y: '3월',
										a: 60,
										b: 25,
										c: 30
									}, {
										y: '4월',
										a: 75,
										b: 35,
										c: 30
									}, {
										y: '5월',
										a: 90,
										b: 20,
										c: 30
									}, {
										y: '6월',
										a: 75,
										b: 15,
										c: 30
									}, {
										y: '7월',
										a: 50,
										b: 10,
										c: 30
									}, {
										y: '8월',
										a: 75,
										b: 25,
										c: 30
									}, {
										y: '9월',
										a: 30,
										b: 10,
										c: 30
									}, {
										y: '10월',
										a: 75,
										b: 5,
										c: 30
									}, {							
										y: '11월',
										a: 60,
										b: 8,
										c: 30
									}, {	
										y: '12월',							
										a: 60,
										b: 8,
										c: 50
									}];
				
									// See: assets/javascripts/ui-elements/examples.charts.js for more settings.
				
								</script>
				
							</div>
						</section>
					</div>
				</div>
				<!-- /전체 매출 현황 -->
				<!-- 상품별/트레이너별 매출 현황 -->
				<div class="row">
					<div class="col-md-6">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>					
								<h2 class="panel-title">상품별 매출 현황</h2>
							</header>
							<div class="panel-body">
				
								<!-- Flot: Bars -->
								<div class="chart chart-md" id="flotBars" style="padding: 0px; position: relative;">
								</div>
								<script type="text/javascript">
				
									var flotBarsData = [
										["회원권 3개월", 28],
										["회원권 6개월", 42],
										["회원권 12개월", 25],
										["PT 1:1", 23],
										["PT 1:3", 37],
										["PT 1:5", 33]
									];
			
								</script>
				
							</div>
						</section>
					</div>
					<div class="col-md-6">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>
				
								<h2 class="panel-title">트레이너별 실적</h2>
							</header>
							<div class="panel-body">
					
								<!-- Morris: Donut -->
								<div class="chart chart-md" id="morrisDonut">
								</div>
								<script type="text/javascript">
				
									var morrisDonutData = [{
										label: "김주희",
										value: 32
									}, {
										label: "정휘재",
										value: 18
									}, {
										label: "김재희",
										value: 20
									}];
				
									// See: assets/javascripts/ui-elements/examples.charts.js for more settings.
				
								</script>
				
							</div>
						</section>	
					</div>
			</section>
			<!--/ 오른쪽 페이지  -->
		</div>

		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />
	</section>

	<!-- jsp파일들 -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- chart관련 jsp파일 -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.charts.js"></script>
</body>
</html>
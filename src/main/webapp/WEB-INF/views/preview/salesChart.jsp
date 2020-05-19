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
	<jsp:include page="header.jsp" />

		<div class="inner-wrapper">
			<!-- 왼쪽메뉴 페이지 -->
			<jsp:include page="sidebarLeft.jsp" />
			
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
										<tbody><tr style="text-align: center;">
											<td width="2%"></td>
											<td width="22%"><h4 id="premonth" prv-num="4" style="cursor:pointer;">이전달</h4></td>
											<td width="2%"></td>
											<td width="22%"><h4><strong id="dateinfo">5월</strong></h4></td>
											<td width="2%"></td>
											<td width="22%"><h4 id="nextmonth" next-num="6" style="cursor:pointer;">다음달</h4></td>
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
																	<h4 class="title" style="font-size:15px;">총 매출액</h4>
																	<div class="info">
																		<strong class="amount-sale" id="total_price" style="font-size:15px;">18,660,000</strong>
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
																	<h4 class="title" style="font-size:15px;">카드</h4>
																	<div class="info">
																		<strong class="amount-sale" id="card_price" style="font-size:15px;">13,960,000</strong>
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
																	<h4 class="title" style="font-size:15px;">현금</h4>
																	<div class="info">
																		<strong class="amount-sale" id="cash_price" style="font-size:15px;">4,700,000</strong>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</td>
											<td></td>
											<td>												
											<div id="fluid-meter"></div>									
											</td>
										</tr>
									</tbody></table>
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
								<div class="chart chart-md" id="morrisBar" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg height="350" version="1.1" width="1173" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><text x="71.015625" y="309" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text><path fill="none" stroke="#aaaaaa" d="M83.515625,309H1148" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="71.015625" y="238" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">5,000,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M83.515625,238H1148" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="71.015625" y="167" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">10,000,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M83.515625,167H1148" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="71.015625" y="96" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15,000,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M83.515625,96H1148" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="71.015625" y="25" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">20,000,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M83.515625,25H1148" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="1103.646484375" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">12월</tspan></text><text x="1014.939453125" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">11월</tspan></text><text x="926.232421875" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">10월</tspan></text><text x="837.525390625" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">9월</tspan></text><text x="748.818359375" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">8월</tspan></text><text x="660.111328125" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">7월</tspan></text><text x="571.404296875" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">6월</tspan></text><text x="482.697265625" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">5월</tspan></text><text x="393.990234375" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">4월</tspan></text><text x="305.283203125" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">3월</tspan></text><text x="216.576171875" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2월</tspan></text><text x="127.869140625" y="321.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 12px sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">1월</tspan></text><rect x="94.60400390625" y="285.712" width="20.1767578125" height="23.28800000000001" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="117.78076171875" y="297.072" width="20.1767578125" height="11.927999999999997" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="140.95751953125" y="297.64" width="20.1767578125" height="11.360000000000014" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="183.31103515625" y="221.244" width="20.1767578125" height="87.756" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="206.48779296875" y="302.894" width="20.1767578125" height="6.1059999999999945" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="229.66455078125" y="227.35000000000002" width="20.1767578125" height="81.64999999999998" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="272.01806640625" y="230.9" width="20.1767578125" height="78.1" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="295.19482421875" y="301.19" width="20.1767578125" height="7.810000000000002" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="318.37158203125" y="238.71" width="20.1767578125" height="70.28999999999999" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="360.72509765625" y="181.91000000000003" width="20.1767578125" height="127.08999999999997" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="383.90185546875" y="294.09" width="20.1767578125" height="14.910000000000025" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="407.07861328125" y="196.82" width="20.1767578125" height="112.18" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="449.43212890625" y="44.02800000000002" width="20.1767578125" height="264.972" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="472.60888671875" y="286.848" width="20.1767578125" height="22.151999999999987" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="495.78564453125" y="66.18" width="20.1767578125" height="242.82" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="538.13916015625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="561.31591796875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="584.49267578125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="626.84619140625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="650.02294921875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="673.19970703125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="715.55322265625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="738.72998046875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="761.90673828125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="804.26025390625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="827.43701171875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="850.61376953125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="892.96728515625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="916.14404296875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="939.32080078125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="981.67431640625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="1004.85107421875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="1028.02783203125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="1070.38134765625" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#e36159" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="1093.55810546875" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#0088cc" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="1116.73486328125" y="309" width="20.1767578125" height="0" r="0" rx="0" ry="0" fill="#2baab1" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect></svg>
								<div class="morris-hover morris-default-style" style="display: none; left: 621.611px; top: 118px;"><div class="morris-hover-row-label">7월</div><div class="morris-hover-point" style="color: #e36159">
  총매출액:
  0
</div><div class="morris-hover-point" style="color: #0088cc">
  회원권:
  0
</div><div class="morris-hover-point" style="color: #2baab1">
  PT:
  0
</div></div></div>	
									<script>
										var morrisBarData = [	
										
										{
											y: "1월",
											a: 1640000,
											b: 840000,
											c: 800000
										},	
										
										{
											y: "2월",
											a: 6180000,
											b: 430000,
											c: 5750000
										},	
										
										{
											y: "3월",
											a: 5500000,
											b: 550000,
											c: 4950000
										},	
										
										{
											y: "4월",
											a: 8950000,
											b: 1050000,
											c: 7900000
										},	
										
										{
											y: "5월",
											a: 18660000,
											b: 1560000,
											c: 17100000
										},	
										
										{
											y: "6월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "7월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "8월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "9월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "10월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "11월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										{
											y: "12월",
											a: 0,
											b: 0,
											c: 0
										},	
										
										]
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
								<h2 class="panel-title">상품별 매출 현황(년간)</h2>
							</header>
							<div class="panel-body">
				
								<!-- Flot: Bars -->
								<div class="chart chart-md" id="flotBars" style="position: relative; padding: 0px;">
								</div>
								<script type="text/javascript">				
									var flotBarsData = [
										
											["PT 1:1", 9150000],
										
											["PT 1:3", 21600000],
										
											["PT 1:5", 5750000],
										
											["회원권 12개월", 500000],
										
											["회원권 1개월", 180000],
										
											["회원권 3개월", 630000],
										
											["회원권 6개월", 3120000],
																				
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
								<h2 class="panel-title">트레이너별 실적(년간)</h2>
							</header>
							<div class="panel-body">
					
								<!-- Morris: Donut -->
								<div class="chart chart-md" id="morrisDonut">
								</div>
								<script type="text/javascript">	
								var morrisDonutData = [
									
									{									
										label: "김주희",
										value: 11250000
									},	
									
									{									
										label: "김재희",
										value: 250000
									},	
									
									{									
										label: "여민진",
										value: 5500000
									},	
									
									{									
										label: "정휘재",
										value: 19500000
									},	
											
								];
								</script>
							</div>
						</section>	
					</div>
			</div></section>

			<!--/ 오른쪽 페이지  -->
		</div>

		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="sidebarRight.jsp" />
	</section>

	<!-- jsp파일들 -->
	<jsp:include page="footerjs.jsp" />
	<!-- chart관련 jsp파일 -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/morris/morris.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/sales.charts.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/fluid-meter.js"></script>
	<script>	
		var fm = new FluidMeter();
 		$(function() {  			
 			// 목표달성율 init 처리
 			fm.init({			
			  targetContainer: document.getElementById("fluid-meter"),			
			  fillPercentage: 0
			});
			fm.setPercentage(74);
		});	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
											<td width="22%"><h4 id="premonth" prv-num="0" style="cursor:pointer;">이전달</h4></td>
											<td width="2%"></td>
											<td width="22%"><h4><strong id="dateinfo"></strong></h4></td>
											<td width="2%"></td>
											<td width="22%"><h4 id="nextmonth" next-num="0" style="cursor:pointer;">다음달</h4></td>
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
																		<strong class="amount-sale" id="total_price" style="font-size:12px;">0</strong>
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
																		<strong class="amount-sale" id="card_price" style="font-size:12px;">0</strong>
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
																		<strong class="amount-sale" id="cash_price" style="font-size:12px;">0</strong>
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
													<div class="liquid-meter liquid-meter-loaded">
														<meter min="0" max="100" value="0" id="meter"></meter>
													</div>
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
								<div class='chart chart-md' id='morrisBar' style='position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);'>
								</div>	
									<script>
										var morrisBarData = [	
										<c:forEach items="${ slist }" var="s">
										{
											y: "${s.date}",
											a: ${s.totalPrice},
											b: ${s.memberPrice},
											c: ${s.ptPrice}
										},	
										</c:forEach>
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
								<div class="chart chart-md" id="flotBars" style="padding: 0px; position: relative;">
								</div>
								<script type="text/javascript">				
									var flotBarsData = [
										<c:forEach items="${ plist }" var="p">
											["${ p.productName }", ${ p.price }],
										</c:forEach>										
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
									<c:forEach items="${ rlist }" var="r">
									{									
										label: "${ r.trainerName }",
										value: ${ r.price }
									},	
									</c:forEach>		
								];
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
	<!-- 차트관련 js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/morris/morris.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/sales.charts.js"></script>
	<script>
		var saleslist = new Array();		 
		<c:forEach items="${slist}" var="item">		 
			saleslist.push("${item.date}" + "," + "${item.totalPrice}" + "," + "${item.cardPrice}" + "," + "${item.cashPrice}" + "," +"${item.salesGoal}");		 
 		</c:forEach>
 		
		var d = new Date();
		var m = d.getMonth();		
 		
 		$(function() { 			
 			//현재날짜 계산
 			setMonthSales(m+1); 
		});
 		
 		$('#premonth').click(function () { 
 			monthNum = $(this).attr("prv-num");
 			setMonthSales(parseInt(monthNum));	
 	  	});
 	  	
 	  	$('#nextmonth').click(function () { 
 			monthNum = $(this).attr("next-num")
 			setMonthSales(parseInt(monthNum));
 	  	});
 	  	
 	  	function setMonthSales(m){
 	  		var monthData = saleslist[m-1].split(",");
 			$("#dateinfo").text(monthData[0]);
 			$("#total_price").text(numberFormat(monthData[1]));
 			$("#card_price").text(numberFormat(monthData[2]));
 			$("#cash_price").text(numberFormat(monthData[3]));
 			$("#meter").attr("value", monthData[4]);
 			$('#premonth').attr("prv-num", parseInt(m)-1);
			$('#nextmonth').attr("next-num", parseInt(m)+1);	
		
			$('#meter').liquidMeter({
				shape: 'circle',
				color: '#0088CC',
				background: '#F9F9F9',
				fontSize: '24px',
				fontWeight: '600',
				stroke: '#F2F2F2',
				textColor: '#333',
				liquidOpacity: 0.9,
				liquidPalette: ['#333'],
				speed: 3000,
				animate: !$.browser.mobile
			});
			

 	  	}
 	  	
 		function numberFormat(inputNumber) {
 			return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 		}

		
	</script>
	
	
	
	
	
	
	
	
	
	
</body>
</html>
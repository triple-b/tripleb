<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesList</title>
	<style>
		.input-daterange-sale {
			width: auto;
			min-width: 16px;
			padding: 4px 5px;
			font-weight: normal;
			line-height: 1.428571429;
			text-align: center;
			text-shadow: 0 1px 0 #fff;
			vertical-align: middle;
			/*background-color: #eeeeee;*/
		}	
	</style>
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
				<!-- 매출 현황 -->										
				<section class="panel">
					<header class="panel-heading">
						<table width="100%">
							<tr>
								<td width="*">
									<h2 class="panel-title">매출 현황</h2>											
								</td>
								<td width="380px">											
									<div class="input-daterange-sale input-group" data-plugin-datepicker="">
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
										<input type="text" class="form-control" name="start">
										<span class="input-group-addon">to</span>
										<input type="text" class="form-control" name="end">
										
									</div>
								</td>
								<td width="300px">
									<div class="input-group">
										<input type="text" class="form-control">
										<div class="input-group-btn">
												<button tabindex="-1" class="btn btn-primary" type="button">검색</button>
												<button tabindex="-1" data-toggle="dropdown" class="btn btn-primary dropdown-toggle mr-sm" type="button" aria-expanded="false">
													<span class="caret"></span>
												</button>
												<ul role="menu" class="dropdown-menu pull-right">
													<li><a href="#">상품별</a></li>
													<li class="divider"></li>
													<li><a href="#">회원권 3개월</a></li>
													<li><a href="#">회원권 6개월</a></li>
													<li><a href="#">회원권 12개월</a></li>
													<li><a href="#">PT 1:1</a></li>
													<li><a href="#">PT 1:3</a></li>
													<li><a href="#">PT 1:5</a></li>
													<li class="divider"></li>
													<li><a href="#">트레이너별</a></li>
													<li class="divider"></li>
													<li><a href="#">김주희</a></li>
													<li><a href="#">김재희</a></li>
													<li><a href="#">정휘재</a></li>
												</ul>												
										</div>
									</div>										
								</td>
							</tr>
						</table>								
					</header>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-condensed mb-none">
								<thead>
									<tr>
										<th class="text-center">No</th>
										<th class="text-center">구매일</th>
										<th class="text-center">타입</th>
										<th class="text-center">상품명</th>
										<th class="text-center">트래이너</th>
										<th class="text-center">구매자</th>
										<th class="text-center">정가</th>
										<th class="text-center">판매금액</th>
										<th class="text-center">할인금액</th>
										<th class="text-center">현금</th>
										<th class="text-center">카드</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">1</td>
										<td class="text-center">2020-04-10</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">유재식</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center">2020-04-08</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">6개월</td>
										<td class="text-center">김재희</td>
										<td class="text-center">김태후</td>
										<td class="text-right">6000,000</td>
										<td class="text-right">6000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">6000,000</td>
										<td class="text-right">0</td>
									</tr>
									<tr>
										<td class="text-center">3</td>
										<td class="text-center">2020-04-07</td>
										<td class="text-center">웨어 상품</td>
										<td class="text-center">운동복1개월</td>
										<td class="text-center">정휘재</td>
										<td class="text-center">조인상</td>
										<td class="text-right">10,000</td>
										<td class="text-right">10,000</td>
										<td class="text-right">0</td>
										<td class="text-right">10,000</td>
										<td class="text-right">0</td>
									</tr>
									<tr>
										<td class="text-center">4</td>
										<td class="text-center">2020-04-06</td>
										<td class="text-center">락커 상품</td>
										<td class="text-center">락커3개월</td>
										<td class="text-center">정휘재</td>
										<td class="text-center">아이요</td>
										<td class="text-right">60,000</td>
										<td class="text-right">60,000</td>
										<td class="text-right">0</td>
										<td class="text-right">60,000</td>
										<td class="text-right">0</td>
									</tr>
									<tr>
										<td class="text-center">5</td>
										<td class="text-center">2020-04-06</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">대한</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<td class="text-center">5</td>
										<td class="text-center">2020-04-06</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">민국</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<tr>
											<td class="text-center">6</td>
											<td class="text-center">2020-04-06</td>
											<td class="text-center">회원권 상품</td>
											<td class="text-center">12개월</td>
											<td class="text-center">김주희</td>
											<td class="text-center">만세</td>
											<td class="text-right">1,000,000</td>
											<td class="text-right">1,000,000</td>
											<td class="text-right">0</td>
											<td class="text-right">0</td>
											<td class="text-right">1,000,000</td>
										</tr>
									</tr>
									<tr>
										<td class="text-center"></tdclass>7</td>
										<td class="text-center">2020-04-06</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">박지상</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<td class="text-center">8</td>
										<td class="text-center">2020-04-04</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">손흥만</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<td class="text-center">9</td>
										<td class="text-center">2020-04-03</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">조세후</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
									<tr>
										<td class="text-center">10</td>
										<td class="text-center">2020-04-03</td>
										<td class="text-center">회원권 상품</td>
										<td class="text-center">12개월</td>
										<td class="text-center">김주희</td>
										<td class="text-center">이작</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">1,000,000</td>
										<td class="text-right">0</td>
										<td class="text-right">0</td>
										<td class="text-right">1,000,000</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p style="height: 10px;"></p>
						<div class="panel panel-featured-right panel-featured-secondary" style="text-align: right;">
							<div class="widget-summary widget-summary-sm">
								<div class="widget-summary-col widget-summary-col-icon" style="padding-top: 15px;">
									<div class="summary-icon bg-secondary">
										<div class="btn-secondary" style="cursor: pointer;"><i class="fa fa-file-excel-o" title="엑셀로 저장"></i></div>			
									</div>
								</div>										
								<div class="widget-summary-col" style="margin-right: 20px;">
									<div class="summary" style="margin-right: 10px;">
										<h5 class="title">현금 : <i class="fa fa-krw"></i> 14,890.30</h5>	
										<h5 class="title" style="padding-bottom:5px;">카드 : <i class="fa fa-krw"></i> 0</h5>
										<div style="border-top-width: 1px;
										border-top-style: dotted;
										border-top-color: rgb(221, 221, 221);
										padding-top:5px;">
											<h4 class="title">총 매출액 : <strong class="amount"><i class="fa fa-krw"></i> 14,890.30</strong></h4>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>						
				</section>	
				<!-- / 매출 현황 -->					
				<!-- / 선택된 메뉴 표시 영역 -->
	
				
			<!--/ 오른쪽 페이지  -->
		</div>

		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />
	</section>

	<!-- jsp파일들 -->
	<jsp:include page="../common/footerjs.jsp" />
</body>
</html>
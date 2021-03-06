<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/daterangepicker.css">
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
									<div id="selectDate11" class="input-daterange input-group">
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
										<input type="text" class="form-control" name="startDate">
										<span class="input-group-addon">to</span>
										<input type="text" class="form-control" name="endDate">
									</div>
								</td>									
								<td width="300px">
									<div class="input-group">
										<input type="text" name="searchStr" class="form-control">
										<div class="input-group-btn">
												<button tabindex="-1" class="btn btn-primary" type="button" id="serchBtn">검색</button>
												<button tabindex="-1" data-toggle="dropdown" class="btn btn-primary dropdown-toggle mr-sm" type="button" aria-expanded="false">
													<span class="caret"></span>
												</button>
												<ul role="menu" class="dropdown-menu pull-right">
													<li><a href="#"><strong>상품별</strong></a></li>
													<li class="divider"></li>
													<c:forEach items="${ plist }" var="p">
														<li data-title="${ p.productName }" onclick="setSearchStr(this)"><a href="#">${ p.productName }</a></li>
													</c:forEach>	
													<li class="divider"></li>													
													<li><a href="#"><strong>트레이너별</strong></a></li>
													<li class="divider"></li>
													<c:forEach items="${ tlist }" var="t">
														<li data-title="${ t.trainerName }" onclick="setSearchStr(this)"><a href="#">${ t.trainerName }</a></li>
													</c:forEach>
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
										<th class="text-center">구매일</th>
										<th class="text-center">타입</th>
										<th class="text-center">상품명</th>
										<th class="text-center">트래이너</th>
										<th class="text-center">구매자</th>
										<th class="text-center">판매금액</th>
										<th class="text-center">결제수단</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ slist }" var="s">
										<tr>
											<td class="text-center">${ s.payDate }</td>
											<td class="text-center">${ s.productCategory }</td>
											<td class="text-center">${ s.productName }</td>
											<td class="text-center">${ s.memberTrainer }</td>
											<td class="text-center">${ s.memberName }</td>
											<td class="text-right">${ s.payPrice }</td>
											<td class="text-center">
												<c:choose>
	                    							<c:when test="${ s.payType eq 'card' }">카드</c:when>
	                    							<c:otherwise>현금</c:otherwise>
	                    						</c:choose>
											</td>
										</tr>
									</c:forEach>
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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/daterangepicker.js"></script>
	<script>	
	
		function setSearchStr(target) {
			var title = $(target).attr('data-title');
			$('input[name="searchStr"]').val(title);
		}
		
	 	$('#serchBtn').click(function () { 
	  		var searchStr = $('input[name="searchStr"]').val();
	  		alert(searchStr);
	  	}); 
	 	
	 	$(function() {		
	
			$('input[name="startDate"]').daterangepicker({
			  singleDatePicker: true,
			  showDropdowns: true,
		      locale: {format: 'YYYY-MM-DD'}  
			});
			
			$('input[name="endDate"]').daterangepicker({
				  singleDatePicker: true,
				  showDropdowns: true,
			      locale: {format: 'YYYY-MM-DD'}  
			});
	 		
	 	});

	</script>
</body>
</html>
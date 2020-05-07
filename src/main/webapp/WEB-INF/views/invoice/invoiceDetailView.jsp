<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.invoice-logo { width: 154px; height: 69px; }
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
					<h2>매출 관리</h2>
					<div class="right-wrapper pull-right">
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<!-- 계약서 상세보기 -->										
				<section class="panel">
					<div class="panel-body">
						<div class="invoice">
							<header class="clearfix">
								<div class="row">
									<div class="col-sm-6 mt-md">
										<h2 class="h2 mt-none mb-sm text-dark text-bold">INVOICE</h2>
										<h4 class="h4 m-none text-dark text-bold">#${ i.invoiceNumber }</h4>
									</div>
									<div class="col-sm-6 text-right mt-md mb-md">
										<address class="ib mr-xlg">
											${ c.companyName }
											<br/>
											${ c.companyAddress }
											<br/>
											${ c.companyPhone }
											<br/>
											${ c.companyEmail }
										</address>
										<div class="ib">
											<img class='invoice-logo' src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" alt="triple B" />
										</div>
									</div>
								</div>
							</header>
							<div class="bill-info">
								<div class="row">
									<div class="col-md-6">
										<div class="bill-to">
											<p class="h5 mb-xs text-dark text-semibold">To:</p>
											<address>
												${ i.invoicePname }
												<br/>
												${ i.invoicePaddress }
												<br/>
												${ i.invoicePphone }
												<br/>
												${ i.invoicePemail }
											</address>
										</div>
									</div>
									<div class="col-md-6">
										<div class="bill-data text-right">
											<p class="mb-none">
												<span class="text-dark">Invoice Date:</span>
												<span class="value">${ i.invoiceDate }</span>
											</p>
											<p class="mb-none">
												<span class="text-dark">Due Date:</span>
												<span class="value">${ i.invoiceDueDate }</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						
							<div class="table-responsive">
								<table class="table invoice-items">
									<thead>
										<tr class="h4 text-dark">
											<th id="cell-id" class="text-semibold">#</th>
											<th id="cell-item" class="text-semibold">Item</th>
											<th id="cell-item" class="text-semibold">Category</th>
											<th id="cell-desc" class="text-semibold" style="width:300px">Description</th>
											<th id="cell-price" class="text-center text-semibold">Price</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${ plist }" var="p">
											<tr>
												<td>${ p.templateItemNo }</td>
												<td class="text-semibold text-dark">${ p.templateItemName }</td>
												<td>${ p.templateParentItemName }</td>
												<td>${ p.templateItemDescription }</td>
												<td class="text-center"><i class="fa fa-krw"></i>${ p.templateItemPrice }</td>
											</tr>
										</c:forEach>																								
									</tbody>
									
								</table>
							</div>						
							<div class="invoice-summary">
								<div class="row">
									<div class="col-sm-4 col-sm-offset-8">								
										<table class="table h5 text-dark">
											<tbody>
												<tr class="h4">
													<td colspan="2">Grand Total</td>
													<td class="text-left"><i class="fa fa-krw"></i>${ i.invoiceTotalPrice }</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center mr-lg">
							<a href="download.do?target=invoice&targetno=${ i.invoiceNo }" class="btn btn-primary ml-sm"><i class="fa fa-file-excel-o"></i> Excel</a>
						</div>
					</div>
				</section>
				<!--/ 계약서 상세보기 -->		
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
				
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JS파일들 -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JS -->
</body>
</html>
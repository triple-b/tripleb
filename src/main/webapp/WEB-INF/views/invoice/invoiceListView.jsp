<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.tr-click { cursor: pointer; }
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
				<section class="panel">
						<header class="panel-heading">					
							<h2 class="panel-title">계약서</h2>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="datatable-details-invocie">
								<thead>
									<tr>
										<th>구매처</th>
										<th>구매번호</th>
										<th>구매상품</th>
										<th>가격</th>
										<th width="10%">구매일</th>
										<th width="15%">사용기간</th>
									</tr>
								</thead>
								<tbody>
									<jsp:useBean id="dueDate" class="java.util.Date"/>
									<c:forEach items="${ list }" var="i">										
										<jsp:setProperty name="dueDate" property="time" value="${ i.invoiceDueDate.time + 1000 * 60 * 60 * 24 * 364 }"/>										
										<c:choose>
                   							<c:when test="${ i.invoiceStatus eq 'N'}">
												<tr class="tr-click" data-url="${ i.invoicePurl }" data-addr="${ i.invoicePaddress }" data-tel="${ i.invoicePphone }" data-status="구매 취소 (취소일 : ${ i.invoiceCancelDate })" data-reason="${ i.invoiceCancelReason }"> 
                   							</c:when>
                   							<c:otherwise>
                   								<tr class="tr-click" data-url="${ i.invoicePurl }" data-addr="${ i.invoicePaddress }" data-tel="${ i.invoicePphone }" data-status="구매 완료" data-reason="null"> 
                   							</c:otherwise>
                   						</c:choose>											
													<td data-clickid="${ i.invoiceNo }">${ i.invoicePname }</td>
													<td class="text-center" data-clickid="${ i.invoiceNo }">${ i.invoiceNumber }</td>
													<td class="tr-click" data-clickid="${ i.invoiceNo }">${ i.invoiceItemList }</td>
													<td class="text-right" data-clickid="${ i.invoiceNo }"><fmt:formatNumber value="${ i.invoiceTotalPrice }" pattern="#,###" /></td>
													<td class="text-center" data-clickid="${ i.invoiceNo }">${ i.invoiceDate }</td>																							
													<td class="text-center" data-clickid="${ i.invoiceNo }">${ i.invoiceDueDate } ~ <fmt:formatDate value="${ dueDate }" pattern="yyyy-MM-dd"/></td>	
												</tr>	
									</c:forEach>						
								</tbody>
							</table>
						</div>
					</section>
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />	
		<!--/ 오른쪽 사이드 바 -->	
	</section>

	<!-- 공통으로 사용하는 js파일 -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->

</body>
</html>
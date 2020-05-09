<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
			.Machine{
				height:300px;
				overflow-y: visible;
				overflow-x: hidden;
			}
</style>
</head>
<body>
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
						<h2>시설점검</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

						<section class="panel">
							
							<header class="panel-heading">
								
								<div class="panel-btn" style="margin-bottom:10px;">
									<button type="button" class=" btn btn-primary" style="float:right ;">수정</button>
								</div>
						
								<h1 class="panel-title">헬스장 시설 점검표</h1>
							</header>
							<div class="panel-body">
								
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
											<th>점검시설</th>
											
											<th class="hidden-phone">점검부위</th>
											<th class="hidden-phone">점검일</th>
										</tr>
									</thead>
									<tbody>
									
											<tr>
												<td>레그프레스</td>
												<td class="center hidden-phone">오늘 몇번 벤치 고장</td>
												<td class="center hidden-phone">2020-04-21</td>
											</tr>
										
									</tbody>
								</table>
							</div>
						</section>
						
						
					<!-- end: page -->
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
	<script>
		$(function(){
			$("#datatable-default tbody tr").click(function(){
				location.href="detail.hmc?macno=" + $(this).children().eq(0).text();
			});
		});
	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
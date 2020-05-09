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
								
								<div div class="panel-btn" style="margin-bottom:10px;">
									<a class="modal-with-form btn btn-primary" style="float: right;"  href="#modalForm">점검</a>
								</div>
						
								<h1 class="panel-title">시설점검</h1>
							</header>
							<div class="panel-body">
								
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
											<th>No</th>
											<th>점검자</th>
											<th class="hidden-phone">점검 제목</th>
											<th class="hidden-phone">점검일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="ma">
											<tr>
												<td>${ma.machinAllChkNo}</td>
												<td>${ma.trainerNo}</td>
												<td class="center hidden-phone">${ma.machineTitle}</td>
												<td class="center hidden-phone">${ma.machineChkDate}</td>
											</tr>
										</c:forEach>	
									</tbody>
								</table>
							</div>
						</section>
						
						
					<!-- end: page -->
				</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
			
		<!-- start: page -->
				<section class="panel" >
						<!-- Modal Form -->
						<div id="modalForm" class="modal-block modal-block-primary mfp-hide">
							<section class="panel" style="width: 900px;">
								<header class="panel-heading">
									<h1 class="panel-title">시설점검작성</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">점검내용 요약</label>
											<div class="col-sm-9">
												<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
											</div>
										</div>
										<hr>
										<div class="Machine">
											<div class="Machine">
												<div class="col-md-6" style="width: 100%;">
													<section class="panel">
														<header class="panel-heading"></header>
														<div class="panel-body">
															<div class="table-responsive">
																<table class="table table-hover mb-none">
																	<thead>
																		<tr>
																			<th></th>
																			<th><input type="checkbox"></th>
																			<th>점검기구</th>
																			<th>점검부위</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td>1</td>
																			<td><input type="checkbox"></td>
																			<td><label class="col-sm-3 control-label">벤치</label></td>
																			<td><textarea rows="5" class="form-control" placeholder="Type your comment..." ></textarea></td>
																		</tr>
																		<tr>
																			<td>2</td>
																			<td><input type="checkbox"></td>
																			<td><label class="col-sm-3 control-label">파워렉</label></td>
																			<td><textarea rows="5" class="form-control" placeholder="Type your comment..." ></textarea></td>
																		</tr>
																		<tr>
																			<td>3</td>
																			<td><input type="checkbox"></td>
																			<td><label class="col-sm-3 control-label">턱걸이바</label></td>
																			<td><textarea rows="5" class="form-control" placeholder="Type your comment..." ></textarea></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</section>
												</div>
												
											</div>
										</div>
									</form>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary modal-confirm">등록</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</section>
						</div>
				</section>
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
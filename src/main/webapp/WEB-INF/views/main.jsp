<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>

	<section class="body">

	<!-- 상단 페이지 -->
	<jsp:include page="common/header.jsp" />

		<div class="inner-wrapper">
			<!-- 왼쪽메뉴 페이지 -->
			<jsp:include page="common/sidebarLeft.jsp" />
			
			<!-- 오른쪽 페이지 -->
			<section role="main" class="content-body">
				<header class="page-header">			
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
	
				<!-- start: page -->
				<div class="row">
						<div class="col-md-8">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
					
									<h2 class="panel-title">상품별 평균 현황 (월별)</h2>
								</header>
								<div class="panel-body">
					
									<!-- Morris: Bar -->
									<div class="chart chart-md" id="morrisBar"></div>
					
								</div>
							</section>
						</div>

						

						<div class="col-md-4">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
			
									<h2 class="panel-title">전체 달성률 (월별)</h2>
								</header>
								<div class="panel-body">
									<div class="row text-center">
										<div class="col-md-6" style="margin-right:auto; margin-left:auto; width:100%; height:350px;">
											<div class="circular-bar" style="margin-top:15%;">
												<div class="circular-bar-chart" data-percent="${ goal }" data-plugin-options='{ "barColor": "#0088CC", "delay": 300 }'>
													<strong>달성률</strong>
													<label><span class="percent">${ goal }</span>%</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
					
					

					<div class="row">

						<div class="col-md-6 col-lg-12 col-xl-12">
							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-life-ring"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">진행 수업</h4>
														<div class="info">
															<strong class="amount">${ current }개</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="student.jst">(view all)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-usd"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">한 달 이내 신규 회원</h4>
														<div class="info">
															<strong class="amount">${ newStudent }명</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="student.jst">(VIEW ALL)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-tertiary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-tertiary">
														<i class="fa fa-shopping-cart"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">수업 진행 중인 회원</h4>
														<div class="info">
															<strong class="amount">${ currentStudent }명</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="student.jst">(VIEW ALL)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-quartenary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-quartenary">
														<i class="fa fa-user"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">7일 이내 만료 임박 회원</h4>
														<div class="info">
															<strong class="amount">${ expStudent }명</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="student.jst">(VIEW ALL)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
					</div>

					

					<div class="row">
						<div class="col-xl-6 col-lg-6">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>

									<h2 class="panel-title"><a href="calendar.uca">일정관리</a></h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<header class="panel-heading bg-primary">

											<div class="widget-profile-info">
												<div class="profile-picture">
													<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ loginUser.trainerThumbnail}">
												</div>
												<div class="profile-info">
													<h4 class="name text-semibold">${loginUser.trainerName } 트레이너</h4>
													<h5 class="role">
														<c:choose>
															<c:when test="${ loginUser.trainerGrade eq 'N'}">
															사원
															</c:when>
															<c:when test="${ loginUser.trainerName eq 'T'}">
															팀장
															</c:when>
															<c:otherwise>
															대표
															</c:otherwise>
														</c:choose>
													</h5>
													<div class="profile-footer">
														<a href="profileForm.utr">(edit profile)</a>
													</div>
												</div>
											</div>

										</header>
										<div id="accordion">
											<div class="panel panel-accordion panel-accordion-first">
												<div id="collapse1One" class="accordion-body collapse in">
													<div class="panel-body">
														<ul class="widget-todo-list">
														<c:forEach items="${ calendar }" var="c">
															<li>
																<p class="todo-label" for="todoListItem1"><span>${ c.calTitle } : ${ c.calContent }</span></p>
															</li>
														</c:forEach>
														<c:if test="${ empty calendar }">
																<p class="todo-label" for="todoListItem1"><span>예정된 일정이 없습니다.</span></p>
														</c:if>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</section>

								</div>
							</section>
						</div>

						<div class="col-xl-6 col-lg-6">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>

									<h2 class="panel-title"><a href="List.no">공지사항</a></h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<div id="accordion">
											<div class="panel panel-accordion panel-accordion-first">
												<div id="collapse1One" class="accordion-body collapse in">
													<div class="panel-body">
														<ul class="widget-todo-list">
															<c:forEach items="${ notice }" var="n">
															<li>
																<p class="todo-label" for="todoListItem1"><span id="mNoticeNo" style="display:none">${ n.noticeNo}</span> ${ n.noticeTitle }</p>
															</li>
															</c:forEach>
															<c:if test="${ empty notice }">
																<p class="todo-label" for="todoListItem1"><span>작성된 공지사항이 없습니다.</span></p>
															</c:if>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</section>

								</div>
							</section>
						</div>
					</div>
					
					
				
				<!-- end: page -->
			</section>
		</div>

		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="common/sidebarRight.jsp" />
	</section>

	<!-- jsp파일들 -->
	<jsp:include page="common/footerjs.jsp" />
	<!-- mainJs -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/morris/morris.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/mainDashBoard.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/dashboard/examples.dashboard.js"></script>
</body>
</html>
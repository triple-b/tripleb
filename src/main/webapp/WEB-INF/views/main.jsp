<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
										<a href="#" class="fa fa-times"></a>
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
										<a href="#" class="fa fa-times"></a>
									</div>
			
									<h2 class="panel-title">달성률 (월별)</h2>
								</header>
								<div class="panel-body">
									<div class="row text-center">
										<div class="col-md-6" style="margin-right:auto; margin-left:auto; width:100%; height:350px;">
											<div class="circular-bar" style="margin-top:15%;">
												<div class="circular-bar-chart" data-percent="85" data-plugin-options='{ "barColor": "#0088CC", "delay": 300 }'>
													<strong>달성률</strong>
													<label><span class="percent">${ one }</span>%</label>
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
															<strong class="amount">${ two }</strong>
															<span class="text-primary">(14 unread)</span>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(view all)</a>
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
														<h4 class="title">신규 회원</h4>
														<div class="info">
															<strong class="amount">${ three }</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(withdraw)</a>
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
														<h4 class="title">진행 회원</h4>
														<div class="info">
															<strong class="amount">${ four }</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(statement)</a>
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
														<h4 class="title">만료 임박 회원</h4>
														<div class="info">
															<strong class="amount">3765</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase">(report)</a>
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
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">일정</h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<header class="panel-heading bg-primary">

											<div class="widget-profile-info">
												<div class="profile-picture">
													<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ loginUser.trainerThumbnail}">
												</div>
												<div class="profile-info">
													<h4 class="name text-semibold">김주희 트레이너</h4>
													<h5 class="role">사원</h5>
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
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
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
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">공지사항</h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<div id="accordion">
											<div class="panel panel-accordion panel-accordion-first">
												<div id="collapse1One" class="accordion-body collapse in">
													<div class="panel-body">
														<ul class="widget-todo-list">
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
															<li>
																<p class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></p>
															</li>
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
</body>
</html>
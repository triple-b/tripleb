<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside id="sidebar-left" class="sidebar-left">
	
		<div class="sidebar-header">
			<div class="sidebar-title">
				전체메뉴
			</div>
			<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>
	
		<div class="nano">
			<div class="nano-content">
				<nav id="menu" class="nav-main" role="navigation">
					<ul class="nav nav-main">
						<li class="nav-active">
							<a href="${ pageContext.servletContext.contextPath }">
								<i class="fa fa-home" aria-hidden="true"></i>
								<span>홈</span>
							</a>
						</li>
						<li class="nav-active">
							<a href="list.ume">
								<i class="fa fa-group" aria-hidden="true"></i>
								<span>회원관리</span>
							</a>
						</li>
						<li class="nav-parent">
							<a>
								<i class="fa fa-user" aria-hidden="true"></i>
								<span>트레이너관리</span>
							</a>
							<ul class="nav nav-children">
								<li>
									<a href="trainerList.jtr">
										 트레이너현황
									</a>
								</li>
								<li>
									<a href="">
										 휴가관리
									</a>
								</li>
								<li>
									<a href="classList.jcl">
										 수업관리
									</a>
								</li>
								<li>
									<a href="selectSugList.jsu">
										 건의사항
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-parent">
							<a>
								<i class="fa fa-list-ul" aria-hidden="true"></i>
								<span>서비스관리</span>
							</a>
							<ul class="nav nav-children">
								<li>
									<a href="productList.jpr">
										 상품관리
									</a>
								</li>
								<li>
									<a href="">
										 PT회원관리
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-parent">
							<a>
								<i class="fa fa-building-o" aria-hidden="true"></i>
								<span>시설관리</span>
							</a>
							<ul class="nav nav-children">
								<li>
									<a href="mcList.mcm?type=leftmenu">
										 시설관리
									</a>
								</li>
								<li>
									<a href="equipChecklist.eq">
										 비품관리
									</a>
								</li>
								<li>
									<a href="mcCheck.hmc">
										 시설점검
									</a>
								</li>
								<li>
									<a href="lockerlist.hlo">
										 락커관리
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-parent">
							<a>
								<i class="fa fa-bar-chart-o" aria-hidden="true"></i>
								<span>매출관리</span>
							</a>
							<ul class="nav nav-children">
								<li>
									<a href="saleslist.do">
										 매출현황
									</a>
								</li>
								<li>
									<a href="saleschart.do">
										 매출통계
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-active">
							<a href="calendar.uca">
								<i class="fa fa-calendar" aria-hidden="true"></i>
								<span>일정관리</span>
							</a>
						</li>
						<li class="nav-active">
							<a href="List.no">
								<i class="fa fa-bullhorn" aria-hidden="true"></i>
								<span>공지사항</span>
							</a>
						</li>
						<li class="nav-parent">
							<a>
								<i class="fa fa-bar-chart-o" aria-hidden="true"></i>
								<span>템플릿관리</span>
							</a>
							<ul class="nav nav-children">
								<li>
									<a href="list.mtp">
										 템플릿설정
									</a>
								</li>
								<li>
									<a href="list.miv">
										 계약서관리
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
	
				<hr class="separator" />
	
			</div>
	
		</div>
	
	</aside>
</body>
</html>
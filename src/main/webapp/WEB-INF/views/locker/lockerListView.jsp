<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
				.ggggg{
					display: flex;
					-ms-flex-wrap: wrap;
					flex-wrap: wrap;
					
					box-sizing: border-box;
					
					
				}	
				.machin-rightbar{
					border-radius:2px;
					position:absolute;
					right:0px;
					height:calc(-20px + 100%);
					width:18%;
					padding:15px;
					margin:10px;
					box-sizing:border-box;
					overflow:hidden;
					color:white;
					background-color: #044f67;
					margin-top: 0px;
				}
				.zzz{
					margin: 12px;
				}
				.locker-main{
					height: 1398.800px;
					width: 102%;
					background-image: none;
					background-position-x: 0%;
					background-position-y: 0%;
					background-repeat: repeat;
					background-attachment: scroll;
					background-clip: border-box;
					background-origin: padding-box;
					background-size: auto;
					background-color: rgb(242, 242, 242);
				}
				.inner-toolbar>ul>li>select{
				width:120px;
					outline:none;
					font-size:10pt;
					float:left;
					color:white;
					
					background:#2e2e2e;
					margin:10px;
					margin-left:20px;
					border:1px solid #ffffff;
					height: 40px;
				}
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
			<section role="main" class="content-body" style="padding: 0px;">
						<header class="page-header">
							<h2>락커관리</h2>
						
							<div class="right-wrapper pull-right">
								<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
							</div>
						</header>
	
						<!--락커 메인-->
						<div class="inner-toolbar clearfix locker-header">
							<ul>
								<li style="padding: 0px;">
									<select>
										<option>공용락커</option>
										<option>남자</option>
										<option>여자</option>
									</select>
								</li>
								
								<li class="right" data-sort-source data-sort-id="media-gallery" >
									<ul class="nav nav-pills nav-pills-primary">
										
										<li class="active">
											<a class="modal-with-form btn btn-default"  style="float:right; " href="#modalForm2" >락커룸생성</a>
										</li>
										<li>
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm1">락커룸수정</a>
											
										</li>
										<li>
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm2">락커룸삭제</a>
											
										</li>
										<li class="active">
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm">일괄등록</a>
											
										</li>
									</ul>
								</li>
							</ul>
						</div>					

					<section class="panel" style="width: 84%;margin-top: 14px;" >
							
						<header class="panel-heading" style="width: 100%;">

							<h1 class="panel-title">락커관리</h1>
						</header>
						<div class="panel-body">
							<div class="aaaaa" style="width: 100%;">
								<div class="ggggg"  >
										<div class="zzz">
											<div class="card h-100">
												<div class="card-body">
													<h4 class="card-title">
													
													</h4>
												</div>
											<a href="#"><img class="card-img-top" src="http://placehold.it/300x200" alt=""></a>
											</div>
										</div>

										<div class="zzz">
											<div class="card h-100">
												<div class="card-body">
													<h4 class="card-title">
													
													</h4>
												</div>
											<a href="#"><img class="card-img-top" src="http://placehold.it/300x200" alt=""></a>
											</div>
										</div>
										<div class="zzz">
											<div class="card h-100">
												<div class="card-body">
													<h4 class="card-title">
													
													</h4>
												</div>
											<a href="#"><img class="card-img-top" src="http://placehold.it/300x200" alt=""></a>
											</div>
										</div>
										<div class="zzz">
											<div class="card h-100">
												<div class="card-body">
													<h4 class="card-title">
													
													</h4>
												</div>
											<a href="#"><img class="card-img-top" src="http://placehold.it/300x200" alt=""></a>
											</div>
										</div>
										<div class="zzz">
											<div class="card h-100">
												<div class="card-body">
													<h4 class="card-title">
													
													</h4>
												</div>
											<a href="#"><img class="card-img-top" src="http://placehold.it/300x200" alt=""></a>
											</div>
										</div>
									
									</div>
								</div>
							
							</div>
						
						</section>
					</main>	
				</section>
				
				
		
					
			<!-- 오른쪽 content 페이지 -->
		</div>
	<main class="locker-body" >
				<menu id="content-menu" class="inner-menu" role="menu" style="right:0; left: auto; width: 329.9px; margin-top: 52px;">
					<div class="nano">
						<div class="nano-content">

							<div class="inner-menu-toggle-inside">
								<a href="#" class="inner-menu-collapse">
									<i class="fa fa-chevron-up visible-xs-inline"></i><i class="fa fa-chevron-left hidden-xs-inline"></i> Hide Options
								</a>
								<a href="#" class="inner-menu-expand" data-open="inner-menu">
									Show Options <i class="fa fa-chevron-down"></i>
								</a>
							</div>

							<div class="inner-menu-content">

								<h1 class="lockerNum">락커 번호</h1>
									<h3>락커 상태</h3>
										<div class="form-group">
											<div class="row">
												<label class="col-xs-12 control-label" for="longitude">회원명</label>
												<div class="col-xs-12">
													<input id="mapid" name="mapid" class="form-control" value="회원명" type="text" data-builder-field="mapid">
												</div>
											</div>
										</div>

										<hr class="separator" />

										<p class="title">Locker Center</p>
										
										<div class="form-group">
											<div class="row">
												<label class="col-xs-12 control-label" for="latitude">등록 일</label>
												<div class="col-xs-12">
													<input id="latitude" name="latitude" class="form-control" type="date" data-builder-field="latlng">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label class="col-xs-12 control-label" for="longitude">시작 일</label>
												<div class="col-xs-12">
													<input id="longitude" name="longitude" class="form-control" type="date" data-builder-field="latlng">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label class="col-xs-12 control-label" for="zoomLevel">종료 일</label>
												<div class="col-xs-12">
													<input id="longitude" name="longitude" class="form-control" type="date" data-builder-field="latlng">
												</div>
											</div>
										</div>

										<hr class="separator" />

										<div class="form-group">
											<ul id="MarkersList" class="list-markers list-unstyled mb-lg hidden">
											</ul>

											<div class="row">
												<div class="col-sm-6">
													<button id="MarkerRemoveAll" class="btn btn-primary btn-block mb-lg" type="button">락커 등록</button>
												</div>
												<div class="col-sm-6">
													<a class="modal-with-form btn btn-primary"  style="width: 117.24px;" href="#modalForm3">락커이동</a>
												</div>
											</div>
										</div>

										<hr class="separator" />
								
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6">
													<button class="btn btn-primary btn-block mb-lg" type="button" data-toggle="modal" data-target="#ModalGetCode">락커 회수</button>
												</div>
												<div class="col-sm-6">
													<button class="btn btn-primary btn-block mb-lg" type="button" data-toggle="modal" data-target="#ModalPreview">락커 고장</button>
												</div>
											</div>
										</div>
						    </div>
						</div>
					</div>
				</div>
			</menu>
		</main>
		
		<!--/ 전체 레이어 -->
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<!-- Vendor -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery/jquery.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.row.with.details.js"></script>
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.tabletools.js"></script>
			<!-- Vendor -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery/jquery.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/nanoscroller/nanoscroller.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.js"></script>
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
			
			<!-- Specific Page Vendor -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/pnotify/pnotify.custom.js"></script>
			
			<!-- Theme Base, Components and Settings -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.js"></script>
			
			<!-- Theme Custom -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.custom.js"></script>
			
			<!-- Theme Initialization Files -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/theme.init.js"></script>
	
	
			<!-- Examples -->
			<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	<!-- 현재 페이지에서만 사용하는 JSP -->
	
</body>
</html>
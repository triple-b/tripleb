<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/modernizr/modernizr.js"></script>



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
			<section role="main" class="content-body">
				<header class="page-header" style="margin-bottom: 0px;">
						<h2>시설관리</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<div class="inner-toolbar clearfix locker-header" style="margin-top: 4px;">
						<ul class="nav nav-pills nav-pills-primary">
							<li class="active" style="margin-top: 8px;">
								<a class="modal-with-form btn btn-default"  style="float:right;" href="#modalForm4">기구종류조회</a>
								
							</li>
							<li class="active" style="margin-top: 8px;">
								<a class="modal-with-form btn btn-default"  style="float:left;" href="#modalForm2" >기구종류등록</a>
							</li>
							
							<li class="right" data-sort-source data-sort-id="media-gallery" style="margin-top: 8px;">
								<ul class="nav nav-pills nav-pills-primary">

									<li>
										<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm1">수정</a>
									</li>
									<li>
										<button class="modal-with-form btn btn-default"  style="float:right" onclick="deletemcm()">삭제</button>
									</li>
									
								</ul>
							</li>
						</ul>
					</div>
			   

					<section class="panel" style="width: 100%;margin-top: 14px;" >
							
						<header class="panel-heading" style="width: 100%;">

							<h1 class="panel-title">기구관리</h1>
						</header>
						<div class="panel-body">
							<div class="row mg-files" data-sort-destination data-sort-id="media-gallery">
								<table class="Mcmanagement-table" id="Mcmanagement-list">
									<c:forEach items="${list}" var="m">
										<div class="isotope-item document col-sm-6 col-md-4 col-lg-3" id="Mcmanagementtlqkf">
											<div class="thumbnail">
												<div class="thumb-preview">
													<input type="hidden" value="${m.machineNo}" >
													<a class="thumb-image" href="assets/images/projects/project-1.jpg"></a>
														<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${m.thumbChange}" class="img-responsive" alt="Project">
													</a>
													<div class="mg-thumb-options">
														
														<div class="mg-toolbar">
															<div class="mg-option checkbox-custom checkbox-inline">
																<input type="checkbox" id="file_1" name="machinecheck1" onclick="twoCheckbox(this)" value="${m.machineNo}">
																<label for="file_1">SELECT</label>
															</div>
														</div>
														<h5 class="mg-title text-semibold">${m.mcName}</h5>
													</div>
													<div class="mg-description">
														<small class="pull-left text-muted">${m.machineNo}</small>
														<small class="pull-right text-muted">${m.machineRegistDate}</small>
													</div>	
												</div>
											</div>
										</div>
									</c:forEach>
								</table>
							</div>
							
						</div>
						
					</section>
				</main>	
			<!-- 오른쪽 content 페이지 -->
		</div>
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
								<h1 class="lockerNum">기구 상태</h1>
								<img class="machin" src="http://placehold.it/300x200" alt="">
								<hr class="separator" />
								<div class="form-group">
									<div class="row">
										<label class="col-xs-12 control-label" for="longitude">회원명</label>
										<div class="col-xs-12">
											<input id="mapid" name="mapid" class="form-control" value="회원명" type="text" data-builder-field="mapid">
										</div>
									</div>
								</div>

								<hr class="separator" />

								<p class="title">Machine Center</p>
								
								<div class="form-group">
									<div class="form-group">
										<div class="row">
											<label class="col-xs-12 control-label" for="longitude">기구NO</label>
											<div class="col-xs-12">
												<input id="mapid" name="mapid" class="form-control" value="1" type="text" data-builder-field="mapid">
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="row">
											<label class="col-xs-12 control-label" for="longitude">기구명</label>
											<div class="col-xs-12">
												<input id="mapid" name="mapid" class="form-control" value="벤치프레스" type="text" data-builder-field="mapid">
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<div class="row">
											<label class="col-xs-12 control-label" for="longitude">등록 날짜</label>
											<div class="col-xs-12">
												<input id="mapid" name="mapid" class="form-control" value="2020-04-23" type="text" data-builder-field="mapid">
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<div class="row">
											<label class="col-xs-12 control-label" for="longitude">고장상태</label>
											<div class="col-xs-12">
												<input id="mapid" name="mapid" class="form-control" value="벤치 어디가 어느부분이 아파파파파파" type="text" data-builder-field="mapid">
											</div>
										</div>
									</div>
									
									<hr class="separator" />

									<div class="form-group">
										<ul id="MarkersList" class="list-markers list-unstyled mb-lg hidden">
										</ul>
	
										<div class="row">
											
											<div class="col-sm-6">
												<a class="modal-with-form btn btn-primary"  style="width: 117.24px;" href="#modalForm3">고장</a>
											</div>
										</div>
									</div>
	
									<hr class="separator" />
							</div>
						</div>
					</div>
				</menu>
		<!--/ 전체 레이어 -->
		<!-- 기구 관리 등록 -->
					<section class="panel">

						<!-- Modal Form -->
						<div id="modalForm3" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">시설기구고장등록</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
										
										<hr>
										<div class="Machine">
											<div class="form-group">
												<label class="col-sm-3 control-label">No</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
										
											
											<div class="form-group">
												<label class="col-sm-3 control-label">기구명</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">기구고장설명</label>
												<div class="col-sm-9">
													<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
												</div>
											</div>
										</div>
									</form>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary modal-confirm">완료</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</section>
						</div>

				</section>
				<!--기구 종류 조회-->
				<section class="panel" style="margin-bottom: 0px;">
					<!-- Modal Form -->
					<div id="modalForm4" class="modal-block modal-block-primary mfp-hide">
						<section class="panel" style="width: 900px;">
							<header class="panel-heading">
								<h1 class="panel-title">기구종류조회</h1>
							</header>
							<div class="panel-body">
								<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
									<div class="panel-body">
										<table class="table table-bordered table-striped mb-none MachineArea" id="datatable-default">
											<thead>
												<tr>
													<th></th>
													<th>No</th>
													<th>기구명</th>
													<th class="hidden-phone">등록일짜</th>
													<th class="hidden-phone">기구설명</th>
													<th class="hidden-phone">첨부파일</th>
													
												</tr>
											</thead>
											<tbody>
												
											</tbody>
										</table>
									</div>
								</form>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button class="btn btn-primary" onclick="insertmcm()">등록</button>
										<button class="btn btn-primary" onclick="deletemc()">삭제</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</section>
					</div>

				
			</section>
	
				
				<!--기구 등록-->
				<section class="panel" style="margin-bottom: 0px;">

					

					<!-- Modal Form -->
					<div id="modalForm2" class="modal-block modal-block-primary mfp-hide">
						<section class="panel">
							<header class="panel-heading">
								<h1 class="panel-title">기구종류등록</h1>
							</header>
							<div class="panel-body">
								<form id="insertMachine" method="post" action="insert.mc" enctype="multipart/form-data">
									<hr>
									<table align="center">
										<tr>
											<th><label for="title">기구명</label></th>
											<td><input type="text" name="mcName" class="form-control" placeholder="" required/></td>
										</tr>
										<tr>
											<th><label for="upfile">첨부파일</label></th>
											<td><input type="file" id="upfile" class="" name="uploadFile"></td>
										</tr>
									   
										<tr>
											<th colspan="2"><label for="content">기구설명</label></th>
										</tr>
										<tr>
											<th colspan="2"><textarea rows="5" name="mcExplain" class="form-control" placeholder="기구설명을 작성해주세요.." ></textarea></th>
										</tr>
									</table>
								
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary"  type="submit">등록</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</form>
						</section>
					</div>

				
			</section>
				<!-- 기구 관리 삭제 -->	
				
				<section class="panel"   style="margin-bottom: 0px;" >

					

					<!-- Modal Form -->
					<div id="modalForm6" class="modal-block modal-block-primary mfp-hide">
						<section class="panel">
							<header class="panel-heading">
								<h1 class="panel-title">기구삭제</h1>
							</header>
							<div class="panel-body">
								<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
									
									<hr>
									<div class="Machine">
										
										
										<div class="form-group">
											<label class="col-sm-3 control-label">기구명</label>
											<div class="col-sm-9">
												<input type="text" name="Quantity" class="form-control" placeholder="" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">기구설명</label>
											<div class="col-sm-9">
												<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
											</div>
										</div>
										
									</div>
								</form>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button class="btn btn-primary modal-confirm">확인</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</section>
					</div>

				
			</section>

				<!-- 기구 관리 수정 -->
				<section class="panel" style="margin-bottom: 0px;">

						

						<!-- Modal Form -->
						<div id="modalForm1" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">시설기구수정</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
										
										<hr>
										<div class="Machine">
											
											
											<div class="form-group">
												<label class="col-sm-3 control-label">수정날짜</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">기구명</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">기구설명</label>
												<div class="col-sm-9">
													<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
												</div>
											</div>
										</div>
									</form>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary modal-confirm">수정</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</section>
						</div>

					
				</section>

				<!-- 기구 관리 등록 -->
				<section class="panel" style="margin-bottom: 0px;">

					

					<!-- Modal Form -->
					<div id="modalForm" class="modal-block modal-block-primary mfp-hide">
						<section class="panel">
							<header class="panel-heading">
								<h1 class="panel-title">시설기구등록</h1>
							</header>
							<div class="panel-body">
								<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
									<div class="form-group mt-lg">
										<label class="col-sm-3 control-label">기구명</label>
										<div class="col-sm-9">
											<select name="Quantity" class="form-control" placeholder="" >
												<option>벤치 </option>
												<option>레그프레스 </option>
												<option>파워렉 </option>
											</select>
										</div>
									</div>
									<hr>
									<div class="Machine">
										
										<div class="form-group">
											<label class="col-sm-3 control-label">기구설명</label>
											<div class="col-sm-9">
												<input type="text" rows="5" class="form-control" placeholder="Type your comment..." readonly></input>
											</div>
										</div>
									</div>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary modal-confirm">등록</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</form>
						</section>
					</div>
			</section>
			
			<!-- 기구 고장 등록 -->
					<section class="panel">

						<!-- Modal Form -->
						<div id="modalForm3" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">시설기구고장등록</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
										
										<hr>
										<div class="Machine">
											<div class="form-group">
												<label class="col-sm-3 control-label">No</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
										
											
											<div class="form-group">
												<label class="col-sm-3 control-label">기구명</label>
												<div class="col-sm-9">
													<input type="text" name="Quantity" class="form-control" placeholder="" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">기구고장설명</label>
												<div class="col-sm-9">
													<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
												</div>
											</div>
										</div>
									</form>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary modal-confirm">완료</button>
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
			selectList();
		});
		function selectList(){
				$.ajax({
					url:"mclist.mc",
					type:"get",
					success:function(list){
						
						
						var value = "";
						$.each(list, function(i, obj){
							value += "<tr>" +   
										"<th><input type='checkbox' name='machinecheck' onclick='oneCheckbox(this)' value=" + obj.mcNo + "></th>" +
										"<th>" + obj.mcNo + "</th>" +
										"<th>" + obj.mcName + "</th>" +
										"<th>" + obj.mcDate + "</th>" +
										"<th>" + obj.mcExplain + "</th>" +
										"<th>" + obj.thumbnail + "</th>" +
									 "</tr>"	
						});
						$(".MachineArea tbody").html(value);
						
					},error:function(){
						console.log("댓글 리스트 조회용 ajax 통신 실패")
					}
					
				});
				
				
			}
	</script>
	
	
	
	<script>
	
	var machinecheckID = "";
		
    function oneCheckbox(a){

        var obj = document.getElementsByName("machinecheck");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }
        
        machinecheckID = a.value;
    }
    
    function deletemcm() {
    	location.href="delete.mcm?mano="+machinecheckNo;
    }
    function deletemc() {
    	location.href="delete.mcm?mcno="+machinecheckID;
    }
    function insertmcm() {
    	location.href="insert.mcm?mcno="+machinecheckID;
    }
	
	var machinecheckNo = "";
	
    function twoCheckbox(a){

        var obj = document.getElementsByName("machinecheck1");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }
        
        machinecheckNo = a.value;
    }
	</script>
	<script>
		$(function(){
			$("#Mcmanagementtlqkf").click(function(){
				location.href="select.mcm?mano=" + $(this).children().children().children().eq(0).val();
			});
		});
	</script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	
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
</body>
</html>
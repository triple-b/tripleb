<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	equipcheckID = "1111";
</script>
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
						<h2>비품관리</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
						<section class="panel">

						
						<div class="col-md-6" style="width: 100%;">
							<div class="tabs tabs-primary">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#popular1" data-toggle="tab"> 비품관리</a>
									</li>
									<li>
										<a href="#recent1" data-toggle="tab">비품점검</a>
									</li>
								</ul>
								<div class="tab-content">
									<div id="popular1" class="tab-pane active">
										
							<section class="panel">
								
								<header class="panel-heading">
									<div class="panel-btn" style="margin-bottom:10px;">
										
										<button class=" btn btn-default" style="float:right; margin-right:10px;" onclick="deletetv()">삭제</button>
										<button class="btn btn-primary" style="float:right; margin-right:10px;" onclick="update()">수정</button>
										<a class="modal-with-form btn btn-primary"  style="float:right; margin-right:10px;" href="#modalForm">등록</a>
									
									</div>
									<h1 class="panel-title">비품관리</h1>
									</header>
									
								<div class="panel-body">
									
									<table class="table table-bordered table-striped mb-none" id="datatable-default">
										<thead>
											<tr>
												<th></th>
												<th>비품번호</th>
												<th>비품명</th>
												<th class="hidden-phone">총수량</th>
												<th class="hidden-phone">등록일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="e">
												<tr>
													<td><input type="checkbox" name="equipcheck" value="${e.equipmentNo }" onclick="oneCheckbox(this)"></td>
													<td>${e.equipmentNo}</td>
													<td>${e.equipmentName}</td>
													<td class="center hidden-phone">${e.equipmentStock}</td>
													<td class="center hidden-phone">${e.equipmentRegistDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</section>
									</div>
									<div id="recent1" class="tab-pane">
										<section class="panel">
								
	
											<header class="panel-heading">
				
												<div class="panel-btn" style="margin-bottom:10px;">
													<button class="btn btn-default" style="float:right" onclick="update1()">수정</button>
													
													<a class="modal-with-form btn btn-primary" style="float:right; margin-right:10px;" href="#modalForm2">등록</a>
												</div>
													<h1 class="panel-title">비품점검</h1>
												</header>
												
											<div class="panel-body">
												
												<table class="table table-bordered table-striped mb-none" id="datatable-default1">
													<thead>
														<tr>
															<th></th>
															<th>비품점검번호</th>
															<th>분실</th>
															<th>파손</th>
															<th class="hidden-phone">총재고</th>
															<th class="hidden-phone">점검일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${elist}" var="ec">
															<tr>
																<td><input type="checkbox" value="${ec.eqcheckNo}" name="equipcheck1" onclick="oneCheckbox1(this)"></td>
																<td>${ec.eqcheckNo}</td>
																<td>${ec.lost}</td>
																<td>${ec.broken}</td>
																<td class="center hidden-phone">${ec.equipmentStock}</td>
																<td class="center hidden-phone">${ec.mtDate}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!-- start: page -->

			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
			<!-- 비품관리등록 -->
			<div id="modalForm" class="modal-block modal-block-primary mfp-hide">
				<section class="panel">
					<header class="panel-heading">
						<h2 class="panel-title">비품관리생성</h2>
					</header>
					<div class="panel-body">
						<form id="demo-form-1" class="form-horizontal mb-lg" method="post" action="insert.eq" novalidate="novalidate">
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">점검자</label>
								<div class="col-sm-9">
									<input type="text" value="${loginUser.trainerName}" name="trainerName" readonly class="form-control" placeholder="." />
								</div>
							</div>
							
							<hr>
							<div class="Machine">
									<div class="form-group mt-lg">
										<label class="col-sm-3 control-label">비품명</label>
										<div class="col-sm-9">
											<input type="text" name="equipmentName" class="form-control" placeholder="." />
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">총재고</label>
										<div class="col-sm-9">
											<input type="text" name="equipmentStock" class="form-control" placeholder="" />
										</div>
									</div>
									<hr>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-primary">추가</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</form>
				</section>
			</div>

				<!-- 비품점검 등록 -->
				<div id="modalForm2" class="modal-block modal-block-primary mfp-hide">
					<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">비품등록</h2>
						</header>
						<div class="panel-body">
							<form id="demo-form-2" class="form-horizontal mb-lg" method="post" action="insert.epc" novalidate="novalidate">
								<div class="form-group mt-lg">
									<label class="col-sm-3 control-label">비품명</label>
									<div class="col-sm-9">
										<input type="text" name="equipmentName" class="form-control" placeholder="." />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">분실</label>
									<div class="col-sm-9">
										<input type="text" name="lost" class="form-control" placeholder="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">파손</label>
									<div class="col-sm-9">
										<input type="text" name="broken" class="form-control" placeholder="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">총재고</label>
									<div class="col-sm-9">
										<input type="text" name="equipmentStock" class="form-control" placeholder="" />
									</div>
								</div>
								
								<input type="hidden" name="trainerNo" value="${loginUser.trainerNo}"/>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button type="submit" class="btn btn-primary">등록</button>
											<button class="btn btn-default modal-dismiss">취소</button>
										</div>
									</div>
								</footer>
							</form>
					</section>
				</div>
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script>
	
	var equipcheckID = "";
		
    function oneCheckbox(a){

        var obj = document.getElementsByName("equipcheck");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }
        
        equipcheckID = a.value;
        

    }
    
    function update() {
    	location.href="updateForm.ep?eno="+equipcheckID;
    }
    function deletetv() {
    	location.href="delete.ep?eno="+equipcheckID;
    }
	
	//$(function() {
		

		
		//$('input[name="equipcheck"]').click(function () { 
			
		//	if($('input[name="equipcheck"]').is(":checked")) {  
			
		//	}
			 
		//	 var eno = $(this).val(); 
			 
	    // }); 
		
		
		
		
	//});


	</script>
	<script>
	
	var equipcheck1ID = "";
		
    function oneCheckbox1(a){

        var obj = document.getElementsByName("equipcheck1");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }
        
        equipcheck1ID = a.value;
        

    }
    
    function update1() {
    	location.href="updateForm.epc?ecno="+equipcheck1ID;
    }
   
	
	//$(function() {
		

		
		//$('input[name="equipcheck"]').click(function () { 
			
		//	if($('input[name="equipcheck"]').is(":checked")) {  
			
		//	}
			 
		//	 var eno = $(this).val(); 
			 
	    // }); 
		
		
		
		
	//});


	</script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	}
	.img-responsive{
	margin :auto;
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
					<header class="page-header" style="margin-bottom: 0px;">
						<h2>락커관리</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- start: page -->
					<div class="inner-toolbar clearfix locker-header" style="margin-top: 4px; height:70px; margin-bottom: 10px;">
						<ul>
								<li style="padding: 0px;">
									<select id="LockerCategory" onclick="send5();">
										<option value="">락커선택</option>
										<option value="all">공용락커</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
								</li>
							
								<li class="right" data-sort-source data-sort-id="media-gallery"  style="margin-top: 10px;">
									<ul class="nav nav-pills nav-pills-primary">
										<li class="active" style="padding-right: 10px;">
											<a class="modal-with-form btn btn-default"  style="float:right; " href="#modalForm2" >락커생성</a>
										</li>
										<!--  
										<li style="padding-right: 10px;">
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm1">락커수정</a>
										</li>
										-->
										<li style="padding-right: 10px;">
											<button class=" btn btn-default"  style="float:right; width:60px; height:38px; " onclick="deletemcm()">삭제</button>
										</li>
										<li class="active" style="padding-right: 10px;">
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm5"onclick="selectLk()" >락커정보창</a>
										</li>
										<li class="active" style="padding-right: 10px;">
											<a class="modal-with-form btn btn-default"  style="float:right" href="#modalForm">일괄등록</a>
										</li>
								</ul>
							</li>
						</ul>
					</div>
			   

					<section class="panel" style="width: 100%;margin-top: 14px;" >
							
						<header class="panel-heading" style="width: 100%;">

							<h1 class="panel-title">락커관리</h1>
						</header>
						<div class="panel-body">
							<div class="row mg-files" data-sort-destination data-sort-id="media-gallery">
								<table class="LockerPos-table" id="LockerPos-list">
									<c:forEach items="${list}" var="L" >
										<div class="isotope-item document col-sm-6 col-md-4 col-lg-2">
											<div class="thumbnail" >
												<div class="thumb-preview">
													
														<input id="lockerPosNo"  type="hidden" value="${L.lockerPosNo}" >
														<div class="locker-window" style="width:161.06px; height: 134.33px;">
															<h5 class="open">
															<c:choose>
																<c:when test="${ L.lockerPosStatus eq 'Y' }">
																	<h5 style="width:42px; margin: auto; color:blue;">사용중</h5>
																</c:when>
																<c:when test="${ L.lockerPosStatus eq 'X' }">
																	<h5 style="width:42px; margin: auto; color:black;">미사용</h5>
																</c:when>
																<c:when test="${ L.lockerPosStatus eq 'M' }">
																	<h5 style="width:42px; margin: auto; color:orange;">만기</h5>
																</c:when>
																<c:when test="${ L.lockerPosStatus eq 'N' }">
																	<h5 style="width:42px; margin: auto; color:red;">고장</h5>
																</c:when>
															</c:choose>
																	<div class="mg-option checkbox-custom checkbox-inline" style="margin-left:140px;">
																			<input type="checkbox" id="file_1" name="lockerPosCheck" onclick="twoCheckbox(this)" value="${L.lockerPosNo}">
																			<label for="file_1"></label>
																	</div>
															</h5>
															<div class="locker-window-parent" style="border: 2px solid transparent; border-image: none; ">
																<div class="locker-window-content" style="color: black;">
																			<h4>${L.lockerPosNo}</h4>
																			
																			<c:forEach items="${Llist}" var="m" > <!-- 락커 리스트 락커포스 아님 -->
																				<c:choose>
																					<c:when test="${ m.lockerStatus eq 'Y' }">
																						<c:if test="${ L.lockerPosNo eq m.lockerPosNo}">
																						<span style="font-variant:normal;">${ m.memberName }</span>
																						<span style="font-variant:normal;">[${ m.lockerRegistDate}]</span>
																						</c:if>
																					</c:when>
																					<c:when test="${ m.lockerStatus eq 'R' }">
																						<span style="font-variant:normal;"></span>
																						<span style="font-variant:normal;"></span>
																					</c:when>
																				</c:choose>
																			</c:forEach>																	
																	<c:choose>
																		<c:when test="${ L.lockerPosType eq 'F' }">
																			<h5 style="color:#e36159;">F</h5>
																		</c:when>
																		<c:when test="${ L.lockerPosType eq 'M' }">
																			<h5 style="color:#0088c;">M</h5>
																		</c:when>							
																	</c:choose>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
									</c:forEach>
								</table>
							</div>
						</div>
					</section>
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		
		<!--/ 전체 레이어 -->
		<!--락커룸 등록-->
					<section class="panel" style="margin-bottom: 0px;">
						<!-- Modal Form -->
						<div id="modalForm2" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">락커룸 생성</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form-tlqkf" class="form-horizontal mb-lg" novalidate="novalidate"  method="post" action="lockerEnroll.hlo">
										<h2>락커룸 정보</h2>
										<hr>
											<div class="Machine">
												<div class="form-group">
													<label class="col-sm-3 control-label">락커룸 타입</label>
													<div class="col-sm-9">
														 <label><input type="radio" name="lockerPosType" value="M"> 남자</label>
	     												 <label><input type="radio" name="lockerPosType" value="F"> 여자</label>  
													</div>
												</div>
												<br>
												<div class="form-group">
													<label class="col-sm-3 control-label">락커 갯수</label>
													<div class="col-sm-9">
														<input type="number" name="lockerPosQuantity" class="form-control" placeholder="" />
													</div>
												</div>
										   </div>
											<br><br>
											<footer class="panel-footer">
												<div class="row">
													<div class="col-md-12 text-right">
														<button class="btn btn-primary modal-confirm" onclick="send()"  type="submit">등록</button>
														<button class="btn btn-default modal-dismiss">취소</button>
													</div>
												</div>
											</footer>
									</form>
									</div>
							</section>
						</div>

					
				</section>
				
					<!-- 기구 관리 수정 -->
					<section class="panel" style="margin-bottom: 0px;">
							<!-- Modal Form -->
							<div id="modalForm1" class="modal-block modal-block-primary mfp-hide">
								<section class="panel">
									<header class="panel-heading">
										<h1 class="panel-title">락커룸 수정</h1>
									</header>
									<div class="panel-body">
										<form id="demo-form-update" class="form-horizontal mb-lg" novalidate="novalidate"  method="post" action="lockerUpdate.hlo">
											<h2>락커룸 정보</h2>
											<hr>
											<div class="Machine">
												<div class="form-group">
													<label class="col-sm-3 control-label">락커룸 타입</label>
													<div class="col-sm-9">
														 <label><input type="radio" name="lockerPosType" value="M"> 남자</label>
	     												 <label><input type="radio" name="lockerPosType" value="F"> 여자</label>  
													</div>
												</div>
												<br>
												<div class="form-group">
													<label class="col-sm-3 control-label">락커 갯수</label>
													<div class="col-sm-9">
														<input type="number" name="lockerPosQuantity" class="form-control" placeholder="" />
													</div>
												</div>
										   </div>
											<br><br>
											<footer class="panel-footer">
												<div class="row">
													<div class="col-md-12 text-right">
														<button class="btn btn-primary modal-confirm" onclick="send1()"  type="submit">등록</button>
														<button class="btn btn-default modal-dismiss">취소</button>
													</div>
												</div>
											</footer>
									</form>
								</section>
							</div>

						
					</section>

					<!-- 일괄등록 -->
					<section class="panel" style="margin-bottom: 0px;">
						<!-- Modal Form -->
						<div id="modalForm" class="modal-block modal-block-primary mfp-hide">
							<section class="panel"style="width: 900px;">
								<header class="panel-heading">
									<h1 class="panel-title">일괄등록</h1>
								</header>
							<form id="demo-form-wlqrkrhtlvek-Enroll" class="form-horizontal mb-lg" novalidate="novalidate">
								<div class="panel-body">
										<div class="panel-body">
											<table class="table table-bordered table-striped mb-none-LockerArea" id="datatable-default">
												<thead>
													<tr>
														<th></th>
														<th>락커번호</th>
														<th>락커타입</th>
														<th class="hidden-phone">고객명</th>
														<th class="hidden-phone">시작일</th>
														<th class="hidden-phone">종료일</th>
														
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${nlist}" var="L" >   
													<tr id="LockerInsert1"> 
														<th><input type=checkbox name="lockerPosNo" id="check1" value="${ L.lockerPosNo }"></th> 
														<th> ${L.lockerPosNo} </th>
														<th>${L.lockerPosType} </th>
														<th>
														<select name="memberNo" id="memberName2">
															<option>이름선택</option>
														<c:forEach items="${mlist}" var="L" >   
															<option name="memberNo" value="${ L.memberNo }">${ L.memberName }</option>
														</c:forEach>
														</select>
														</th>
														<th><input name="lockerStartDate" type="date"></th>
														<th><input name="lockerEndDate" type="date"></th>
													</tr>
													</c:forEach>
														
												</tbody>
											</table>
										</div>
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-md-12 text-right">
												<button class="btn btn-primary modal-confirm" onclick="send2()">등록</button>
												<button class="btn btn-default modal-dismiss">취소</button>
											</div>
										</div>
									</footer>
								</form>
							</section>
						</div>

					
				</section>
				
					<!-- 기구 관리 정보창 -->
				<section class="panel" style="margin-bottom: 0px;">

						<!-- Modal Form -->
						<div id="modalForm5" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">락커기구 정보창</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form-Locker" class="form-horizontal mb-lg-machineList18" novalidate="novalidate" method="post" action="enroll.hlc" enctype="multipart/form-data">
										
										<hr>
											<div class="form-group">
												<label class="col-sm-3 control-label">락커번호</label>
												<div class="col-sm-9">
													<input type="text"  id="lockerPosNo" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">락커 타입</label>
												<div class="col-sm-9">
													<input type="text"  id="lockerPosType" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">락커 상태</label>
												<div class="col-sm-9">
													<input type="text"  id="lockerPosStatus" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<input type="hidden"  id="lockerNo" name="lockerNo">
											
										<hr>
										<div class="Machine">															
											<div class="form-group">
												<label class="col-sm-3 control-label">회원이름</label>
												<div class="col-sm-9">
													<input type="text"  id="memberName" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">시작일</label>
												<div class="col-sm-9">
													<input type="text"  id="lockerStartDate" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">종류일</label>
												<div class="col-sm-9">
													<input type="text"  id="lockerEndDate" class="form-control"  placeholder="" readonly />
												</div>
											</div>
										</div>
										<br><br>
										<footer class="panel-footer">
											<div class="row">
												<div class="col-md-12 text-right">
													<button class="btn btn-primary modal-confirm"  onclick="send7();" >고장</button>
													<button class="btn btn-primary modal-confirm"  onclick="send8();" >회수</button>
													<button class="btn btn-default modal-dismiss">취소</button>
												</div>
											</div>
										</footer>
									</form>
								</div>
							</section>
						</div>				
				</section>
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>
	<script>
	function send(){
		document.getElementById("demo-form-tlqkf").submit();
	}
	function send1(){
		document.getElementById("demo-form-update").submit();
	}

	</script>
	<script>
	 function selectLk(){
	    	var value1 = lockerPosNo;

			    	$.ajax({
			    		url:"selectlk.hlo",
			    		data:{lpno:value1},
			    		type:"post",
			    		success:function(lp){
			    			
			    			var value = "";
			    				$("#lockerPosNo").val(lp.lockerPosNo);
			    				$("#lockerPosType").val(lp.lockerPosType);	
			    				$("#lockerPosStatus").val(lp.lockerPosStatus);
			    				$("#memberName").val(lp.memberName);
			    				$("#lockerStartDate").val(lp.lockerStartDate);
			    				$("#lockerEndDate").val(lp.lockerEndDate);
			    				$("#lockerNo").val(lp.lockerNo);
				    			
			    				
			    		},
			    		error:function(){
			    			console.log("머신 상세정보 통신실패");
			    		}
			    	});
	    }
	</script>
	<script>
	  function deletemcm(){
	    	location.href="delete.hlo?lpno="+lockerPosNo;
	    } 
	    
		var lockerPosNo = "";
		
	    function twoCheckbox(a){

	        var obj = document.getElementsByName("lockerPosCheck");

	        for(var i=0; i<obj.length; i++){

	            if(obj[i] != a){

	                obj[i].checked = false;

	            }

	        }
	        
	        lockerPosNo = a.value;
	    }
	</script>
	
	
	<script>
	function send8(){
	    var val = $('#lockerNo').val();
	    location.href = "collect.hlc?lcno=" + val;		
		}
	function send7(){
	    var val = $('#lockerPosNo').val();
	    location.href = "trouble.hlo?lpno=" + val;		
		}
	</script>

	
	
	<!-- LockerCategory스크립 -->
	<script>
	
	function send5(){
		
		var value =	$("#LockerCategory option:selected").attr('value');
		
		if(value != ""){
			location.href = "category.hlo?gender=" + value;			
		}
			
	}
	
	function send2(){
		
		var lockerPosNo = new Array();
		var memName = new Array();
		var chk = new Array();
		var chk2 = new Array();
		$("input[name=lockerPosNo]:checked").each(function(){
			lockerPosNo.push($(this).val());
			memName.push($(this).parent().next().next().next().children().val());
			chk.push($(this).parent().next().next().next().next().children().val());
			chk2.push($(this).parent().next().next().next().next().next().children().val());

			location.href="lockerEnroll.hlc?lockerPosNo=" + lockerPosNo + "&&memberNo="+ memName + "&&lockerStartDate=" + chk + "&&lockerEndDate=" + chk2;
			
		}) 
		
		//document.getElementById("demo-form-wlqrkrhtlvek-Enroll").submit();
		
	}
	</script>
	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/pages/examples.mediagallery.js" ></script>
</body>
</html>
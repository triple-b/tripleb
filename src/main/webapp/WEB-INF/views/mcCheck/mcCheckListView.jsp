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
							
							<li class="right" data-sort-source data-sort-id="media-gallery" style="margin-top: 10px;">
								<ul class="nav nav-pills nav-pills-primary">

									<li style="padding-right: 10px;">
										<button class=" btn btn-default"  style="float:right; " onclick="trouble()">고장</button>
									</li>
									<li style="padding-right: 10px;">
										<button class=" btn btn-default"  style="float:right; " onclick="trouble1()">고장해제</button>
									</li>
									<li style="padding-right: 10px;">
										<button class=" btn btn-default"  style="float:right; " onclick="deletemcm()">삭제</button>
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
										<div class="isotope-item document col-sm-6 col-md-4 col-lg-3">
											<div class="thumbnail">
												<div class="thumb-preview">
													<div id="Mcmanagementtlqkf">
														<input id="machineNo1"  type="hidden" value="${m.machineNo}" >
														<a class="thumb-image">
															<img style="width:200px; height:200px; cursor:pointer" src="${ pageContext.servletContext.contextPath }/resources/upload_files/${m.thumbChange}" class="img-responsive modal-with-form" alt="Project" onclick="clickImgFn(${ m.machineNo})" id="imgValue1" href="#modalForm1">
														</a>
													</div>
													<div class="mg-thumb-options">
														<div class="mg-toolbar">
																<div class="mg-option checkbox-custom checkbox-inline">
																	<input type="checkbox" id="file_1" name="machinecheck1" onclick="twoCheckbox(this)" value="${m.machineNo}">
																	<label for="file_1"></label>											
																</div>
														
																<c:choose>
																	<c:when test="${ m.machineDel eq 'Y' }">
																		<h5 class="mg-title text-semibold">${m.mcName}</h5>	
																	</c:when>
																	<c:when test="${ m.machineDel eq 'N' }">
																		<h5 class="mg-title text-semibold" style="color:red;">${m.mcName}</h5>	
																	</c:when>
																</c:choose>
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
									<br>
									<table align="center" style="width: -webkit-fill-available;">
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
				

				<!-- 기구 관리 정보창 -->
				<section class="panel" style="margin-bottom: 0px;">

						<!-- Modal Form -->
						<div id="modalForm1" class="modal-block modal-block-primary mfp-hide">
							<section class="panel">
								<header class="panel-heading">
									<h1 class="panel-title">시설기구 정보창</h1>
								</header>
								<div class="panel-body">
									<form id="demo-form-machineList" class="form-horizontal mb-lg-machineList18" novalidate="novalidate" method="post" action="update.mcm" enctype="multipart/form-data">
										<div id="Mcmanagementtlqkf">
															<img id="img"  style="width:300px; height:300px;" src="${ pageContext.servletContext.contextPath }/resources/upload_files/${m.thumbChange}" class="img-responsive" alt="Project">
										</div>
										<hr>
										<div class="form-group">
												<label class="col-sm-3 control-label">수정할 기구번호</label>
												<div class="col-sm-9">
													<input type="text" name="machineNo" id="machineNo" class="form-control"  placeholder="" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">기구 등록 날짜</label>
												<div class="col-sm-9">
													<input type="text"  id="mcDate" class="form-control"  placeholder="" readonly />
												</div>
											</div>
										<hr>
										<div class="Machine">
											
											<div class="form-group">
												<label class="col-sm-3 control-label">기구명</label>
												<div class="col-sm-9">
													<input id="mcName" type="text" name="mcName" class="form-control"  placeholder="" />
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">첨부파일</label>
												<div class="col-sm-9">
													<input type="file" id="upfile" name="reUploadFile" class="form-control" />
													현재 업로드된 파일 :<h6 id ="thumbChange"></h6>
													<input type="hidden"  id="machineRegistDate">
													<input type="hidden" name="mcNo" id="mcNo">
													<input type="hidden" name="thumbnail" id="thumbnail">
													<input type="hidden" name="thumbChange" id="thumbChange">
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">기구설명</label>
												<div class="col-sm-9">
													<textarea rows="5" class="form-control" name="mcExplain" id="mcExplain" placeholder="Type your comment..." required></textarea>
												</div>
											</div>
										</div>
										<br><br>
										<footer class="panel-footer">
											<div class="row">
												<div class="col-md-12 text-right">
													<button class="btn btn-primary modal-confirm" type="submit" onclick="send()"; >수정</button>
													<button class="btn btn-default modal-dismiss">취소</button>
												</div>
											</div>
										</footer>
									</form>
								</div>
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

		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	
	<script>
		var clickImgFn = function(rowkey){
			var value1 = rowkey;
			console.log(value1);
			
			$.ajax({
	    		url:"selectMc1.mcm",
	    		data:{mano:value1},
	    		type:"post",
	    		success:function(mc){
	    			
	    			var value = "";
	    				$("#machineRegistDate").val(mc.machineRegistDate);
	    				$("#mcNo").val(mc.mcNo);	
	    				$("#mcName").val(mc.mcName);
	    				$("#machineNo").val(mc.machineNo);
	    				$("#mcExplain").val(mc.mcExplain);
	    				$("#thumbChange").val(mc.thumbChange);
	    				$("#thumbnail").val(mc.thumbnail);
	    				$("#mcDate").val(mc.mcDate);
	    				$("#img").attr('src', "${ pageContext.servletContext.contextPath }/resources/upload_files/" + mc.thumbChange);	
	    		},
	    		error:function(){
	    			console.log("머신 상세정보 통신실패");
	    		}
	    	});
		}
	</script>
	
	
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
    	location.href="delete.mc?mcno="+machinecheckID;
    }
    function insertmcm() {
    	location.href="insert.mcm?mcno="+machinecheckID;
    }
    function trouble1() {
    	location.href="trouble1.mcm?mano="+machinecheckNo;
    }
    
    function updateSelect(){
    	location.href="update.mcm?mano="+machinecheckNo;
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
		function trouble(){
			var value2 = machinecheckNo;
			
			location.href="trouble.mcm?mano="+value2;

	    	/* $.ajax({
	    		url:"trouble.mcm",
	    		data:{mano:value2},
	    		type:"post",
	    		success:function(m){
	    				
	    			
	    		},
	    		error:function(){
	    			console.log("머신 상세정보 통신실패");
	    		}
	    	}); */
}
	</script>
	<script>
		$(function(){
			$("#Mcmanagementtlqkf").click(function(){
				location.href="select.mcm?mano=" + $(this).children().eq(0).val();
			});
		});
		
		function send(){
			document.getElementById("demo-form-machineList").submit();
		}
	</script>
	
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/pages/examples.mediagallery.js" ></script>
</body>
</html>
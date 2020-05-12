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
									<button class="modal-with-form btn btn-primary" id="checkOutBtn1" style="float: right;"  href="#modalForm">점검</button>
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
										<c:forEach items="${List}" var="ma">
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
									<form id="demo-form" action="insert.hmc" method="post" class="form-horizontal mb-lg" novalidate="novalidate">	
										<div class="form-group">
											<label class="col-sm-3 control-label">점검제목</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="machineTitle" value="제목을 작성해주세요" required/>
												<input type="hidden" class="form-control" name="trainerNo" value="${loginUser.trainerNo}" readonly>
												<input type="text" class="form-control" name="machineNoList" value="" readonly>
												<input type="text" class="form-control" name="machineChkContentList" value="" readonly>
											</div>
										</div>
										<hr>
										
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
																			<th>기구번호</th>
																			<th>점검기구</th>
																			<th>점검부위</th>
																		</tr>
																	</thead>
																	<tbody id="ajaxForm1">
																			
	
																	</tbody>
																</table>
															</div>
														</div>
													</section>
												</div>
												
											</div>
										
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="col-md-12 text-right">
											<button class="btn btn-primary " onclick="goRegMcCheck()">등록</button>
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
		$(function(){
			$("#datatable-default tbody tr").click(function(){
				location.href="detail.hmc?macno=" + $(this).children().eq(0).text();
			});
		});
	</script>
	
	<script>
	/* $(function(){
		$("#checkOutBtn1").click(function(){
			location.href="mcList.mcm?type=others"
		});
	}); 
	
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
	
	function inserthmc() {
    	location.href="insert.hmc?macno="+machinecheckID;
    }*/
	</script>
	
	<!-- other way -->
	<script>
		$(function(){
			$("#checkOutBtn1").click(function(){
				$.ajax({
					url:"mcList2.mcm",
					data:{},
					type:"post",
					success:function(list){
						
						var value = "";
						
						for(var i in list){
							
							value += '<tr>' +
										'<td><input type="checkbox" name="machineNo" value="'+ list[i].machineNo +'"></td>' +
										'<td>' + list[i].machineNo + '</td>' +
										'<td>' + list[i].mcName + '</td>' +
										'<td><input type="text" name="mContent' + list[i].machineNo + '" class="form-control" placeholder="Type your comment..." ></textarea></td>' +
									'</tr>';
						}
						
						$("#ajaxForm1").html(value);
					},
					error:function(){
						console.log("통신실패");
					}
				});
			});
		});
	</script>
	
	
	<script >
	function goRegMcCheck(){
		
	      //var machineTitle = $('input[name="machineTitle"]').val();
	      //var machinecheck = $('input:checkbox[name="machinecheck"]').value;
	      //var trainerNo =  $('input[name="trainerNo"]').val();
	      	 			       	     
	      var ArrayContent = new Array();
	      var ArrayMachineNo = new Array();
	      
	      $("input[name=machineNo]:checked").each(function(i){
	 
	         var mContent = $('input[name="mContent' + $(this).val() + '"]').val();
	      
	         ArrayContent.push(mContent);      
	         ArrayMachineNo.push($(this).val());

	      });

	      var ContentList = ArrayContent.join(",");
	      var idList = ArrayMachineNo.join(",");
	      
	   
	      
	      $('input[name="machineChkContentList"]').val(ContentList);
	      $('input[name="machineNoList"]').val(idList);
      
	      
	     $("demo-form").submit();
	      
	   /*   
	      var $newForm = $('<form></form>'); 
	      $newForm.attr("method", "post");
	      $newForm.attr("action", "insert.hmc");
	      $newForm.appendTo('body')

		  $newForm.append($("<input/>", {type:"hidden", name:"machineTitle", value:machineTitle}));
		  $newForm.append($("<input/>", {type:"hidden", name:"machineNoList", value:idList}));
		  $newForm.append($("<input/>", {type:"hidden", name:"machineChkContentList", value:ContentList}));
		  $newForm.append($("<input/>", {type:"hidden", name:"trainerNo", value:trainerNo}));
		  
		  $newForm.submit();
		  */
		
	}
	</script>
	
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
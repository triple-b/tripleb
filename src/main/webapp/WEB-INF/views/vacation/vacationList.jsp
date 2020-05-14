<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			
			<!-- 오른쪽 content 페이지 : 메뉴 선택시 수정되는 부분 -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>휴가관리</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				<!-- start : page -->
				<div class="row">
                    <div class="col-md-6 col-lg-12 col-xl-6" style="margin-top: 1%;">
                       	<div class="content">
			                  <br><br>
			                  <div class="innerOuter" style="margin-top:-4%">
				                   <section class="panel">
						               	<header class="panel-heading">
			                            	<div class="panel-btn" style="margin-bottom:1%;">
												<a class="btn btn-default" style="float:right; margin-right: 1%; background:#e36159; color:white; border:1px solid #e36159;" href="appVacaList.jva">결재목록</a>
											</div>
			                                <h2 class="panel-title">휴가관리</h2>				
			                            </header>
				                      	<div class="panel-body">
				                      		<form id="vacApp1" action="vacApprove.jva" method="post">
				                      			<input type="hidden" id="trainerNo" name="trainerNo" value="${ loginUser.trainerNo }">
					                          	<table class="table table-bordered table-striped mb-none">
					                              	<thead>
					                                  	<tr>
					                                  		<th>신청자</th>
						                                    <th>휴가사유</th>
						                                    <th>시작일</th>
						                                    <th>종료일</th>
						                                    <th colspan="2">신청</th>
						                                </tr>
						                            </thead>
						                            <tbody>
				                                 		<tr>
				                                 			<td><input type="text" class="form-control" value="${ loginUser.trainerName }" style="margin-top:2%" readonly></td>
				                                 			<td><input type="text" class="form-control" id="vacCause" style="margin-top:2%" name="vacCause"></td>
				                                 			<td><input type="date" class="form-control" id="vacStDate" name="vacStDate"></td>
				                                 			<td><input type="date" class="form-control" id="vacEndDate" name="vacEndDate"></td>
					                                    	<td><button type="submit" class="btn btn-primary">신청</button></td>
					                                    </tr>
						                        	</tbody>
						                    	</table>
						                    	<br>
					                    	</form>
				                      	</div>
				                    </section>
			                   </div>
			              	
			               <br><br>
				           </div>
	                  </div>
				</div>
				<!-- end: page -->
				
				<!--  start : page  -->
				<div class="row">
				     <div class="col-md-6 col-lg-12 col-xl-6" style="margin-top: 1%;">
				     
				                   <div class="content">
								   <br><br>
								         <div class="innerOuter" style="margin-top:-5%">
									            <section class="panel">
									                    <header class="panel-heading">
									                       	<div class="panel-btn" style="margin-bottom:1%;">
																<button class="btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" onclick="myVacaListFn(${loginUser.trainerNo})">내 휴가목록</button>
																<a class="btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" href="vacationAll.jva">전체목록</a>
															</div>
									                        <h2 class="panel-title">휴가리스트</h2>				
									                    </header>
								                      	<div class="panel-body">
								                          	<table id="vacaList1" class="classList table table-bordered table-striped mb-none">
								                              	<thead>
								                                  	<tr>
								                                      	<th>휴가번호</th>
								                                      	<th>휴가자</th>
									                                    <th>휴가사유</th>
									                                    <th>시작일</th>
									                                    <th>종료일</th>
									                                </tr>
									                            </thead>
									                            <tbody>
									                                <c:forEach items="${ vlist }" var="v"> 
								                                 		<tr>
								                                 			<td>${ v.vacNo }</td>
								                                 			<td>${ v.trainerName }
								                                 			<td>${ v.vacCause }</td>
								                                 			<td>${ v.vacStDate }</td>
								                                 			<td>${ v.vacEndDate }</td>
									                                    </tr>
									                            	</c:forEach>
									                        	</tbody>
									                    	</table>
									                    	<br>
								                      	</div>
							                    </section>
						                   </div>
						              	
						               	   <br><br>
							      </div>
				      
            		  </div>
		        </div>
				<!-- end: page -->
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		
	
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 내 휴가목록 ajax -->
	<script>
		var myVacaListFn = function(rowkey){
			var trainerNo = rowkey;
			
			// 날짜포맷 지정하는 함수
			function dateToYYYYMMDD(date)
			{
			    function pad(num) {
			        num = num + '';
			        return num.length < 2 ? '0' + num : num;
			    }
			    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
			}
			
			$.ajax({
				url:"myVacaList.jva",
				data:{trainerNo:trainerNo},
				type:"post",
				success:function(list){
					var value = "";
					
					console.log(list);
					console.log(list.vacStDate);
					console.log(list.vacEndDate);
					$.each(list, function(i, obj){
						
						value += '<tr>' +
			             			'<td>' + obj.vacNo + '</td>' +
			             			'<td>' + obj.trainerName + '</td>' +
			             			'<td>' + obj.vacCause + '</td>' +
			             			'<td>' + obj.vacStDate + '</td>' +
			             			'<td>' + obj.vacEndDate + '</td>' +
			             		 '<tr>';
					});
					
					$("#vacaList1 tbody").html(value);
				},
				error:function(){
					console.log("통신실패");
				}
			});
		}
	</script>
	
	
	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/dashboard/examples.dashboard.js"></script>
</body>
</html>
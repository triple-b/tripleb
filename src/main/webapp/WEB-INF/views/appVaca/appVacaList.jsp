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
				
				<!-- start page -->
				<div class="row">
					<header class="panel-heading">
						<div class="panel-btn" style="margin-bottom:1%;">
							<a class="btn btn-default" style="float:right; margin-right: 1%; background:#e36159; color:white; border:1px solid #e36159;" href="vacation.jva">휴가목록</a>
						</div>
						<h2 class="panel-title" style="margin-bottom:1%;">휴가결재</h2>		
					</header>
					
                    <div class="col-md-6 col-lg-12 col-xl-6" style="margin-top: 1%;">
                        <div class="row">
                        	<div class="content">
				                  <br><br>
				                  <div class="innerOuter" style="margin-top:-5%">
					                  <section class="panel">
					                      	<div class="panel-body">
					                          	<table class="classList table table-bordered table-striped mb-none" id="datatable-default">
					                              	<thead>
					                                  	<tr>
					                                  		<th>번호</th>
					                                      	<th>신청자</th>
						                                    <th>휴가사유</th>
						                                    <th>시작일</th>
						                                    <th>종료일</th>
						                                    <th>결재상태</th>
						                                   	<c:if test="${ loginUser.trainerGrade eq 'M' }">
						                                    	<th>결재자</th>
						                                    	<th></th>
						                                    </c:if>
						                                </tr>
						                            </thead>
						                            <tbody>
						                                <c:forEach items="${ vlist }" var="v"> 
					                                 		<tr>
					                                 			<td>${ v.vacNo }</td>
					                                 			<td>${ v.trainerName }</td>
					                                 			<td>${ v.vacCause }</td>
					                                 			<td>${ v.vacStDate }</td>
					                                 			<td>${ v.vacEndDate }</td>
					                                 			<c:choose>
					                                 				<c:when test="${ v.vacStatus eq 'N' }">
					                                 					<td><p>대기</p></td>
					                                 				</c:when>
					                                 				<c:when test="${ v.vacStatus eq 'Y' }">
					                                 					<td><p style="color:#01DF01">승인</p></td>
					                                 				</c:when>
					                                 				<c:when test="${ v.vacStatus eq 'R' }">
					                                 					<td><p style="color:red">반려</p></td>
					                                 				</c:when>
					                                 			</c:choose>
					                                 			<c:if test="${ loginUser.trainerGrade eq 'M' }">
					                                 				<c:choose>
					                                 					<c:when test="${ v.vacStatus ne 'N' }">
					                                 						<td>${ loginUser.trainerName }</td>
					                                 					</c:when>
					                                 					<c:otherwise>
					                                 						<td></td>
					                                 					</c:otherwise>
					                                 				</c:choose>
						                                 			<td class="appDetail">
						                                 				<c:choose>
						                                 					<c:when test="${ v.vacStatus eq 'N' }">
						                                 						<button class="modal-with-form" style="background:white; border:0px" href="#modalFormA" onclick="appVacaDetailFn(${ v.vacNo })"><i class="fa fa-check"></i></button>
						                                 						<button class="modal-with-form" style="background:white; border:0px" href="#modalFormB" onclick="appVacaDetail2Fn(${ v.vacNo })"><i class="fa fa-times"></i></button>
						                                 					</c:when>
						                                 					<c:otherwise>
						                                 						<input type="hidden">
						                                 					</c:otherwise>
						                                 				</c:choose>
						                                 			</td>
						                                 		</c:if>
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
						</div>
						<!-- end: page -->
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		
		<!-- 휴가정보 모달폼-->
			<div id="modalFormA" class="modal-block modal-block-primary mfp-hide">
				<section class="panel">
				   <header class="panel-heading" style="background: #0f4c81;">
					  <h2 class="panel-title" style="color: white;">결재휴가정보</h2>
				   </header>
				   <div class="panel-body">
					  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertAppVaca.jav">
					  	<input name="confirmerNo" type="hidden" value="${ loginUser.trainerNo }">
					  	<div class="form-group">
							<label class="col-sm-2 control-label">결재자: </label>
							<div class="col-sm-9">
							   <label class="col-sm-3" style="margin-top:1.5%">${ loginUser.trainerName }</label>
							</div>
						 </div>
						 <div id="ajaxForm">
						 
						 </div>
						 <div class="form-group">
							<label class="col-sm-2 control-label">승인사유 :  </label>
							<div class="col-sm-9">
							   <textarea name="appVacComment" id="appVacComment" cols="60" rows="3" style="margin-top:1.5%"></textarea>
							</div>
						 </div>
						 <footer class="panel-footer">
							<div class="row">
							   <div class="col-md-12 text-right">
								  <button class="btn btn-primary" type="submit">승인</button>
								  <button class="btn btn-default modal-dismiss">취소</button>
							   </div>
							</div>
						 </footer>
					  </form>
				  </div>
			 </section>
		 </div>
		 <!-- /휴가정보 모달폼 -->
		
		
		
		<!-- 휴가정보 승인 ajax -->
		<script>
		var appVacaDetailFn = function(rowKey) {
			var val1 = rowKey;
			console.log("클릭");
			console.log(val1);
			
			$.ajax({
				url:"appVacaDetail.jav",
				data:{vacNo:val1},
				type:"post",
				success:function(data){
					var value = "";
					
					value += '<div class="form-group">' +
								'<input name="trainerNo" type="hidden" value="' + data.trainerNo + '">' +
								'<label class="col-sm-2 control-label">신청자 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.trainerName + '</label>' +
								'</div>' +
							'</div>' +
							'<div class="form-group">' +
								'<input name="vacNo" type="hidden" value="' + data.vacNo + '">' +
								'<label class="col-sm-2 control-label">휴가번호 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacNo + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">시작일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacStDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">종료일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacEndDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								  '<label class="col-sm-2 control-label">휴가사유 : </label>' +
								  '<div class="col-sm-9">' +
									 '<p style="margin-top:1.5%">' +
										 data.vacCause +
									'</p>' +
								  '</div>' +
							 '</div>';
				
					$("#ajaxForm").html(value);
					
				},
				error:function(){
					console.log("통신실패");
				}
			});
		}
		</script>
		<!-- /ajax -->
		
		
		<!-- 휴가정보2 모달폼-->
			<div id="modalFormB" class="modal-block modal-block-primary mfp-hide">
				<section class="panel">
				   <header class="panel-heading" style="background: #0f4c81;">
					  <h2 class="panel-title" style="color: white;">결재휴가정보</h2>
				   </header>
				   <div class="panel-body">
					  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertAppVaca2.jav">
					  	<input name="confirmerNo" type="hidden" value="${ loginUser.trainerNo }">
					  	<div class="form-group">
							<label class="col-sm-2 control-label">결재자: </label>
							<div class="col-sm-9">
							   <label class="col-sm-3" style="margin-top:1.5%">${ loginUser.trainerName }</label>
							</div>
						 </div>
						 <div id="ajaxForm2">
						 
						 </div>
						 <div class="form-group">
							<label class="col-sm-2 control-label">반려사유 :  </label>
							<div class="col-sm-9">
							   <textarea name="appVacComment" id="appVacComment" cols="60" rows="3" style="margin-top:1.5%"></textarea>
							</div>
						 </div>
						 <footer class="panel-footer">
							<div class="row">
							   <div class="col-md-12 text-right">
								  <button class="btn btn-primary" type="submit">반려</button>
								  <button class="btn btn-default modal-dismiss">취소</button>
							   </div>
							</div>
						 </footer>
					  </form>
				  </div>
			 </section>
		 </div>
		 <!-- /휴가정보2 모달폼 -->
		
		<!-- 휴가정보 승인 ajax -->
		<script>
		var appVacaDetail2Fn = function(rowKey) {
			var val1 = rowKey;
			console.log("클릭");
			console.log(val1);
			
			$.ajax({
				url:"appVacaDetail.jav",
				data:{vacNo:val1},
				type:"post",
				success:function(data){
					var value = "";
					
					value += '<div class="form-group">' +
								'<input name="trainerNo" type="hidden" value="' + data.trainerNo + '">' +
								'<label class="col-sm-2 control-label">신청자 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.trainerName + '</label>' +
								'</div>' +
							'</div>' +
							'<div class="form-group">' +
								'<input name="vacNo" type="hidden" value="' + data.vacNo + '">' +
								'<label class="col-sm-2 control-label">휴가번호 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacNo + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">시작일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacStDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">종료일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.vacEndDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								  '<label class="col-sm-2 control-label">휴가사유 : </label>' +
								  '<div class="col-sm-10">' +
									 '<p style="margin-top:1.5%">' +
										 data.vacCause +
									'</p>' +
								  '</div>' +
							 '</div>';
				
					$("#ajaxForm2").html(value);
					
				},
				error:function(){
					console.log("통신실패");
				}
			});
		}
		</script>
		<!-- /ajax -->
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
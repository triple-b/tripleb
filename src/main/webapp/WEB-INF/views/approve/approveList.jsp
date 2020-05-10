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
			<!--/ 왼쪽 메뉴 페이지 -->
			
			<!-- 오른쪽 content 페이지 : 메뉴 선택시 수정되는 부분 -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>수업관리</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				<!-- start page -->
				<div class="row">
					<header class="panel-heading">
						<div class="panel-btn" style="margin-bottom:1%;">
							<a class="btn btn-default" style="float:right; margin-right: 1%; background:#e36159; color:white; border:1px solid #e36159;" href="classList.jcl">수업목록</a>
						</div>
						<h2 class="panel-title" style="margin-bottom:1%;">수업결재</h2>		
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
						                                    <th>수업명</th>
						                                    <th>신청자</th>
						                                    <th>시작일</th>
						                                    <th>종료일</th>
						                                    <th>결재상태</th>
						                                   	<c:if test="${ loginUser.trainerGrade eq 'T' }">
						                                    	<th>결재자</th>
						                                    	<th></th>
						                                    </c:if>
						                                </tr>
						                            </thead>
						                            <tbody>
						                                <c:forEach items="${ alist }" var="cl"> 
					                                 		<tr>
					                                 			<td>${ cl.classNo }</td>
					                                 			<td>${ cl.className }</td>
					                                 			<td>${ cl.trainerName }</td>
					                                 			<td>${ cl.classStDate }</td>
					                                 			<td>${ cl.classEndDate }</td>
					                                 			<c:choose>
					                                 				<c:when test="${ cl.classStatus eq 'N' }">
					                                 					<td><p>대기</p></td>
					                                 				</c:when>
					                                 				<c:when test="${ cl.classStatus eq 'Y' }">
					                                 					<td><p style="color:#01DF01">승인</p></td>
					                                 				</c:when>
					                                 				<c:when test="${ cl.classStatus eq 'R' }">
					                                 					<td><p style="color:red">반려</p></td>
					                                 				</c:when>
					                                 			</c:choose>
					                                 			<%-- <td>${ cl.classStatus }</td> --%>
					                                 			<c:if test="${ loginUser.trainerGrade eq 'T' }">
					                                 				<c:choose>
					                                 					<c:when test="${ cl.classStatus ne 'N' }">
					                                 						<td>${ loginUser.trainerName }</td>
					                                 					</c:when>
					                                 					<c:otherwise>
					                                 						<td></td>
					                                 					</c:otherwise>
					                                 				</c:choose>
						                                 			<td class="appDetail">
						                                 				<c:choose>
						                                 					<c:when test="${ cl.classStatus eq 'N' }">
						                                 						<button class="modal-with-form" style="background:white; border:0px" href="#modalFormA" onclick="appDetailFn(${ cl.classNo })"><i class="fa fa-check"></i></button>
						                                 						<button class="modal-with-form" style="background:white; border:0px" href="#modalFormB" onclick="appDetail2Fn(${ cl.classNo })"><i class="fa fa-times"></i></button>
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
			
			<!-- 수업정보 모달폼-->
			<div id="modalFormA" class="modal-block modal-block-primary mfp-hide">
				<section class="panel">
				   <header class="panel-heading" style="background: #0f4c81;">
					  <h2 class="panel-title" style="color: white;">결재수업정보</h2>
				   </header>
				   <div class="panel-body">
					  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertApp.jap">
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
							   <textarea name="approveComment" id="approveComment" cols="60" rows="3" style="margin-top:1.5%"></textarea>
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
		 <!-- /수업정보 모달폼 -->
		 
		 
		 <!-- 수업정보2 모달폼-->
		<div id="modalFormB" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
				 <header class="panel-heading" style="background: #0f4c81;">
					<h2 class="panel-title" style="color: white;">결재수업정보</h2>
				 </header>
				 <div class="panel-body">
					<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertApp2.jap">
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
							<label class="col-sm-2 control-label">반려사유 :  </label>
							<div class="col-sm-9">
							   <textarea name="approveComment" id="approveComment" cols="60" rows="3" style="margin-top:1.5%"></textarea>
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
		 <!-- /수업정보2 모달폼 -->
		
		<!-- 수업정보 승인 ajax -->
		<script>
		var appDetailFn = function(rowKey) {
			var val1 = rowKey;
			console.log("클릭");
			console.log(val1);
			
			$.ajax({
				url:"appDetail.jap",
				data:{classNo:val1},
				type:"post",
				success:function(data){
					var value = "";
					console.log(data);
					
					value += '<div class="form-group">' +
								'<input name="trainerNo" type="hidden" value="' + data.trainerNo + '">' +
								'<label class="col-sm-2 control-label">신청자 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.trainerName + '</label>' +
								'</div>' +
							'</div>' +
							'<div class="form-group">' +
								'<input name="classNo" type="hidden" value="' + data.classNo + '">' +
								'<label class="col-sm-2 control-label">수업번호 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classNo + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">시작일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classStDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">종료일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classEndDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' + 
								'<label class="col-sm-2 control-label">최대인원 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + '<a class="modal-with-form" style="color:#777;" href="#modalFormD">0/' + data.classMaxCount + '</a>' + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								  '<label class="col-sm-2 control-label">수업내용 : </label>' +
								  '<div class="col-sm-9">' +
									 '<p style="margin-top:1.5%">' +
										 data.classContent +
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
		
		<!-- 수업정보2 승인 ajax -->
		<script>
		var appDetail2Fn = function(rowKey) {
			var val1 = rowKey;
			console.log("클릭");
			console.log(val1);
			
			$.ajax({
				url:"appDetail.jap",
				data:{classNo:val1},
				type:"post",
				success:function(data){
					var value = "";
					console.log(data);
					
					value += '<div class="form-group">' +
								'<input name="trainerNo" type="hidden" value="' + data.trainerNo + '">' +
								'<label class="col-sm-2 control-label">신청자 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.trainerName + '</label>' +
								'</div>' +
							'</div>' +
							'<div class="form-group">' +
								'<input name="classNo" type="hidden" value="' + data.classNo + '">' +
								'<label class="col-sm-2 control-label">수업번호 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classNo + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">시작일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classStDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								'<label class="col-sm-2 control-label">종료일 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + data.classEndDate + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' + 
								'<label class="col-sm-2 control-label">최대인원 : </label>' +
								'<div class="col-sm-9">' +
								   '<label class="col-sm-3" style="margin-top:1.5%">' + '<a class="modal-with-form" style="color:#777;" href="#modalFormD">0/' + data.classMaxCount + '</a>' + '</label>' +
								'</div>' +
							 '</div>' +
							 '<div class="form-group">' +
								  '<label class="col-sm-2 control-label">수업내용 : </label>' +
								  '<div class="col-sm-9">' +
									 '<p style="margin-top:1.5%">' +
										 data.classContent +
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
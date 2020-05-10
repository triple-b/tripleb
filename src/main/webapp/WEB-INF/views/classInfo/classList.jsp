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
				
				<!-- start: page -->
				<div class="row">
					<header class="panel-heading">
						<div class="panel-btn" style="margin-bottom:3%;">
							<button class="modal-with-form btn btn-default" style="float:right;" href="#modalFormD">삭제</button>
							<button id="addBtn" class="modal-with-form btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" href="#modalFormA">수업등록</button>
							<a class="btn btn-default" style="float:right; margin-right: 1%; background:#e36159; color:white; border:1px solid #e36159;" href="approveList.jcl">결재목록</a>
						</div>
					</header>
					
                    <div class="col-md-6 col-lg-12 col-xl-6" style="margin-top: 1%;">
                        <div class="row">
                        	<c:forEach items="${ list }" var="cl">
	                            <div class="col-md-12 col-lg-6 col-xl-6">
	                                <section class="panel panel-featured-left panel-featured-primary" style="width:90%;">
	                                    <div class="panel-body">
	                                        <div class="widget-summary">
	                                            <div class="widget-summary-col widget-summary-col-icon">
	                                            	<c:choose>
			                                            <c:when test="${ cl.weekDay eq '주중' }">
			                                                <div class="summary-icon bg-primary">
			                                                    <i class="fa fa-users"></i>
			                                                </div>
			                                            </c:when>
			                                            <c:when test="${ cl.weekDay eq '주말' }">
			                                            	<div class="summary-icon bg-primary" style="background: #e36159;">
	                                                        	<i class="fa fa-users"></i>
	                                                    	</div>
			                                            </c:when>
			                                            <c:otherwise>
			                                            	<div class="summary-icon bg-primary">
			                                                    <i class="fa fa-users"></i>
			                                                </div>
			                                            </c:otherwise>
		                                            </c:choose>
	                                            </div>
	                                            <table>
	                                                <tr>
	                                                    <td width="80px"><h4>수업명 : </h4></td>
														<th width="400px" style = "cursor:pointer;"><h4><a class="modal-with-form" href="#modalFormB">${ cl.className }</a></h4></th>
														<td><input name="checkCl1" type="checkbox" data-clNum="${ cl.classNo }" id="checkCl1" style="float:right"></td>
	                                                </tr>
	                                                <tr>
	                                                    <td width="60px">수업시간 : </td>
														<th width="400px">${ cl.weekDay }</th>
														<td></td>
	                                                </tr>
	                                                 <tr>
	                                                    <td width="60px">수업횟수 : </td>
														<th width="400px">${ cl.times }</th>
														<td></td>
	                                                </tr>
	                                                <tr>
	                                                    <td width="60px">담당자 : </td>
														<th width="400px">${ cl.trainerName } 트레이너</th>
														<td></td>
	                                                </tr>
	                                                <tr>
	                                                    <td width="60px">등록원 : </td>
														<th width="400px">Triple B</th>
														<td></td>
	                                                </tr>
	                                                <tr>
	                                                    <td width="60px">수강원 : </td>
														<th width="400px">${ cl.classCount }/${ cl.classMaxCount }</th>
														<td></td>
													</tr> 
	                                            </table>
	                                        </div>
										</div>
	                                </section>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>	
				</div>
				<!-- end: page -->
				
				<!-- 등록 모달폼-->
				<div id="modalFormA" class="modal-block modal-block-primary mfp-hide">
					<section class="panel">
					   <header class="panel-heading" style="background: #0f4c81;">
						  <h2 class="panel-title" style="color: white;">수강등록</h2>
					   </header>
					   <div class="panel-body">
						  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertClass.jcl">
						    <input type="hidden" name="trainerNo" value="${ loginUser.trainerNo }">
							<div class="form-group">
								<label class="col-sm-2 control-label">수업이름</label>
								<div class="col-sm-9">
								   <input type="text" name="className" id="className" class="form-control" required/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">상품명</label>
								<div class="col-sm-9">
								   <select id="proListDiv" name="productNo">
								   		
								   </select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">시작일</label>
								<div class="col-sm-9">
								   <input type="date" name="classStDate" id="classStDate" class="form-control" required/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">종료일</label>
								<div class="col-sm-9">
								   <input type="date" name="classEndDate" id="classEndDate" class="form-control" required/>
								</div>
							</div> 
							<div class="form-group">
								<label class="col-sm-2 control-label">최대인원</label>
								<div class="col-sm-9">
									<input type="number" min="1" name="classMaxCount" id="classMaxCount" required/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">횟수</label>
								<div class="col-sm-9" style="margin-top:1.5%">
									<input type="radio" name="times" id="times" value="주2회" required/> 주 2회
						   			<input type="radio" name="times" id="times" value="주3회" style="margin-left:3%" required/> 주 3회
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">요일</label>
								<div class="col-sm-9" style="margin-top:1.5%">
									<input type="radio" name="weekDay" id="weekDay" value="주중" required/> 주중
						   			<input type="radio" name="weekDay" id="weekDay" value="주말" style="margin-left:3%" required/> 주말
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">수업내용</label>
								<div class="col-sm-9">
								   <textarea class="form-control" name="classContent" id="classContent" rows="5"></textarea>
								</div>
						    </div>              
						    <footer class="panel-footer" style="margin-top:3%">
							   <div class="row">
								   <div class="col-md-12 text-right">
									  <button id="insertModal" class="btn btn-primary" type="submit">신청</button>
									  <button class="btn btn-default modal-dismiss">취소</button>
								   </div>
							   </div>
						    </footer>
						 </form>
					  </div>
				 </section>
			 </div>
			 <!-- /등록 모달폼 -->
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		
		<!-- 삭제 모달폼 -->
		 <div id="modalFormD" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
			   <header class="panel-heading" style="background: #0f4c81;">
			   </header>
			   <div class="panel-body">
				  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
					  <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">해당 수업을 삭제하시겠습니까?</div>        
				  </form>
			   </div>
			   <footer class="panel-footer">
				  <div class="row">
					 <div class="col-md-12 text-right" style="text-align: center;">
						<button id="deleteBtn2" class="btn btn-primary modal-confirm">확인</button>
						<button class="btn btn-default modal-dismiss" style="margin-left:2%">취소</button>
					 </div>
				  </div>
			   </footer>
			</section>
		 </div>
		 <!-- /삭제 모달폼 -->
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>
	
	<!-- 등록폼에 상품명 가져오는 ajax -->
	<script>
		$(function(){
			$("#addBtn").click(function(){
				
				$.ajax({
					url:"proList.jcl",
					data:{},
					type:"POST",
					success:function(list){
						var value = "";
												
						for(var i in list){
							value += '<option name="productNo" value="' + list[i].productNo + '">' + list[i].productName + '(' + list[i].productDays + '일, ' + list[i].times + ')</option>';
						}
						
						$("#proListDiv").html(value);
					},
					error:function(){
						console.log("통신실패");
					}
				});
			
			});
		});
	</script>
	<!-- /ajax -->
	
	<!-- 삭제 ajax -->
	<script>
		$(function(){
			$("#deleteBtn2").click(function(){
				var checkArr = new Array();
				
				$("input[name=checkCl1]:checked").each(function(){
					checkArr.push($(this).attr("data-clNum"));
				});
				
				console.log(checkArr);
				$.ajax({
					url:"delete.jcl",
					data:{checkArr:checkArr},
					type:"post",
					success:function(result){
						if(result > 0){
							location.href= "classList.jcl";
						}else{
							return "common/errorPage";
						}
					},
					error:function(){
						console.log("통신실패");
					}
				});
			});
		});
				
	</script>
	<!-- /ajax -->
	
	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/dashboard/examples.dashboard.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
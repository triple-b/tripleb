<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/ume.css" />
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
					<h2>PT회원 목록</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				<div class="row" style="margin-top: 4%;">
	                <div class="content">
	                    <br><br>
	                    <div class="innerOuter" style="margin-top:-5%">
	                        <section class="panel">
	                            <header class="panel-heading">
	                            	<c:if test="${ loginUser.trainerGrade ne 'N' }">
		                                <div class="panel-btn" style="margin-bottom: 1%;">
		                                    <a class="btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" href="list.ume">전체회원목록</a>
		                                </div>	
	                                </c:if>
	                                <h2 class="panel-title">PT회원목록</h2>				
	                            </header>
	                            
								<div class="panel-body">
									<table class="table table-bordered table-striped mb-none" id="datatable-default">
										<thead>
											<tr>
												<th>번호</th>
												<th>회원 이름</th>
												<th>생년월일</th>
												<th>성별</th>
												<th>연락처</th>
												<th>등록일</th>
												<th>수업명</th>
												<th>강사명</th>
												<th>시작일</th>
												<th>종료일</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${ list }" var="st">
											<tr>
												<td>${ st.memberNo }</td>
												<td>${ st.memberName }</td>
												<td>${ st.memberBirth }</td>
												<td>
													<c:choose>
														<c:when test="${ st.memberGender eq 'F' }">
														여
														</c:when>
														<c:otherwise>
														남
														</c:otherwise>
													</c:choose>
												</td>
												<td>${ st.memberPhone }</td>
												<td>${ st.memberEnrollDate }</td>
												<td>${ st.className }</td>
												<td>${ st.memberTrainer }</td>
												<td>${ st.memProductStart }</td>
												<td>${ st.memProductEnd }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</section>
						</div>
					</div>
				</div>
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		
		
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/ume.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
</body>
</html>
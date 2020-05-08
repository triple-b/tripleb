<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=" shortcut icon" href="image/favicon.ico">

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/vendor/css/select2.min.css' />
<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uca.css">
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
						<h2>일정관리</h2>
						<div class="right-wrapper pull-right">				
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
				</header>
				
				
				
			<section class="panel">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-9">
							
							      <div id="wrapper">
							          <div id="loading"></div>
							          <div id="calendar"></div>
							      </div>
							
							
							      <!-- 일정 추가 MODAL -->
							      <div class="modal mfp-wrap" tabindex="10000" role="dialog" id="eventModal">
							          <div class="modal-dialog" role="document">
							              <div class="modal-content">
							                  <div class="modal-header">
							                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							                              aria-hidden="true">&times;</span></button>
							                      <h4 class="modal-title"></h4>
							                  </div>
							                  <div class="modal-body">
							
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-allDay">하루종일</label>
							                              <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
							                          </div>
							                      </div>
							
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-title">일정명</label>
							                              <input class="inputModal" type="text" name="edit-title" id="edit-title"
							                                  required="required" />
							                          </div>
							                      </div>
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-start">시작</label>
							                              <input class="inputModal" type="text" name="edit-start" id="edit-start" />
							                          </div>
							                      </div>
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-end">끝</label>
							                              <input class="inputModal" type="text" name="edit-end" id="edit-end" />
							                          </div>
							                      </div>
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-color">색상</label>
							                              <select class="inputModal" name="color" id="edit-color">
							                                  <option value="#D25565" style="color:#D25565;">빨간색</option>
							                                  <option value="#9775fa" style="color:#9775fa;">보라색</option>
							                                  <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
							                                  <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
							                                  <option value="#f06595" style="color:#f06595;">핑크색</option>
							                                  <option value="#63e6be" style="color:#63e6be;">연두색</option>
							                                  <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
							                                  <option value="#4d638c" style="color:#4d638c;">남색</option>
							                                  <option value="#495057" style="color:#495057;">검정색</option>
							                              </select>
							                          </div>
							                      </div>
							                      <div class="row">
							                          <div class="col-xs-12">
							                              <label class="col-xs-4" for="edit-desc">설명</label>
							                              <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
							                                  id="edit-desc"></textarea>
							                          </div>
							                      </div>
							                  </div>
							                  <div class="modal-footer modalBtnContainer-addEvent">
							                      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							                      <button type="button" class="btn btn-primary" id="save-event">저장</button>
							                  </div>
							                  <div class="modal-footer modalBtnContainer-modifyEvent">
							                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							                      <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
							                      <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
							                  </div>
							              </div><!-- /.modal-content -->
							          </div><!-- /.modal-dialog -->
							      </div><!-- /.modal -->
							
							      <div class="panel panel-default">
							
							          <div class="panel-heading">
							              <h3 class="panel-title">필터</h3>
							          </div>
							
							          <div class="panel-body">
						
							
							              <div class="col-lg-6">
							                  <label for="calendar_view">등록자별</label>
							                  <div class="input-group">
							                  <c:forEach items="${ list }" var="t">
							                      <label class="checkbox-inline"><input class='filter' type="checkbox" value="${ t.trainerName }"
							                              checked>${ t.trainerName }</label>
							                   </c:forEach>
							                  </div>
							              </div>
							
							          </div>
							      </div>
							      <!-- /.filter panel -->


														
								</div>
								
							</div>
						</div>	
					</section>
			
				
				
				
				
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
	<script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/bootstrap.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/moment.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/fullcalendar.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/ko.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/select2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/addEvent.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/editEvent.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/etcSetting.js"></script>
</body>
</html>
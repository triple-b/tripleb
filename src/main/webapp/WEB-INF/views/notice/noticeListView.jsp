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
			<!--/ 왼쪽 메뉴 페이지 -->	
						
			<!-- 오른쪽 content 페이지 : 메뉴 선택시 수정되는 부분 -->
			<section role="main" class="content-body">
				<header class="page-header">
						<h2>공지사항</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
						<div class="row">
	
							<div class="content" style="width: 100%;">
												
						
								<section class="panel">
									
									<header class="panel-heading">
										
										<div class="panel-btn" style="margin-bottom:10px;">
											
											<a class="btn btn-primary"  style="float:right;" href="enrollForm.no">글작성</a>
										</div>
								
										<h1 class="panel-title">공지사항</h1>
									</header>
									<div class="panel-body">
										
										<table class="table table-bordered table-striped mb-none" id="datatable-default">
											<thead>
												<tr>
												  <th>글번호</th>
												  <th>제목</th>
												  <th>작성자</th>
												  <th>작성일</th>
												  
												</tr>
											  </thead>
											  <tbody>
												 <c:forEach items="${list}" var="n">
													  <tr>
														  <td>${n.noticeNo }</td>
														  <td>${n.noticeTitle }</td>
														  <td>${loginUser.trainerName}</td>
														  <td>${n.noticeDate}</td>
													  </tr>
												  </c:forEach>
											  </tbody>
										  </table>
									</div>
								</section>
						
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
	<script>
		$(function(){
			$("#datatable-default tbody tr").click(function(){
				location.href="detail.no?nno=" + $(this).children().eq(0).text();
			});
		});
	</script>
	
</body>
</html>
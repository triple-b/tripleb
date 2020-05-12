<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#datatable-default{
		cursor:pointer;
	}
	tbody tr>td:hover{
		background: darkgray;
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
				<header class="page-header">
					<h2>건의사항</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<div class="row">

                <div class="content">
                    <br><br>
                    <div class="innerOuter" style="margin-top:-5%">
                
                    <section class="panel" style="margin-top:2%">
                        <header class="panel-heading">
							<div class="panel-btn" style="margin-bottom: 1%;">
								<c:if test="${ !empty loginUser }">
									<a class="modal-with-form btn btn-primary" style="float:right; margin-right: 1%;" href="insertSugForm.jsu">작성</a>
								</c:if>
	                        </div>	
                            <h2 class="panel-title">건의사항</h2>				
						</header>
                        <div class="panel-body">
                            <table class="table table-bordered table-striped mb-none" id="datatable-default">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ list }" var="s">
                                   		<tr>
                                   			<td>${ s.sugNo }</td>
                                   			<td>${ s.sugTitle }</td>
                                   			<td>${ s.sugDate }</td>
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
        	<!-- end: page -->
				
		</section>
		<!-- 오른쪽 content 페이지 -->
	</div>
	<!--/ 전체 레이어 -->
	
		<script>
			
			$(document).ready(function() {
				
			    var table = $('#datatable-default').DataTable();
			     
			    $('#datatable-default tbody').on('click', 'tr', function () {
			        var data = table.row( this ).data();
			        var mno = data[0];
			        
			        location.href="detail.jsu?sugNo="+ mno;
			    });
			});
		</script>
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>
	
	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
</body>
</html>
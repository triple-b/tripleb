<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.btn-secondary2{
		background: white;
		color: #0088cc;
	}
	
	.btn-secondary3{
		background: white;
		color: #333333;
	}
</style>
</head>
<body>
	<section class="body">
		<!-- 상단 페이지 -->
		<jsp:include page="../common/header.jsp" />
		<!--/ 상단 페이지 -->

		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

		<!-- 전체 레이어 : 오른쪽 사이드바 제외 -->
		<div class="inner-wrapper">
			<!-- 왼쪽 메뉴 페이지 -->
			<jsp:include page="../common/sidebarLeft.jsp" />
			<!--/ 왼쪽 메뉴 페이지 -->
			
			<section role="main" class="content-body">
			
				<header class="page-header">
						<h2>건의사항</h2>
					
						<div class="right-wrapper pull-right">

							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					
				<div class="row">

	               <div class="content">
	                   <div class="innerOuter">
	               
	                   <section class="panel">
	                       	<header class="panel-heading">
	                           	<h2 class="panel-title">건의사항</h2>				
							</header>
	                       	<div class="panel-body" style="width: 100%;">
	                           <div class="innerOuter" style="float:left; width:80%; padding:3% 5%;">
	                           		<form id="insertForm" method="post" action="insertSug.jsu">
		                                <table id="contentArea" align="center" style="width:100%;">
		                                    <tr>
						                        <th><label for="title" style="font-size:20px;">제목</label></th>
						                        <td><input type="text" id="title" class="form-control input-lg mb-md" name="sugTitle" style="width:500px" required></td>
						                    </tr>
						                    <tr>
						                        <th><label for="writer" style="font-size:20px;">작성자</label></th>
						                        <td><input type="text" id="writer" class="form-control input-lg mb-md" value="${ loginUser.trainerName }" name="" readonly></td>
						                    </tr>
						                    <tr>
						                        <th><label for="writer" style="font-size:20px;">작성자 번호</label></th>
						                        <td><input type="text" id="writerNo" class="form-control input-lg mb-md" value="${ loginUser.trainerNo }" name="trainerNo" readonly></td>
						                    </tr>
						                    <tr>
						                        <th><label for="writer" style="font-size:20px;">작성일</label></th>
						                        <td><input type="text" id="date" class="form-control input-lg mb-md" value="<c:out value="${today}"/>" name="sugDate" readonly></td>
						                    </tr>
						                    <tr>
						                        <th colspan="2" style="font-size:20px; padding-bottom:20px;"><label for="content">내용</label></th>
						                    </tr>
						                    <tr>
						                        <th colspan="2"><textarea class="form-control" required name="sugContent" id="content" rows="10" style="resize:none;"></textarea></th>
						                    </tr>
		                                </table>
		                                
	                                	<br>
	                                
		                                <div align="center">
		                                	<button type="submit" class="btn btn-primary" onclick="alert('작성 완료');">등록</button>
		                                    <a class="btn btn-secondary3 modal-with-form" href="#modalFormC">취소</a>
		                                </div>
	                                </form>
	                                
                            </div>
                            	
	                        <div style="float:left; padding-left:3%; width:10%;">
	                        	<div style="margin-left:auto; margin-right:auto;">
	                                <a href="https://naumcare.co.kr:56790/brand/tratac" target="_blank"><img src="${ pageContext.servletContext.contextPath }/resources/images/sugBanner.png"></a>
								</div>	                                
	                         </div>
	                        </div>
	                       </section>
	                   </div>
	                   <br><br>
	               </div>
            	</div>
            <!-- end: page -->
			
			<!-- 작성 취소 Modal Form -->
            <div id="modalFormC" class="modal-block modal-block-primary mfp-hide">
                 <section class="panel">
                 <header class="panel-heading" style="background: #0f4c81;">
                 </header>
                 <div class="panel-body">
                     <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
                         <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">작성을 취소하시겠습니까?</div>        
                     </form>
                 </div>
                 <footer class="panel-footer">
                     <div class="row">
                         <div class="col-md-12 text-right" style="text-align: center;">
                             <a class="btn btn-secondary" href="selectSugList.jsu">확인</a>
                             <a class="btn btn-secondary modal-dismiss">취소</a>
                         </div>
                     </div>
                 </footer>
                 </section>
             </div>
             <!-- end modal -->  
             
             <!-- 작성  Modal Form -->
             <div id="modalFormA" class="modal-block modal-block-primary mfp-hide">
                 <section class="panel">
                 <header class="panel-heading" style="background: #0f4c81;">
                 </header>
                 <div class="panel-body">
                     <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
                         <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">작성하시겠습니까?</div>        
                     </form>
                 </div>
                 <footer class="panel-footer">
                     <div class="row">
                         <div class="col-md-12 text-right" style="text-align: center;">
                             <button class="btn btn-primary modal-confirm" type="submit">확인</button>
                             <a class="btn btn-secondary modal-dismiss">취소</a>
                         </div>
                     </div>
                 </footer>
                 </section>
             </div>
             <!-- end modal -->  
             
             
			</section>
		
		</div>
		<!--/ 전체 레이어 -->
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
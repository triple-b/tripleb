<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer>table tr:nth-child(4){
		border-bottom:1px solid black;
	}
	.outer>table tr:nth-child(2){
		border-bottom:1px solid black;
	}
	.outer>table{
		width:615px;
		height:300px;
	}
	.outer>table p{
		height:230px;
	}
			
    .select{width:20%;}
    .text{width:53%;}
    
    .content{
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        
        padding:5% 15%;
        background:white;
    }
    .small-text{
        color: #999999;
        font-family: "Nanum Gothic","Apple SD Gothic Neo","맑은 고딕","Malgun Gothic","AppleGothic","돋움",Dotum,Helvetica,Arial,sans-serif;
        font-size: 65%;
        margin-top: 10px;
        display: block;
        line-height: 20px;
        -webkit-tap-highlight-color: transparent;
    }
    table *{margin:5px;}
    table{width:100%;}
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
				<!-- start: page -->
                <section class="panel">
                    <div class="sugDetail">
                        <div class="innerOuter" style="float: left;">
                            
                            <br>
                            <h3>${ s.sugTitle }</h3>
                            <br>
                            
                            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                            <form id="updateForm" method="post" action="update.jsu">
                                <input type="hidden" name="sugNo" value="${ s.sugNo }">
	                            <table id="contentArea" align="center" class="table">
	                                <tr>
	                                    <th width="90%">${ s.sugDate }</th>
	                                    <td>No.&nbsp;&nbsp;${ s.sugNo }</td>
	                                </tr>
	                                <tr>
                        				<th colspan="3"><textarea class="form-control" required name="sugContent" id="content" rows="10" style="resize:none;">${ s.sugContent }</textarea></th>
                    				</tr>
	                            </table>
	                            
	                            <div align="center">
	                                <button type="submit" class="btn btn-secondary">수정</button>
	                                <button class="btn btn-secondary" onclick="">취소</button>
	                            </div> 
                            </form>
                            <br>
                            
                            
                        </div>
                        <div style="float: right;">
                            <a href="https://naumcare.co.kr:56790/brand/tratac" target="_blank"><img src="${ pageContext.servletContext.contextPath }/resources/images/sugBanner.png"></a> 
                        </div>
                    </div>
                </section>
            	<!-- end: page -->
				
				<!-- 작성 취소 Modal Form -->
	            <div id="modalFormC" class="modal-block modal-block-primary mfp-hide">
	            	<input type="hidden" name="sugNo" value="${ s.sugNo }">
	                 <section class="panel">
	                 <header class="panel-heading" style="background: #0f4c81;">
	                 </header>
	                 <div class="panel-body">
	                     <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
	                         <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">수정을 취소하시겠습니까?</div>        
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
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
</body>
</html>
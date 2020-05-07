<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
			
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
            margin:auto;
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
						<h2>공지사항</h2>
					
						<div class="right-wrapper pull-right">
							
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<div class="row">

						<div class="conten" style="width: 100%;">
							<br><br>
							
							<div class="innerOuter" style="border-bottom-width: 5px;">
								<a class="btn btn-default" style="float:right" href="List.no">목록으로</a>
							<div class="content-header">
								<h2 class="header-text">
									${n.noticeTitle }
									<small class="small-text"> ${loginUser.trainerName} </small>
									<small class="small-text">  ${n.noticeDate }</small>
								</h2>
							</div>
							
						</div>
							<div class="innerOuter">
								
								<br>
								<h3>${n.noticeTitle }</h3>
								<br>
								
								<!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
								
								<table id="contentArea" align="center" class="table">
								   
									<tr>
										<th>내용</th>
										<td colspan="3"></td>
									</tr>
									<tr>
										<td colspan="4"><p style="height:150px">${n.noticeContent }</p></td>
									</tr>
								</table>
								<br>
								<c:if test="${ loginUser.trainerNo eq n.trainerNo }">
									<div align="center">
										<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
										<button class="btn btn-primary" onclick="postFormSubmit(2);">수정하기</button>
										<button class="btn btn-default" onclick="postFormSubmit(1);">삭제하기</button>
									</div>
									
									<form id="postForm" action="" metode="post">
										<input type="hidden" name="nno" value="${ n.noticeNo }">
									</form>
									
									<script>
										function postFormSubmit(num){
											if(num==1){// 삭제하기 클릭시
												$("#postForm").attr("action", "delete.no");
												$("#postForm").submit();
											}else{ // 수정하기 클릭시
												$("#postForm").attr("action", "updateForm.no");
												$("#postForm").submit();
											}
										}
									</script>
								</c:if>
								<br><br>
			
							</div>
							<br><br>
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
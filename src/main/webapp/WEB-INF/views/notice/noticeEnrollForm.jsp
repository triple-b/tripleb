<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
			
			
			.content{
            background-color:rgb(247, 245, 245);
            width:100%;
            margin:auto;
        }
        .innerOuter{
            border:1px solid lightgray;
            width:100%;
            margin:auto;

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
        table{width:95%;}
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
							
						<div class="content" style="width: 100%;">
						
						<section class="panel">
									
									<header class="panel-heading">
										<h1 class="panel-title">공지사항 작성하기</h1>
									</header>
							
							<div class="panel-body">
							
								<form id="updateForm" method="post" action="insert.no" enctype="multipart/form-data" style="width:80%; padding:3% 0%; margin-left:auto; margin-right:auto;">
									<table align="center">
										<tr>
											<th><label for="title" style="font-size:20px;">제목</label></th>
											<td><input type="text" id="title" class="form-control input-lg mb-md" name="noticeTitle" placeholder="제목을 작성해주세요" required></td>
										</tr>
										<tr style="padding-bottom:20px;">
											<th><label for="title" style="font-size:20px;">작성자</label></th>
											<td><input type="text" id="title" class="form-control input-lg mb-md" value="${loginUser.trainerName}" readonly></td>
											<td><input type="hidden" id="title" class="form-control" name="trainerNo" value="${loginUser.trainerNo}" readonly></td>
										</tr>
										<tr>
											<th colspan="2" ><label for="content" style="font-size:20px; padding-bottom:20px;">내용</label></th>
										</tr>
										<tr>
											<th colspan="2"><textarea class="form-control" required name="noticeContent" id="content" rows="15" style="resize:none;" placeholder="공지사항 내용을 작성해주세요"></textarea></th>
										</tr>
									</table>
									<br>
					
									<div align="center">
										<button type="submit" class="btn btn-primary">등록</button>
										<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">취소</button>
									</div>
								</form>
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
</body>
</html>
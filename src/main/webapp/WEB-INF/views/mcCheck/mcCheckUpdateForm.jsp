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
				width:90%;
				margin:auto;
			}
			.innerOuter{
				border:1px solid lightgray;
				width:90%;
				margin:auto;
				padding:5% 5%;
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
		.Machine{
				height:300px;
				overflow-y: visible;
				overflow-x: hidden;
			}
		</style>
</head>
<body>
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
						<h2>시설점검</h2>
					
						<div class="right-wrapper pull-right">
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<div class="row">
						<div class="conten" style="width: 100%;">
							<br><br>
							<div class="innerOuter">
								<section class="panel">
									<header class="panel-heading">
										<h1 class="panel-title">시설점검 수정</h1>
									</header>
									<div class="panel-body">
										<form class="form-horizontal mb-lg" novalidate="novalidate" id="updateForm" method="post" action="" enctype="">

											<div class="Machine">
												<div class="form-group">
													<label class="col-sm-3 control-label">점검기구</label>
													<div class="col-sm-9">
														<input type="text" name="Quantity" class="form-control" placeholder="" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label">점검부위</label>
													<div class="col-sm-9">
														<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
													</div>
												</div>
												
											</div>
											<footer class="panel-footer">
												<div class="row">
													<div align="center" style="margin: auto;">
														<button type="submit" class="btn btn-secondary">완료</button>
														<button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">취소</button>
													</div>
												</div>
											</footer>
										</form>
									</div>
								</section>
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
</body>
</html>
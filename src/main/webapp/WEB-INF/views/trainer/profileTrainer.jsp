<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 프로필 업로드 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
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
					<h2>마이 페이지</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<div class="row">
						<div class="col-md-4 col-lg-3">

							<section class="panel">
								<div class="panel-body">
									<div class="thumb-info mb-md">
										<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/!logged-user.jpg" class="rounded img-responsive" alt="John Doe">
										<div class="thumb-info-title">
											<span class="thumb-info-inner">${ loginUser.trainerName }</span>
											<span class="thumb-info-type">
											<c:if test="${ loginUser.trainerGrade eq 'N'}">
											사원
											</c:if>
											<c:if test="${ loginUser.trainerName eq 'T'}">
											팀장
											</c:if>
											</span>
										</div>
									</div>


								</div>
							</section>

						</div>
						<div class="col-md-8 col-lg-">

							<div class="tabs">
								<ul class="nav nav-tabs tabs-primary">
									<li class="active">
										<a href="#edit" data-toggle="tab">Edit</a>
									</li>
								</ul>
								<div class="tab-content">
									<div id="edit" class="tab-pane active">

										<form class="form-horizontal" method="get" action="update.utr">
											<h4 class="mb-xlg">필수사항</h4>
											<fieldset>
											<input type="hidden" name="trainerNo" value="${ loginUser.trainerNo }">
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileFirstName">이름</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileFirstName" name="trainerName" value="${ loginUser.trainerName }" disabled>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileAddress">핸드폰</label>
													<div class="col-md-8">
														<input id="phone" data-plugin-masked-input data-input-mask="999-999-9999" placeholder="123-123-1234"  class="form-control" id="profileAddress" name="trainerPhone" value="${ loginUser.trainerPhone }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileCompany">이메일</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileCompany" name="trainerEmail" value="${ loginUser.trainerEmail }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileCompany">주소</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileCompany" name="trainerAddress" value="${ loginUser.trainerAddress }">
													</div>
												</div>
												<div class="form-group">
												<label class="col-md-3 control-label">프로필 업로드</label>
												<div class="col-md-8">
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<div class="input-append">
															<div class="uneditable-input col-md-8">
																<i class="fa fa-file fileupload-exists"></i>
																<span class="fileupload-preview"></span>
															</div>
															<span class="btn btn-default btn-file">
																<span class="fileupload-exists">변경</span>
																<span class="fileupload-new">파일 업로드</span>
																<input type="file" name="newTrainerThumbnail"/>
																<input type="hidden" name="trainerThumbnail" value="${ loginUser.trainerThumbnail }">
															</span>
															<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">초기화</a>
														</div>
													</div>
												</div>
											</div>
											</fieldset>
											
											<!-- 기타사항 -->
											<hr class="dotted tall">
											<h4 class="mb-xlg">기타사항</h4>
											<fieldset>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileBio">수상경력</label>
													<div class="col-md-8">
														<textarea class="form-control" rows="3" id="profileBio" name="trainerAward">${ loginUser.trainerAward }</textarea>
													</div>
												</div>
											</fieldset>
											<hr class="dotted tall">
											<h4 class="mb-xlg">출근번호 변경</h4>
											<fieldset class="mb-xl">
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileNewPassword">새로운 출근번호</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileNewPassword">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileNewPasswordRepeat">출근번호 확인</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileNewPasswordRepeat">
													</div>
												</div>
											</fieldset>
											<div class="panel-footer">
												<div class="row">
													<div class="col-md-9 col-md-offset-3">
														<button type="submit" class="btn btn-primary">등록</button>
														<button type="reset" class="btn btn-default">취소</button>
													</div>
												</div>
											</div>

										</form>

									</div>
								</div>
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
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 프로필 업로드 css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
					<h2>트레이너 정보수정</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				<div class="row">
						<div class="col-md-4 col-lg-3">
							
							<section class="panel">
								<div class="panel-body">
									<div class="thumb-info mb-md">
										<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ t.trainerThumbnail}" class="rounded img-responsive" alt="John Doe">
										<div class="thumb-info-title">
											<span class="thumb-info-inner">${ t.trainerName }</span>
											<span class="thumb-info-type">
											<c:choose>
												<c:when test="${ t.trainerGrade eq 'B'}">
												사원
												</c:when>
												<c:when test="${ t.trainerGrade eq 'E'}">
												팀장
												</c:when>
												<c:otherwise>
												대표
												</c:otherwise>
											</c:choose>
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
										<a href="#edit" data-toggle="tab">프로필</a>
									</li>
								</ul>
								<div class="tab-content">
									<div id="edit" class="tab-pane active">

										<form class="form-horizontal" action="trUpdateCurrent.utr" method="post" enctype="multipart/form-data">
											<h4 class="mb-xlg">필수사항</h4>
											<fieldset>
											<input type="hidden" name="trainerNo" value="${ t.trainerNo }">
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileFirstName">이름</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileFirstName" name="trainerName" value="${ t.trainerName }" disabled>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileJoin">입사일</label>
													<div class="col-md-8">
														<p id="profileJoin" style="margin:0px; padding-top:7px">
															${ t.trainerJoin }
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileGrade">직급</label>
													<div class="col-md-8">
														<label class="form-control" id="profileGrade">
														<input type="hidden" id="profileGrade" name="trainerGrade" value="${t.trainerGrade }"/>
															<c:choose>
																<c:when test="${ t.trainerGrade eq 'B'}">
																	사원
																</c:when>
																<c:when test="${ t.trainerGrade eq 'E'}">
																	팀장
																</c:when>
																<c:otherwise>
																	관장
																</c:otherwise>
															</c:choose>
														</label>
														<select name="trainerGrade" id="gradeVal">
															<option value="B">사원</option>
															<option value="E">팀장</option>
															<option value="M">관장</option>
														</select>
														<button type="button" style="margin-left:2%; border:0px; background:none" onclick="changeGrade(${ t.trainerNo })">변경</button>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileBirth">생년월일</label>
													<div class="col-md-8">
														<p id="profileBirth" style="margin:0px; padding-top:7px">
															<fmt:parseDate value="${t.trainerBirth}" var="noticePostDate" pattern="yyyyMMdd"/>
															<fmt:formatDate value="${noticePostDate}" pattern="yyyy/MM/dd"/>
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileNick">닉네임</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileNick" name="trainerNick" value="${ t.trainerNick }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profilePhone">핸드폰</label>
													<div class="col-md-8">
														<input id="text" class="form-control" id="profilePhone" name="trainerPhone" value="${ t.trainerPhone }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileCompany">이메일</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileCompany" name="trainerEmail" value="${ t.trainerEmail }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="profileAddress">주소</label>
														<div class="col-md-8">
															<div class="col-sm-5" style="padding:0px;">
																<input type="text" class="form-control" id="profileAddress" name="trainerAddress" value="${ t.trainerAddress }">
															</div>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
															</div>
														<div class="col-sm-3" style="padding:0px;">
															<input type="button" class="btn btn-default" onclick="addressSearch()" value="주소 검색"><br>
														</div>
													<span id="guide" style="color:#999"></span>
													</div>
													<script>
														function addressSearch(){
													
															new daum.Postcode({
														        oncomplete: function(data) {
														        	 var addr = ''; // 주소 변수
														                var extraAddr = ''; // 참고항목 변수

														                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
														                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														                    addr = data.roadAddress;
														                } else { // 사용자가 지번 주소를 선택했을 경우(J)
														                    addr = data.jibunAddress;
														                }

														                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
														                if(data.userSelectedType === 'R'){
														                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
														                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
														                        extraAddr += data.bname;
														                    }
														                    // 건물명이 있고, 공동주택일 경우 추가한다.
														                    if(data.buildingName !== '' && data.apartment === 'Y'){
														                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
														                    }
														                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														                    if(extraAddr !== ''){
														                        extraAddr = ' (' + extraAddr + ')';
														                    }
														                    // 조합된 참고항목을 해당 필드에 넣는다.
														                }

														                // 우편번호와 주소 정보를 해당 필드에 넣는다.
														                document.getElementById("profileAddress").value = addr;
														                // 커서를 상세주소 필드로 이동한다.
														                document.getElementById("detailAddress").focus();
														        }
														    }).open();
													}
													
													</script>
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
																<input type="file" name="newThumbnail"/>
																<input type="hidden" name="trainerThumbnail" value="${ t.trainerThumbnail }"/>
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
														<textarea class="form-control" rows="3" id="profileBio" name="trainerAward">${ t.trainerAward }</textarea>
													</div>
												</div>
											</fieldset>
											<hr class="dotted tall">
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
	
	
	<!-- 직급변경 -->
	<script>
		var changeGrade = function(rowkey){
			var trainerNo = rowkey;
			
			console.log(trainerNo);
			trainerGrade = $("#gradeVal option:selected").attr('value');
			console.log(trainerGrade);
			
			$.ajax({
				url:"updateGrade.utr",
				data:{trainerNo:trainerNo,
					  trainerGrade:trainerGrade},
				type:"post",
				success:function(t){
					var value = "";
					
					if(t.trainerGrade == 'B'){
						$("#profileGrade").val(t.trainerGrade);
						console.log($("#profileGrade").val(t.trainerGrade))
						$("#profileGrade").text('사원');
					}else if(t.trainerGrade == 'E'){
						$("#profileGrade").val(t.trainerGrade);
						console.log($("#profileGrade").val(t.trainerGrade))
						$("#profileGrade").text('팀장');
					}else{
						$("#profileGrade").val(t.trainerGrade);
						console.log($("#profileGrade").val(t.trainerGrade))
						$("#profileGrade").text('관장');
					}
				},
				error:function(){
					console.log("직급변경 실패");
				}
			});
		}
	</script>
	
	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>

</body>
</html>
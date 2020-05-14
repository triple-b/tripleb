<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/ume.css" />
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
						<h2>마이 페이지</h2>
						<div class="right-wrapper pull-right">				
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
			
			<!-- 오른쪽 content 페이지 -->
			
			<!-- states -->
				<div class="row">	
					<div class="tabs tabs-primary">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tabmemberList" data-toggle="tab">회원 리스트</a>
							</li>
							<li>
								<a href="#tabmemberpause" data-toggle="tab">일시정지 회원</a>
							</li>
							<li>
								<a href="#tabmemberdelete" data-toggle="tab">만료 회원</a>
							</li>
							<li>
								<a href="#tabmemberblack" data-toggle="tab">블랙리스트</a>
							</li>
						</ul>


						<div class="tab-content">
							<!--첫번째 탭-->
							<div id="tabmemberList" class="tab-pane active">
								<!-- start: page -->

							<section class="panel">
								<header class="panel-heading">
									<div class="panel-btn" style="margin-bottom:10px;">
										<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memBlack" href="#memberblack" style="float:right; margin-right:10px;">블랙리스트 등록 </a>
										<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memPause" href="#memberpause" style="float:right">회원 일시정지 </a>
										<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memDel" href="#memberDel" style="color:red; float:right">회원 삭제 </a>
										<a class="mb-xs mt-xs mr-xs modal-basic btn btn-primary" href="#memberinsert" style="float:right" >회원 등록 </a>
									</div>
			
									<h1 class="panel-title">회원 리스트</h1>

								</header>


								<div class="panel-body">
									<table class="table table-bordered table-striped mb-none" id="datatable-default">
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" onclick="checkAll();"/></th>
												<th>번호</th>
												<th>회원 이름</th>
												<th>담당 트레이너</th>
												<th>성별</th>
												<th>연락처</th>
												<th>회원권</th>
												<th>등록일</th>
												<th>시작일</th>
												<th>종료일</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${ list }" var="m">
											<tr class="gradeX">
												<td><input type="checkbox" name="checkRow" value="${ m.memberNo }"></td>
												<td>${ m.memberNo }</td>
												<td>
													<a class="mb-xs mt-xs mr-xs modal-basic" href="#memberupdate">
														${ m.memberName }
													</a>
												</td>
												<td>
													<c:choose>
														<c:when test="${ empty m.memberTrainer }">
														</c:when>
														<c:otherwise>
															${ m.memberTrainer }
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${ m.memberGender eq 'F' }">
														여
														</c:when>
														<c:otherwise>
														남
														</c:otherwise>
													</c:choose>
												</td>
												<td>${ m.memberPhone }</td>
												<td>${ m.productName }</td>
												<td>${ m.memberEnrollDate }</td>
												<td>${ m.memProductStart }</td>
												<td>${ m.memProductEnd }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</section>		

							<!-- end: page -->
							</div>

							<!-- 두번탭 -->
							<div id="tabmemberpause" class="tab-pane">

								<section class="panel">
									<header class="panel-heading">
										<div class="panel-btn" style="margin-bottom:10px;">
											<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memPauseCancel" href="#memberpauseCancel" style="float:right"> 일시정지 해제 </a>
											<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memDel" href="#memberDel" style="color:red; float:right"> 회원 삭제 </a>

										</div>
				
										<h1 class="panel-title">회원 일시정지</h1>								
									</header>


									<div class="panel-body">
										<table class="table table-bordered table-striped mb-none" id="datatable-default1">
											<thead>
												<tr>
													<th><input type="checkbox" name="checkAll" onclick="checkAll();"/></th>
													<th>번호</th>
													<th>회원 이름</th>
													<th>담당 트레이너</th>
													<th>성별</th>
													<th>연락처</th>
													<th>회원권</th>
													<th>등록일</th>
													<th>일시정지 시작일</th>
													<th>일시정지 종료일</th>	
												</tr>
											</thead>
												<tbody>
												<c:forEach items="${ plist }" var="p">
													<tr style="background-color: lightgray;">
														<td><input type="checkbox" name="checkRow" value="${ p.memberNo }"></td>
														<td>${ p.memberNo }</td>
														<td class="text-semibold text-dark">
															<a class="mb-xs mt-xs mr-xs modal-basic memPName" href="#memberupdate">${ p.memberName }</a>
														</td>
														<td>
														<c:choose>
															<c:when test="${ empty p.memberTrainer }">
															</c:when>
															<c:otherwise>
																${ p.memberTrainer }
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${ p.memberGender eq 'F' }">
																여
															</c:when>
															<c:otherwise>
																남
															</c:otherwise>
														</c:choose>
													</td>
													<td>${ p.memberPhone }</td>
													<td>${ p.productName }</td>
													<td>${ p.memberEnrollDate }</td>
													<td>${ p.pauseStart }</td>
													<td>${ p.pauseEnd }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</section>		
								
							</div>
							
							<!-- 세번쨰 -->
							<div id="tabmemberdelete" class="tab-pane">

								<section class="panel">
									<header class="panel-heading">
										<div class="panel-btn" style="margin-bottom:10px;">
											<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memDel" href="#memberDel" style="color:red; float:right"> 회원 삭제 </a>
										</div>
										<h1 class="panel-title"> 만료 회원 리스트 </h1>
									</header>

									<div class="panel-body">
										<table class="table table-bordered table-striped mb-none" id="datatable-default2">
											<thead>
												<tr>
													<th><input type="checkbox" name="checkAll" onclick="checkAll();"/></th>
													<th>번호</th>
													<th>회원 이름</th>
													<th>담당 트레이너</th>
													<th>성별</th>
													<th>연락처</th>
													<th>회원권</th>
													<th>등록일</th>
													<th>시작일</th>
													<th>종료일</th>	
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${ elist }" var="e">
												<tr style="background-color: rgb(255, 213, 213);">
													<td><input type="checkbox" name="checkRow" value="${ e.memberNo }"/></td>
													<td>${ e.memberNo }</td>
													<td class="text-semibold text-dark">
														<a class="mb-xs mt-xs mr-xs modal-basic" href="#memberupdate">
															${ e.memberName }
														</a>
													</td>
													<td>
														<c:choose>
															<c:when test="${ empty e.memberTrainer }">
															</c:when>
															<c:otherwise>
																${ e.memberTrainer }
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${ e.memberGender eq 'F' }">
																여
															</c:when>
															<c:otherwise>
																남
															</c:otherwise>
														</c:choose>
													</td>
													<td>${ e.memberPhone }</td>
													<td>${ e.productName }</td>
													<td>${ e.memberEnrollDate }</td>
													<td>${ e.memProductStart }</td>
													<td>${ e.memProductEnd }</td>
												</tr>
											</c:forEach>
											
											</tbody>
										</table>
									</div>
								</section>	
							</div>
							<!-- 네번쨰 -->
							<div id="tabmemberblack" class="tab-pane">

								<section class="panel">
									<header class="panel-heading">
										<div class="panel-btn" style="margin-bottom:10px;">
											<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memblack_cancel" href="#memberblcancel" style="float:right"> 블랙리스트 해제 </a>
											<a class="mb-xs mt-xs mr-xs modal-basic btn btn-default btn_memDel" href="#memberDel" style="color:red; float:right"> 회원 삭제 </a>
										</div>
										<h1 class="panel-title"> 블랙리스트</h1>
									</header>

									<div class="panel-body">
										<table class="table table-bordered table-striped mb-none" id="datatable-default3">
											<thead>
												<tr>
													<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
													<th id="">번호</th>
													<th>회원 이름</th>
													<th>담당 트레이너</th>
													<th>성별</th>
													<th>연락처</th>
													<th>등록일</th>
													<th>블랙리스트 등록일</th>
													<th>블랙리스트 사유</th>	
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${ blist }" var="b">
												<tr style="background-color: rgb(255, 213, 213);">
													<td><input type="checkbox" name="checkRow" value="${ b.memberNo }"/></td>
													<td>${ b.memberNo }</td>
													<td class="text-semibold text-dark">
														<a class="mb-xs mt-xs mr-xs modal-basic" href="#memberupdate">
															${ b.memberName }
														</a>
													</td>
													<td>
														<c:choose>
															<c:when test="${ empty b.memberTrainer }">
															</c:when>
															<c:otherwise>
																${ b.memberTrainer }
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${ b.memberGender eq 'F' }">
																여
															</c:when>
															<c:otherwise>
																남
															</c:otherwise>
														</c:choose>
													</td>
													<td>${ b.memberPhone }</td>
													<td>${ b.memberEnrollDate }</td>
													<td>${ b.blacklistEnrollDate }</td>
													<td>${ b.blacklistContent }</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</section>	
							</div>	

							<script>
								function checkAll(){
									if($("input[name=checkAll]").is(':checked') ){
										$("input[name=checkRow]").prop("checked", true);
									}else{
										$("input[name=checkRow]").prop("checked", false);
									}
								}
							</script>
						</div>
					</div>
					
				</div>
				<!-- end: page -->
				
				


				<!--회원등록 Modal  -->
				<div id="memberinsert" class="modal-block mfp-hide modal-block-lg">
					<form id="enrollForm" action="insert.ume" method="post" enctype="multipart/form-data">
						<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">회원 등록</h2>
							</header>
							<div class="panel-body">
								<div class="modal-wrapper">
									<div class="modal-text">
										<div class="form-group">

										<div class="form-group">
											<label class="col-sm-3 control-label">회원 이름 <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" id="memberName" name="memberName" class="form-control" placeholder="홍길녀" required/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">생년월일 <span class="required">*</span></label>
											<div class="col-sm-2">
												<input type="number" name="memberYear" min="00" class="form-control" placeholder="년(두글자)" required/>
											</div>
											<div class="col-sm-2">
												<select name="memberMonth" class="form-control mb-md">
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<div class="col-sm-2">
												<input type="number" name="memberDay" class="form-control" min="1" max="31" placeholder="07" required/>
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-3 control-label" for="inputSuccess">성별<span class="required">*</span></label>
											<div class="col-md-6">
												<label class="checkbox-inline">
													<input type="checkbox" name="memberGender" id="Male" value="M"> 남
												</label>
									
												<label class="checkbox-inline">
													<input type="checkbox" name="memberGender" id="Female" value="F"> 여
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">이메일<span class="required">*</span></label>
											<div class="col-sm-9">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-envelope"></i>
													</span>
													<input type="email" name="memberEmail" class="form-control" placeholder="eg.: email@email.com" required/>
												</div>
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-3 control-label">휴대폰 <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" name="memberPhone" class="form-control" placeholder="01000000000" required/>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label"> 주소 <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" name="memberAddress" class="form-control" required/>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label"> 키(cm)</label>
											<div class="col-sm-9">
												<input type="text" name="memberHeight" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label"> 몸무게(kg)</label>
											<div class="col-sm-9">
												<input type="text" name="memberWeight" class="form-control">
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-3 control-label">File Upload</label>
											<div class="col-md-6">
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="input-append">
														<div class="uneditable-input">
															<i class="fa fa-file fileupload-exists"></i>
															<span class="fileupload-preview"></span>
														</div>
														<span class="btn btn-default btn-file">
															<span class="fileupload-exists">Change</span>
															<span class="fileupload-new">Select file</span>
															<input type="file" name="uploadFile" />
														</span>
														<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remove</a>
													</div>
												</div>
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-3 control-label">특이사항 </label>
											<div class="col-sm-9">
												<textarea name="memberNote" rows="5" class="form-control" style="resize: none;"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-primary">등록</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</section>
					</form>
				</div>
				<!--회원등록 Modal  END-->

				<!-- 회원 일시정지 Modal -->
				<div id="memberpause" class="modal-block mfp-hide">
					<form method="post" action="pause.ume">
						<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">회원 일시정지</h2>
							</header>
							<div class="panel-body">
								<div class="modal-wrapper">
									<div class="modal-text">
										<div class="panel-body">
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">일시정지 기간</label>
												<div class="col-md-6">
													<input type="hidden" id="pauseMemberNo" name="memberNo" />
													<input type="number" id="inlineCheckbox3" name="pauseDate" class="form-control" min="1" max="30" placeholder="ex) 7" required> 
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">시작일</label>
												<div class="col-md-6">
													<input type="date" class="form-control" name="pauseStart" required>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-primary">일시정지</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</section>
					</form>
				</div>
				<!--회원일시정지 Modal end -->
				
				<!-- 회원 일시정지 해제 Modal -->
				<div id="memberpauseCancel" class="modal-block mfp-hide">
					<form method="post" action="pauseCancel.ume">
						<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">회원 일시정지 해제</h2>
							</header>
							<div class="panel-body">
								<div class="modal-wrapper">
									<div class="modal-text">
										<div class="panel-body">
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">회원명</label>
												<div class="col-md-6">
													<input type="hidden" id="pauseCancleMemberNo" name="memberNo" />
													<input type="text" id="pauseCancleMemberName" name="memberName" class="form-control" required disabled> 
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">일시정지 해제일</label>
												<div class="col-md-6">
													<input type="date" class="form-control" name="pauseCancelDate" required>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-primary">일시정지</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
						</section>
					</form>
				</div>
				<!--회원일시정지 Modal 해제 end -->

				<!-- 회원 블랙리스트  Modal -->
				<div id="memberblack" class="modal-block mfp-hide">
					<form id="blackModal" method="post" action="black.ume">
						<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">회원 블랙리스트 등록</h2>
						</header>
						<div class="panel-body">
							<div class="modal-wrapper">
								<div class="modal-text">
									<div class="panel-body">

										<div class="form-group">
											<input id="blackMemberNo" type="hidden" name="memberNo"/>
											<label class="col-sm-3 control-label">블랙리스트 사유 <span class="required">*</span></label>
											<div class="col-sm-9">
												<textarea name="blacklistContent" rows="5" class="form-control" style="resize: none;" required></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<footer class="panel-footer">
							<div class="row">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary">블랙리스트 등록</button>
									<button class="btn btn-default modal-dismiss">취소</button>
								</div>
							</div>
						</footer>
						</section>
					</form>
				</div>
				<!-- 회원 블랙리스트 Modal END -->
				
				<!-- 회원 블랙리스트 해제 Modal -->
				<div id="memberblcancel" class="modal-block mfp-hide">
					<form id="blackCancelModal" method="post" action="blackCancel.ume">
						<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">회원 블랙리스트 해제</h2>
						</header>
						<div class="panel-body">
							<div class="modal-wrapper">
								<div class="modal-text">
									<div class="panel-body">

										<div class="form-group">
											<input id="blCancelMemberNo" type="hidden" name="memberNo"/>
											<label class="col-sm-3 control-label">해제 사유 <span class="required">*</span></label>
											<div class="col-sm-9">
												<textarea name="memberNote" rows="5" class="form-control" placeholder="블랙리스트 해제 사유 : " style="resize: none;" required>해제 사유 : </textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<footer class="panel-footer">
							<div class="row">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary">등록</button>
									<button class="btn btn-default modal-dismiss">취소</button>
								</div>
							</div>
						</footer>
						</section>
					</form>
				</div>
				<!-- 회원 블랙리스트 해제 Modal END -->
				
				

				<!-- 회원 상세보기&수정 Modal -->
				<div id="memberupdate" class="modal-block mfp-hide modal-block-lg">
					<form id="updateModal" method="post" action="update.ume" enctype="multipart/form-data">
					<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">회원 상세보기</h2>
						</header>
						<div class="panel-body">
							<div class="modal-wrapper">
								<div class="modal-text">
									<input type="hidden" name="memberNo" class="form-control mNo" value=""/>
									<div class="form-group">
										<label class="col-sm-3 control-label">회원 이름<span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" name="memberName" class="form-control mName" placeholder="강보람" value="" readonly/>
										</div>
									</div>
									
									<div class="form-group">
									<label class="col-md-3 control-label">담당트레이너</label>
										<div class="col-md-6">
											<p id="memTrainer"></p>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">결제 상품</label>
										<div class="col-md-6">
											<input type="text" name="productName" class="form-control pName" value="" readonly/>
										</div>
									</div>
									<div class="form-group">
											<label class="col-sm-3 control-label">생년월일 <span class="required">*</span></label>
											<div class="col-sm-2">
												<input type="text" name="memberYear" id="memberYear" class="form-control" placeholder="년(두글자)" required/>
											</div>
											<div class="col-sm-2">
												<select name="memberMonth" id="memberMonth" class="form-control mb-md">
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<div class="col-sm-2">
												<input type="text" name="memberDay" id="memberDay" class="form-control" placeholder="07" required/>
											</div>
										</div>
									

									<div class="form-group">
										<label class="col-md-3 control-label">수강권 기간</label>
										<div class="col-md-6">
											<div class="input-daterange input-group">
												<p class="form-control" id="memPStart"></p>
												<span class="input-group-addon">TO</span>
												<p class="form-control" id="memPEnd"></p>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">일시정지 기간</label>
										<div class="col-md-6">
											<div class="input-daterange input-group">
												<p class="form-control" id="pStart"></p>
												<span class="input-group-addon">TO</span>
												<p class="form-control" id="pEnd"></p>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label" for="inputSuccess">성별</label>
										<div class="col-md-6">
											<label class="checkbox-inline">
												<input type="checkbox" id="mgMale" name="memberGender" value="M">남
											</label>
								
											<label class="checkbox-inline">
												<input type="checkbox" id="mgFemale" name="memberGender" value="F">여
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">이메일</label>
										<div class="col-sm-9">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="fa fa-envelope"></i>
												</span>
												<input type="email" name="memberEmail" class="form-control mEmail" placeholder="eg.: email@email.com" value=""/>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label"> 휴대폰 </label>
										<div class="col-sm-9">
											<input type="text" name="memberPhone" class="form-control mPhone" placeholder="010-0000-0000" value=""/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label"> 주소</label>
										<div class="col-sm-9">
											<input type="text" name="memberAddress" class="form-control mAddress" value=""/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label"> 키(cm)</label>
										<div class="col-sm-9">
											<input type="text" name="memberHeight" class="form-control mHeight" value=""/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> 몸무게(kg)</label>
										<div class="col-sm-9">
											<input type="text" name="memberWeight" class="form-control mWeight" value=""/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> 사용 락커</label>
										<div class="col-sm-9">
											<input type="text" name="lockerNo lNo" class="form-control" value=""/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">프로필이미지</label>
										<div class="col-md-6">
											<div class="fileupload fileupload-new" data-provides="fileupload">
												<div class="input-append">
													<div class="uneditable-input">
														<i class="fa fa-file fileupload-exists"></i>
														<span class="fileupload-preview"></span>
													</div>
													<span class="btn btn-default btn-file">
														<span class="fileupload-exists">변경</span>
														<span class="fileupload-new">파일선택</span>
														<input type="file" name="uploadFile"/>
													</span>
													<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">삭제</a>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">특이사항</label>
										<div class="col-sm-9">
											<textarea id="mNote" name="memberNote" rows="5" class="form-control" style="resize:none;"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<footer class="panel-footer">
							<div class="row">
								<div class="col-md-12 text-right">
									<button type="submit" class="btn btn-primary">회원수정</button>
									<button class="btn btn-default modal-dismiss btn_reset">취소</button>
								</div>
							</div>
						</footer>
					</section>
					</form>
				</div>
				<!-- 회원 상세보기&수정 Modal -->
				
				<!-- 회원 삭제 Modal 시작 -->
				<div id="memberDel" class="mfp-hide modal-block">
					<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">회원 삭제</h2>
						</header>
						<div class="panel-body">
							<div class="modal-wrapper">
								<div class="modal-text">
									<p>선택된 회원을 삭제하시겠습니까? 삭제 시, 해당 회원은 복구되지 않습니다.</p>
								</div>
							</div>
						</div>
						<footer class="panel-footer">
							<div class="row">
								<div class="col-md-12 text-right">
									<button class="btn btn-primary modal-confirm" id="delOk">삭제</button>
									<button class="btn btn-default modal-dismiss">취소</button>
								</div>
							</div>
						</footer>
					</section>
				</div>
				<!-- 회원 삭제 Modal 시작 -->
				
			
			</section>
			
		</div>
		<!--/ 전체 레이어 -->
		
		</section>
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/ume.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
</body>
</html>
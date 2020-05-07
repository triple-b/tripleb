<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				
				<!-- start page -->
	            <div class="row">
	                <div class="content">
	                    <br><br>
	                    <div class="innerOuter" style="margin-top:-5%">
	                        <section class="panel">
	                            <header class="panel-heading">
	                                <div class="panel-btn" style="margin-bottom: 1%;">
	                                    <button class="modal-with-form btn btn-default" style="float:right; margin-right: 1%;" href="#modalFormC">삭제</button>
	                                    <button id="registModal" class="modal-with-form btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" href="#modalFormR">등록</button>
	                                </div>	
	                                <h2 class="panel-title">상품관리</h2>				
	                            </header>
	                            <div class="panel-body">
	                              	  회원이름 : <input type="text" id="memberName"><button id="searchModal" class="modal-with-form btn btn-default" style="margin-left: 1%;" href="#modalFormS">검색</button>
	                                <!-- member 정보 -->
	                                <div class="memberInfo2" style="margin-top: 2%;">
	                                    <div class="memberPhoto">
	                                        <div class="isotope-item document col-sm-6 col-md-4 col-lg-3" style="width: 14%;">
	                                            <div class="thumb-preview">
	                                                <a id="memImg" class="thumb-image">
	                                                   
	                                                </a>
	                                            </div>
	                                        </div>                                    
	                                    </div>
	                                    <div id="memList2" class="widget-summary-col" style="display:none">
	                                        
	                                    </div>
	                                </div>
	                                <!-- /member 정보 -->
	                                
	                                <!-- 회원권, pt권 리스트 -->
	                                <div class="pricing-table" style="margin-top:5%">
	                                	<table style="width:100%;">
	                                		<tr style="width:100%;">
	                                			<td>
					                                <c:forEach items="${ list }" var="p">
						                                <c:if test="${ p.productCategory eq '회원권' }">
						                                    <div class="col-lg-2 col-sm-6">
						                                        <div class="plan">
						                                            <h3 style="background: darkgoldenrod;"><input type="checkbox" style="float: left;">${ p.productName }<span>${ p.productPrice }￦</span></h3>
						                                            <a class="btn btn-lg btn-primary" href="#">결제</a>
						                                        </div>
						                                    </div>
						                                </c:if>
					                                </c:forEach>
	                                			</td>
	                                		</tr>
	                                		<tr style="width:100%;">
	                                			<td>
					                                <c:forEach items="${ list }" var="p">
						                                <c:if test="${ p.productCategory eq 'PT권' }">
						                                    <div class="col-lg-2">
						                                        <div class="plan">
						                                            <h3 style="background: #e36159;"><input type="checkbox" style="float: left;">${ p.productName }<span>${ p.productPrice }￦</span></h3>
						                                            <a class="btn btn-lg btn-primary" href="#">결제</a>
						                                            <ul>
						                                                <li><b>${ p.weekDay }</b></li>
						                                                <li><b>${ p.morAfter }</b></li>
						                                                <li><b>${ p.times }</b></li>
						                                            </ul>
						                                        </div>
						                                    </div>
						                                </c:if>
					                                </c:forEach>
	                                			</td>
	                                		</tr>
		                                </table>
		                            </div>
	                                <!-- /회원권, pt권 리스트 -->
	
	                            </div>
	                        </section>
	                    </div>
	                    <br><br>
	                </div>
	            </div>
	            <!-- end page -->
				
			</section>
			<!-- 오른쪽 content 페이지 -->
		</div>
		<!--/ 전체 레이어 -->
		
		<script>
			$(function(){
				$("#searchModal").click(function(){
					
					$.ajax({
						url:"searchMem.jpr",
						data:{name:$("#memberName").val()},
						type:"get",
						success:function(data){
							if(data != ""){
								var value = "";
								for(var i in data){
									value += '<tr>' +
											 	 '<td><input type="radio" name="memCheck" value="'+ data[i].memberNo +'"></td>' +
												 '<td>&nbsp;&nbsp;&nbsp;' + data[i].memberNo + '</td>' +
					                             '<td>' + data[i].memberName + '</td>' +
					                             '<td>' + data[i].memberBirth + '</td>' +
					                             '<td>' + data[i].memberPhone + '</td>' +
					                             '<td>' + data[i].memberAddress + '</td>' +
					                         '</tr>';
								}      
							}else{
								var value="";
								
								value += '<td colspan="3">조회된 회원이 없습니다 </td>'; 
							}
							
							$("#memberList").html(value);
						},
						error:function(){
							console.log("통신실패");
						}
					});
				});
			});
		</script>
		
		<!-- 인원리스트 모달폼-->
        <div id="modalFormS" class="modal-block modal-block-primary mfp-hide">
            <section class="panel">
            <header class="panel-heading" style="background: #0f4c81;">
                <h2 class="panel-title" style="color: white;">회원검색</h2>
            </header>
            <div class="panel-body">
                <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
                    <table  class="memberList">
                    	<thead>
	                        <tr style="border-bottom: 1px solid lightgray;">
	                            <th></th>
	                            <th width="80px">회원번호</th>
	                            <th width="70px">이름</th>
	                            <th width="70px">나이</th>
	                            <th width="150px">휴대폰</th>
	                            <th width="200px">주소</th>
	                        </tr>
	                    </thead>
	                    <tbody id=memberList>
	                    
	                    </tbody>
                    </table>
		            <footer class="panel-footer">
		                <div class="row">
		                    <div class="col-md-12 text-right">
		                        <button id="memSubmit" class="btn btn-default modal-dismiss" type="button">확인</button>
		                    </div>
		                </div>
		            </footer>
                </form>
            </div>
            </section>
        </div>
        <!-- /인원리스트 모달폼 -->   
        
        <!-- 등록 모달폼-->
		<div id="modalFormR" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
			   <header class="panel-heading" style="background: #0f4c81;">
				  <h2 class="panel-title" style="color: white;">상품등록</h2>
			   </header>
			   <div class="panel-body">
				  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertPro.jpr">
				  	<div class="form-group">
						<label class="col-sm-2 control-label">상품종류</label>
						<div class="col-sm-9" style="margin-top:1%">
						   <input type="radio" name="productCategory" id="productCategory" value="회원권" required/> 회원권
						   <input type="radio" name="productCategory" id="productCategory" value="PT권" style="margin-left:3%" required/> PT권 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">상품이름</label>
						<div class="col-sm-9">
						   <input type="text" name="productName" id="productName" class="form-control" required/>
						</div>
					 </div>
					 <div class="form-group">
						<label class="col-sm-2 control-label">금액</label>
						<div class="col-sm-4">
						   <input type="text" name="productPrice" id="productPrice" class="form-control" required style="width:60%"/>
						</div>
					 </div>
					 <div class="form-group">
						<label class="col-sm-2 control-label" >기간</label>
						<div class="col-sm-9" style="margin-top:1%">
		                   <input type="radio" name="productDays" id="productDays" value="30" required/> 1개월
		                   <input type="radio" name="productDays" id="productDays" value="90" style="margin-left:3%" required/> 3개월
		                   <input type="radio" name="productDays" id="productDays" value="180" style="margin-left:3%" required/> 6개월
		                   <input type="radio" name="productDays" id="productDays" value="360" style="margin-left:3%" required/> 12개월
						</div>
					 </div> 
					 <div class="form-group">
						<label class="col-sm-2 control-label">요일</label>
						<div class="col-sm-9" style="margin-top:1%">
						   <input type="radio" name="weekDay" id="weekDay" value="주중" required/> 주중
						   <input type="radio" name="weekDay" id="weekDay" value="주말" style="margin-left:3%" required/> 주말
						</div>
					 </div> 
					 <div class="form-group">
						<label class="col-sm-2 control-label">시간</label>
						<div class="col-sm-9" style="margin-top:1%">
						   <input type="radio" name="morAfter" id="morAfter" value="오전" required/> 오전
						   <input type="radio" name="morAfter" id="morAfter" value="오후" style="margin-left:3%" required/> 오후
						</div>
					 </div>    
					 <div class="form-group">
						<label class="col-sm-2 control-label">횟수</label>
						<div class="col-sm-9" style="margin-top:1%">
						   <input type="radio" name="times" id="times" value="주2회" required/> 주 2회
						   <input type="radio" name="times" id="times" value="주3회" style="margin-left:3%" required/> 주 3회
						</div>
					 </div>       
					 <footer class="panel-footer">
						<div class="row">
							<div class="col-md-12 text-right">
								<button id="registBtn" class="btn btn-primary" type="submit">등록</button>
								<button class="btn btn-default modal-dismiss">취소</button>
							</div>
						</div>
					 </footer>
				  </form>
			   </div>
			</section>
		 </div>
	     <!-- /등록 모달폼 -->
	     
	     <!-- 삭제 모달폼 -->
		 <div id="modalFormC" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
			   <header class="panel-heading" style="background: #0f4c81;">
			   </header>
			   <div class="panel-body">
				  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
					  <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">삭제하시겠습니까?</div>        
				  </form>
			   </div>
			   <footer class="panel-footer">
				  <div class="row">
					 <div class="col-md-12 text-right" style="text-align: center;">
						<button class="btn btn-primary modal-confirm">확인</button>
						<button class="btn btn-default modal-dismiss">취소</button>
					 </div>
				  </div>
			   </footer>
			</section>
		 </div>
		 <!-- /삭제 모달폼 -->
	     
		<script>
			$(function(){
				$("#memSubmit").click(function(){
					console.log("클릭");
					
					$("input:radio[name=memCheck]:checked").each(function(){
						var checkVal = $("input[name=memCheck]:checked").val();

						$.ajax({
							url:"memInfo.jpr",
							data:{memberNo:checkVal},
							type:"post",
							success:function(data){
								var value = "";
								
								value += '<div class="summary">' +
										 	'<h4 class="title">회원정보</h4>' +
										 		'<div class="info">' +
										 			'<form action="">' +
												 		'<table>' +
															'<tr>' +
								                                '<th>이름 : </th>' +
								                                '<td>' + data.memberName + '</td>' +
								                            '</tr>' +
								                            '<tr>' +
								                            	'<th>생년월일 : </th>' +
								                            	'<td>' + data.memberBirth + '</td>' +
								                            '</tr>' +
								                            '<tr>' +
								                                '<th>휴대폰 : </th>' +
								                                '<td>' + data.memberPhone + '</td>' +
								                            '</tr>' +
								                            '<tr>' +
								                                '<th>주소 : </th>' +
								                                '<td>' + data.memberAddress + '</td>' +
								                            '</tr>' +
								                         '</table>' +
						                      		'</form>' +
						                   		'</div>' +
						                	'</div>';
								
						                	 $("#memList2").show();
			                    $("#memList2").html(value);
			                    
							},
							error:function(){
								console.log("통신실패");
							}
						});
						
						$.ajax({
							url:"memImg.jpr",
							data:{memberNo:checkVal},
							type:"post",
							success:function(data){
								var value = "";
								console.log(data);
								value += '<img src="resources/assets/images/' + data.memberImage + '" width="130px" height="130px" class="img-responsive" alt="Project">';
								
								$("#memImg").html(value);
							},
							error:function(){
								console.log("통신실패");
							}
						});
					
					});
					
				});
			});
		</script>
		
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/dashboard/examples.dashboard.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
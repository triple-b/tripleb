<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	table tr{
		width:100%;
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
					<h2>상품관리</h2>
					<div class="right-wrapper pull-right">				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				<!-- start page -->
	            <div class="row" style="margin-top: 4%;">
	                <div class="content">
	                    <br><br>
	                    <div class="innerOuter" style="margin-top:-5%">
	                        <section class="panel">
	                            <header class="panel-heading">
	                            	<c:if test="${ loginUser.trainerGrade ne 'N' }">
		                                <div class="panel-btn" style="margin-bottom: 1%;">
		                                    <button class="modal-with-form btn btn-default" style="float:right; margin-right: 1%;" href="#modalFormD">삭제</button>
		                                    <button id="registModal" class="modal-with-form btn btn-default" style="float:right; margin-right: 1%; background:#0088cc; color:white; border:1px solid #0088cc;" href="#modalFormR">등록</button>
		                                </div>	
	                                </c:if>
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
                                                               <h3 style="background: darkgoldenrod;"><input type="checkbox"  data-proNum="${ p.productNo }" style="float: left;" name="checkPro">${ p.productName }<span>${ p.productPrice }￦</span></h3>
                                                               <button id="payMentNm1" class="btn btn-lg btn-primary" onclick="payment2Fn(${p.productNo})">결제</button>
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
                                                               <h3 style="background: #e36159;"><input type="checkbox" data-proNum="${ p.productNo }" style="float: left;" name="checkPro">${ p.productName }<br>(${ p.productDays }  일)<span id="productPrice1">${ p.productPrice }￦</span></h3>
                                                               <button id="payListBtn1" class="btn btn-lg btn-primary modal-with-form" href="#modalFormCList" onclick="paymentFn(${p.productNo})">결제</button>
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
		
		<!-- 회원 검색리스트 ajax -->
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
		            <footer class="panel-footer" style="margin-top:2%">
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
						<label class="col-sm-2 control-label">상품종류<span class="required">*</span></label>
						<div class="col-sm-9" style="margin-top:1%">
						   <input type="radio" name="productCategory" id="productCategory" value="회원권" required/> 회원권
						   <input type="radio" name="productCategory" id="productCategory" value="PT권" style="margin-left:3%" required/> PT권 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">상품이름<span class="required">*</span></label>
						<div class="col-sm-9">
						   <input type="text" name="productName" id="productName" class="form-control" required/>
						</div>
					 </div>
					 <div class="form-group">
						<label class="col-sm-2 control-label">금액<span class="required">*</span></label>
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
	     
	     
	     <!-- 수업리스트 모달폼-->
         <div id="modalFormCList" class="modal-block modal-block-primary mfp-hide">
            <section class="panel">
	            <header class="panel-heading" style="background: #0f4c81;">
	                <h2 class="panel-title" style="color: white;">결제</h2>
	            </header>
	            <div class="panel-body">
	                <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
		                
		                
	                </form>
		            <footer class="panel-footer">
		                <div class="row">
		                    <div class="col-md-12 text-right">
		                        <button class="btn btn-primary modal-dismiss" type="button" onclick="payMentPT()">결제</button>
		                        <button class="btn btn-default modal-dismiss" type="button">취소</button>
		                    </div>
		                </div>
		            </footer>
	            </div>
            </section>
        </div>
        <!-- /수업리스트 모달폼 -->					
	     
	     
	     <!-- 삭제 모달폼 -->
		 <div id="modalFormD" class="modal-block modal-block-primary mfp-hide">
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
						<button id="deleteBtn" class="btn btn-primary modal-confirm">확인</button>
						<button class="btn btn-default modal-dismiss" style="margin-left:2%">취소</button>
					 </div>
				  </div>
			   </footer>
			</section>
		 </div>
		 <!-- /삭제 모달폼 -->
	     
	     
	     <!-- 회원정보 ajax -->
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
										 			'<form>' +
										 				'<input type="hidden" id="memberNo1" value="' + data.memberNo + '">' +
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
		
		
		<!-- 수업리스트 ajax -->
		<script>
			var paymentFn = function(rowKey){
				var val1 = rowKey;
				console.log(rowKey);
				var memNo = $("#memberNo1").val();
				
				
				$.ajax({
					url:"clList.jpr",
					data:{productNo:val1},
					type:"post",
					success:function(list){
						var value = "";
						
						for(var i in list){
							if(list[i].classCount < list[i].classMaxCount){
								console.log("list[i].classCount = " + list[i].classCount);
								console.log("list[i].classMaxCount = " + list[i].classMaxCount);
								
								value +=  '<section class="panel panel-featured-left panel-featured-primary" style="width:90%;">' +
							                     '<div class="panel-body">' +
							                        '<div class="widget-summary">' +
							                            '<table>' +
							                                '<tr>' +
							                                    '<td width="80px"><h4>수업명 : </h4></td>' +
																 '<th width="400px">' +
																	 '<h4>' + list[i].className + '</h4>' +
																 '</th>' +
																 '<td><input type="radio" name="classCheck" id="classCheck1" value="' + list[i].classNo + '"></td>' +
										                     '</tr>' +
										                     '<tr>' +
							                                    '<td width="60px">수업시간 : </td>' +
																 '<th width="400px">' + list[i].weekDay + '</th>' +
																 '<td></td>' +
							                                '</tr>' +
							                                '<tr>' +
							                                    '<td width="60px">수업횟수 : </td>' +
																'<th width="400px">' + list[i].times + '</th>' +
																'<td></td>' +
							                                '</tr>' +
							                                '<tr>' +
							                                    '<td width="60px">담당자 : </td>' +
																'<th width="400px">' + '<input type="hidden" id="classCheck2" value="' + list[i].trainerName + '">' + list[i].trainerName + '트레이너</th>' +
																'<td></td>' +
							                                '</tr>' +
							                            '</table>' +
							                        '</div>' +
												'</div>' +
							               '</section>';
							}
						}
						
						$("#demo-form").html(value);
					},
					error:function(){
						console.log("통신실패");
					}
				});
			}
		</script>
		<!-- /ajax -->
		
		<!-- PT결제 ajax -->
		<script>
			function payMentPT(){
				var mem1 = $("#memberNo1").val();
				
				var classNo = $("#classCheck1").val();
				var cl2 = $("#classCheck2").val();
				console.log("회원번호 : " + mem1);
				console.log("수업번호 : " + classNo);
				
				$.ajax({
					url:"selectPro1.jpr",
					data:{classNo:classNo},
					type:"post",
					success:function(data){
						var value = data;
						$.ajax({
							url:"selectMem1.jpr",
							data:{memNo:mem1},
							type:"post",
							success:function(data){
								var memVal = data;
								console.log("상품번호 : " + value.productNo);
								console.log("상품가격 : " + value.productPrice);
								console.log("수업번호 : " + classNo);
								console.log("강사명 : " + cl2);
								
								var IMP = window.IMP;
								IMP.init('imp45214918');
								
								IMP.request_pay({
								    pg : 'inicis',
								    pay_method : 'card',
								    merchant_uid : 'merchant_' + new Date().getTime(),
								    name : value.productName,
								    amount : value.productPrice,
								    buyer_email : memVal.memberEmail,
								    buyer_name : memVal.memberName,
								    buyer_tel : memVal.memberPhone,
								    buyer_addr : memVal.memberAddress,
								    buyer_postcode : '123-456',
								    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
								}, function(rsp) {
								    if ( rsp.success ) {
								        var msg = '결제가 완료되었습니다.';
								        msg += '고유ID : ' + rsp.imp_uid;
								        msg += '상점 거래ID : ' + rsp.merchant_uid;
								        msg += '결제 금액 : ' + rsp.paid_amount;
								        msg += '카드 승인번호 : ' + rsp.apply_num;
								        
								        location.href="insertPay.jpr?memberNo=" + memVal.memberNo + "&productNo=" + value.productNo + "&price=" + value.productPrice + "&classNo=" + classNo; // member -> 담당트레이너 update  1.payInfo 테이블 insert  classInfo count+1   mproduct insert
								    } else {
								        var msg = '결제에 실패하였습니다.';
								        msg += '에러내용 : ' + rsp.error_msg;
								    }
								    alert(msg);
								});
							},
							error:function(){
								console.log("mem 통신실패");
							}
						});
					},
					error:function(){
						console.log("pro 통신실패");
					}
				});
			}
		</script>
		<!-- /ajax -->
		
		
		<!-- 일반회원권 결제 ajax -->
		<script>
			var payment2Fn = function(rowkey){
				var mem2 = $("#memberNo1").val();
				var pNum = rowkey
				
				// 날짜포맷 지정하는 함수
				function dateToYYYYMMDD(date)
				{
				    function pad(num) {
				        num = num + '';
				        return num.length < 2 ? '0' + num : num;
				    }
				    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
				}
				 
				var currDate = new Date(); // 현재 날짜
				var prevDate = new Date(new Date().setMonth(new Date().getMonth()-1)); // 한달전 날짜
				
				// YYYY-MM-DD로 형식변환
				var prevMon = dateToYYYYMMDD(prevDate);
				var currMon = dateToYYYYMMDD(currDate);
				
			
				console.log(mem2);
				console.log(pNum);
				
				
				$.ajax({
					url:"selectPro2.jpr",
					data:{productNo:pNum},
					type:"post",
					success:function(data){
						var product2 = data;
						
						$.ajax({
							url:"selectMem2.jpr",
							data:{memberNo:mem2},
							type:"post",
							success:function(data){
								var memInfo = data;
								
								var IMP = window.IMP;
								IMP.init('imp45214918');
								
								IMP.request_pay({
								    pg : 'inicis',
								    pay_method : 'card',
								    merchant_uid : 'merchant_' + new Date().getTime(),
								    name : product2.productName,
								    amount : product2.productPrice,
								    buyer_email : memInfo.memberEmail,
								    buyer_name : memInfo.memberName,
								    buyer_tel : memInfo.memberPhone,
								    buyer_addr : memInfo.memberAddress,
								    buyer_postcode : '123-456',
								    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
								}, function(rsp) {
								    if ( rsp.success ) {
								        var msg = '결제가 완료되었습니다.';
								        msg += '고유ID : ' + rsp.imp_uid;
								        msg += '상점 거래ID : ' + rsp.merchant_uid;
								        msg += '결제 금액 : ' + rsp.paid_amount;
								        msg += '카드 승인번호 : ' + rsp.apply_num;
								        
								        var nextDate = new Date(new Date().setMonth(new Date().getMonth()+product2.productDays/30)); // 한달후 날짜
								        var nextMon = dateToYYYYMMDD(nextDate);
								        console.log(nextMon);
								        location.href="insertPayNm.jpr?memberNo=" + memInfo.memberNo + "&productNo=" + product2.productNo + "&productPrice=" + product2.productPrice + "&productDays=" + product2.productDays + "&sysdate1=" + nextMon; // member -> 담당트레이너 update  1.payInfo 테이블 insert  classInfo count+1   mproduct insert
								    } else {
								        var msg = '결제에 실패하였습니다.';
								        msg += '에러내용 : ' + rsp.error_msg;
								    }
								    alert(msg);
								});
							},
							error:function(){
								console.log("통신실패");
							}
						});
					},
					error:function(){
						console.log("통신실패");
					}
				});
				
			}
		</script>
		<!-- /ajax -->
		
		
		<!-- 삭제 ajax -->
		<script>
			$(function(){
				$("#deleteBtn").click(function(){
					var checkArr = new Array();
					
					$("input[name=checkPro]:checked").each(function(){
						checkArr.push($(this).attr("data-proNum"));
					});
					
					console.log(checkArr);
					$.ajax({
						url:"delete.jpr",
						data:{checkArr:checkArr},
						type:"post",
						success:function(result){
							if(result > 0){
								location.href= "productList.jpr";
							}else{
								return "common/errorPage";
							}
						},
						error:function(){
							console.log("통신실패");
						}
					});
				});
			});
					
		</script>
		
		<!-- 체크박스 선택 and 선택해제 -->
		
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
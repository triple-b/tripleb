<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/isotope/jquery.isotope.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#deleteBtn3:hover{
		color:white;
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
		
			<section role="main" class="content-body">
					<header class="page-header">
						<h2>트레이너 현황</h2>	
		                <div class="right-wrapper pull-right">
		                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
		                </div>
		            </header>
		            
					<!-- start: page -->
					<section class="content-with-menu content-with-menu-has-toolbar media-gallery">
						<div class="content-with-menu-container">
							<div class="inner-body mg-main">
		            				<div class="inner-toolbar clearfix" style="padding-left:0px">
		                				<ul>
		                					<li>
		                						트레이너 현황
		                					</li>
		                    				<li>
		                        				<a class="modal-with-form" href="#modalFormAdd" onclick="pwdRandom();"><i class="fa fa-trash-o"></i> 추가</a>
		                    				</li>
						                    <li>
						                        <a href="#modalFormDel" class="modal-with-form" id="deleteBtn3"><i class="fa fa-trash-o"></i>삭제</a>
						                    </li>
						                    <li class="right" data-sort-source data-sort-id="media-gallery">
						                        <ul class="nav nav-pills nav-pills-primary">
						                            <li class="active">
						                                <a style="cursor: pointer;" data-option-value="*" href="trainerList.utr">전체</a>
						                            </li>
						                            <li>
						                                <a style="cursor: pointer;" data-option-value=".document" href="expertList.utr">팀장</a>
						                            </li>
						                            <li>
						                                <a style="cursor: pointer;" data-option-value=".image" href="beginnerList.utr">일반</a>
						                            </li>
						                        </ul>
						                    </li>
						                </ul>
						            </div> 
		            				<!-- end: inner-toolbar -->
						
						
									<!-- start: page -->
					   				<section class="panel">
								        <div class="row">
								            <div class="row mg-files" data-sort-destination data-sort-id="media-gallery">
								            	<c:forEach items="${ list }" var="t">
								            	<input type="hidden" id="trainerNo" value="${ t.trainerNo }">
								                <div class="isotope-item document col-sm-6 col-md-4 col-lg-3">
								                    <div class="thumbnail" style="width:90%; height:20%;">
								                        <div class="thumb-preview">
								                            <a class="thumb-image" href="assets/images/projects/project-1.jpg">
								                                <img id="trainerThumbnail" style="width:250px; height:200px;" src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ t.trainerThumbnail }" class="img-responsive" alt="Project">
								                            </a>
								                            <div class="mg-thumb-options">
								                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
								                                <div class="mg-toolbar">
								                                    <div class="mg-option checkbox-custom checkbox-inline">
								                                        <input type="checkbox" id="file_1" id="checkTr1" name="checkTr1" data-trNum="${ t.trainerNo }">
								                                        <label for="file_1"></label>
								                                    </div>
								                                    <div class="mg-group pull-right">
								                                        <a id="trainerNo" class="modal-with-form" href="#modalForm2" onclick="trDetailFn(${t.trainerNo})">상세정보</a>
								                                        <c:if test="${ loginUser.trainerGrade eq 'M' }">
									                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
									                                            <i class="fa fa-caret-up"></i>
									                                        </button>
									                                        <ul class="dropdown-menu mg-menu" role="menu">
									                                            <li><a style="cursor:pointer" id="updateBtn1" onclick="gotoUpdateForm(${ t.trainerNo })">프로필 수정</a></li>
									                                        </ul>
								                                        </c:if>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                        <h5 id="trainerName" class="mg-title text-semibold">${ t.trainerName }
								                        	<input id="trainerGrade" type="hidden" value="${ t.trainerGrade }">
									                        <c:choose>
									                        	<c:when test="${ t.trainerGrade eq 'B'}">
									                        		<small>트레이너</small>	
									                        	</c:when>
									                        	<c:when test="${ t.trainerGrade eq 'E'}">
									                        		<small>팀장</small>	
									                        	</c:when>
									                        	<c:when test="${ t.trainerGrade eq 'M'}">
									                        		<small>관장</small>	
									                        	</c:when>
									                        </c:choose>
								                        </h5>
								                    </div>
								                </div>
								                </c:forEach>
							                	
						           			</div>
				            			</div>
				           			</section>
				           		</div>
				          	</div>
						</section>
					<!-- end Page -->
				</section>
		 
		<!--  상세정보 모달폼 -->
        <div id="modalForm2" class="modal-block modal-block-primary mfp-hide">
            <section class="panel">
               <header class="panel-heading" style="background: #0f4c81;">
                  <h2 class="panel-title" style="color: white;">상세정보</h2>
               </header>
               <div class="panel-body">
                 	<div style="float: right;">
                     	<img src="assets/images/health.jpg" width="200px" height="200px" alt="">
                 	</div>                        
                	<form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate" style="float: left;">
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">이 름 </label>
	                         <div style="float: right;">
	                             <label class="control-label" style="font-weight: bolder; width:80px;" id="trainerName"></label>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">생년월일 </label>
	                         <div style="float: right;">
	                             <label class="control-label col-sm-9" id="trainerBirth" style="width:80px;"></label>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">주 소 </label>
	                         <div style="float: right;">
	                             <label class="control-label" id="trainerAddress" style="width:80px;"></label>
	                         </div>
	                     </div> 
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">이메일 </label>
	                         <div style="float: right;">
	                             <label class="control-label" id="email" style="width:80px;"></label>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">입사일 </label>
	                         <div style="float: right;">
	                             <label class="control-label" id="enrollDate" style="width:80px;"></label>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-6 control-label">수상경력 </label>
	                         <div class="col-sm-6" style="float: right">
	                         		<ul style="float:left;">
	                         			<li id="award" style="width:80px;"></li>
	                         		</ul>
	                         </div>
	                     </div>                 
                 	</form>	
            	</div>
				<footer class="panel-footer">
			         <div class="row">
			            <div class="col-md-12 text-right" style="text-align: center;">
			               <button class="btn btn-primary modal-confirm assignBtn" style="margin-right: 2%;">확인</button>
			            </div>
			         </div>
				</footer>
			</section>
		</div>
		<!-- /상세정보 -->
		
		<!-- 사원 추가 모달폼 -->
        <div id="modalFormAdd" class="modal-block modal-block-primary mfp-hide">
           <section class="panel">
              <header class="panel-heading" style="background: #0f4c81;">
                 <h2 class="panel-title" style="color: white;">사원추가</h2>
              </header>
              <div class="panel-body">
                 <form id="demo-form-add" class="form-horizontal mb-lg" novalidate="novalidate" method="post" action="insertTr.utr" enctype="multipart/form-data">
                     <div class="form-group mt-lg">
                         <label class="col-sm-2 control-label">사진첨부</label>
                         <div class="col-sm-9">
                            <input type="file" id="upfile" class="form-control" name="uploadFile" required/>
                         </div>
                      </div>
                    <div class="form-group mt-lg">
                       <label class="col-sm-2 control-label">이름</label>
                       <div class="col-sm-9">
                          <input type="text" name="trainerName" class="form-control" required/>
                       </div>
                    </div>
                    <div class="form-group mt-lg">
                       <label class="col-sm-2 control-label">출근번호</label>
                       <div class="col-sm-9">
                          <input type="text" name="trainerPwd" id="trainerPwd1" class="form-control" readonly required/>
                       </div>
                    </div>
                    <div class="form-group">
                       <label class="col-sm-2 control-label">생년월일</label>
                       <div class="col-sm-9">
                          <input type="number" name="trainerBirth" class="form-control" placeholder="생년월일을 입력하세요  (예) 19900506" required/>
                       </div>
                    </div>
                    <div class="form-group">
                       <label class="col-sm-2 control-label">성별</label>
                       <div class="col-sm-3" style="margin-top:1.5%">
                          <input type="radio" name="trainerGender" value="M"/> 남
                          <input type="radio" name="trainerGender" value="F" style="margin-left: 5%;"/> 여
                       </div>
                    </div>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">핸드폰</label>
                         <div class="col-sm-9">
                             <input type="text" name="trainerPhone" class="form-control" placeholder="- 를 포함하여 입력" />
                         </div>
                    </div>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">이메일</label>
                         <div class="col-sm-9">
                             <input type="email" name="trainerEmail" class="form-control" />
                         </div>
                    </div>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">주소</label>
                         <div class="col-sm-9">
                             <input type="text" name="trainerAddress" class="form-control" />
                         </div>
                    </div>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">수상경력</label>
                         <div class="col-sm-9">
                            <textarea class="form-control" name="trainerAward" id="career" rows="5"></textarea>
                         </div>
                    </div>              
		              <footer class="panel-footer">
		                 <div class="row">
		                    <div class="col-md-12 text-right">
		                       <button type="submit" class="btn btn-primary modal-confirm" onclick="insertBtn1();">추가</button>
		                       <button class="btn btn-default modal-dismiss">취소</button>
		                    </div>
		                 </div>
		              </footer>
                 </form>
              </div>
           </section>
        </div>
		<!-- /사원추가 폼 -->
		
		
		<!-- 삭제 모달폼 -->
		 <div id="modalFormDel" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
			   <header class="panel-heading" style="background: #0f4c81;">
			   </header>
			   <div class="panel-body">
				  <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
					  <div style="text-align: center; font-weight: bolder; font-size: 1.5em;">해당 트레이너를 삭제하시겠습니까?</div>        
				  </form>
			   </div>
			   <footer class="panel-footer">
				  <div class="row">
					 <div class="col-md-12 text-right" style="text-align: center;">
						<button id="deleteBtn1" class="btn btn-primary modal-confirm">확인</button>
						<button class="btn btn-default modal-dismiss" style="margin-left:2%">취소</button>
					 </div>
				  </div>
			   </footer>
			</section>
		 </div>
		 <!-- /삭제 모달폼 -->
		 	
		</div>
		<!--/ 전체 레이어 -->
		
		<script>
			var trDetailFn = function(rowkey){
				var trainerNo = rowkey;
				
				$.ajax({
					url:"trDetail.utr",
					data:{trainerNo:trainerNo},
					type:"post",
					success:function(t){
						var value = "";
						
						$("#trainerName").text(t.trainerName);
						$("#trainerBirth").text(t.trainerBirth);
						$("#trainerAddress").text(t.trainerAddress);
						$("#email").text(t.trainerEmail);
						$("#enrollDate").text(t.trainerJoin);
						$("#award").html(t.trainerAward);
					},
					error:function(){
						console.log("통신실패");
					}
				});
			}
		</script>
		
		<!-- 출근번호 랜덤변수 발생 -->
		<script>
			function pwdRandom(){
				var ranNum = Math.random();
				var randPwd = Math.floor(ranNum*90000 + 10000);
				
				$.ajax({
					url:"randomPwd.utr",
					data:{trainerPwd:randPwd},
					type:"post",
					success:function(result){
						
						if(result > 0){
							var ranNum2 = Math.random();
							var randPwd2 = Math.floor(ranNum*90000 + 10000);
							
							$("#trainerPwd1").val(randPwd);
						}else{
							$("#trainerPwd1").val(randPwd);							
						}
					},
					error:function(){
						console.log("통신실패");
					}
				});
				
			}
		</script>
		<!-- /ajax -->
		
	
		<script>
			function insertBtn1(){
				document.getElementById("demo-form-add").submit();
			}
		</script>
		
		<!-- 프로필 수정 -->
		<script>
			var gotoUpdateForm = function(rowkey){
				var value = rowkey;
				
				console.log(rowkey);
				location.href="trUpdateForm.utr?trainerNo=" + value;
			}
		</script>
		<!-- /프로필 수정 -->
		
		<!-- 트레이너 삭제 ajax -->
		<script>
			$(function(){
				$("#deleteBtn1").click(function(){
					var checkArr = new Array();
					
					$("input[name=checkTr1]:checked").each(function(){
						checkArr.push($(this).attr("data-trNum"));
					});
					
					console.log(checkArr);
					$.ajax({
						url:"deleteTr.utr",
						data:{checkArr:checkArr},
						type:"post",
						success:function(result2){
							if(result2 > 0){
								location.href= "trainerList.utr";
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
		
		<!-- 오른쪽 사이드 바 -->
		<jsp:include page="../common/sidebarRight.jsp" />		
	</section>

	<!-- 공통으로 사용하는 JSP -->
	<jsp:include page="../common/footerjs.jsp" />
	<!-- 현재 페이지에서만 사용하는 JSP -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/pages/examples.mediagallery.js" ></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
  
</body>
</html>
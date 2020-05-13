<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/isotope/jquery.isotope.css" />
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
		            
		   	 <!-- Modal Form -->
                <div id="modalForm" class="modal-block modal-block-primary mfp-hide">
                   <section class="panel">
                      <header class="panel-heading" style="background: #0f4c81;">
                         <h2 class="panel-title" style="color: white;">사원추가</h2>
                      </header>
                      <div class="panel-body">
                         <form id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
                             <div class="form-group mt-lg">
                                 <label class="col-sm-2 control-label">사진첨부</label>
                                 <div class="col-sm-9">
                                    <input type="file" name="name" class="form-control" required/>
                                 </div>
                              </div>
                            <div class="form-group mt-lg">
                               <label class="col-sm-2 control-label">이름</label>
                               <div class="col-sm-9">
                                  <input type="text" name="name" class="form-control" required/>
                               </div>
                            </div>
                            <div class="form-group">
                               <label class="col-sm-2 control-label">생년월일</label>
                               <div class="col-sm-9">
                                  <input type="date" name="birth" class="form-control" required/>
                               </div>
                            </div>
                            <div class="form-group">
                               <label class="col-sm-2 control-label">성별</label>
                               <div class="col-sm-3">
                                  <input type="radio" name="gender" /> 남
                                  <input type="radio" name="gender" style="margin-left: 5%;"/> 여
                               </div>
                            </div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">핸드폰</label>
                                 <div class="col-sm-9">
                                     <input type="text" name="phone" class="form-control" placeholder="- 를 포함하여 입력" />
                                 </div>
                            </div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">이메일</label>
                                 <div class="col-sm-9">
                                     <input type="email" name="email" class="form-control" />
                                 </div>
                            </div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">주소</label>
                                 <div class="col-sm-9">
                                     <input type="text" name="address" class="form-control" />
                                 </div>
                            </div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">입사일</label>
                                 <div class="col-sm-9">
                                     <input type="date" name="joinDate" class="form-control" />
                                 </div>
                            </div> 
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">수상경력</label>
                                 <div class="col-sm-9">
                                    <textarea class="form-control" name="career" id="career" rows="5"></textarea>
                                 </div>
                            </div>              
                         </form>
                      </div>
                      <footer class="panel-footer">
                         <div class="row">
                            <div class="col-md-12 text-right">
                               <button class="btn btn-primary modal-confirm">추가</button>
                               <button class="btn btn-default modal-dismiss">취소</button>
                            </div>
                         </div>
                      </footer>
                   </section>
                </div>

             <!--  modal Form 2 -->
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
                             <label class="col-sm-5 control-label">이 름 : </label>
                             <div style="float: right;">
                                 <label class="control-label" style="font-weight: bolder;">조인성</label>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-5 control-label">나 이 : </label>
                             <div style="float: right;">
                                 <label class="control-label">4 8 세</label>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-5 control-label">주 소 : </label>
                             <div style="float: right;">
                                 <label class="control-label">서울시 양천구</label>
                             </div>
                         </div> 
                         <div class="form-group">
                             <label class="col-sm-5 control-label">이메일 : </label>
                             <div style="float: right;">
                                 <label class="control-label">tripleB@naver.com</label>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-5 control-label">입사일 : </label>
                             <div style="float: right;">
                                 <label class="control-label">2019-11-08</label>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-5 control-label">수상경력 : </label>
                             <div class="col-sm-9" style="float: right;">
                                 <p>
                                     &nbsp;&nbsp;&nbsp;&nbsp;＊ 목동 헬스클럽<br>
                                     &nbsp;&nbsp;&nbsp;&nbsp;＊ 목동 토박이<br>
                                     &nbsp;&nbsp;&nbsp;&nbsp;＊ 닭가슴살 싫어함<br>
                                     &nbsp;&nbsp;&nbsp;&nbsp;＊ 게임하고싶음
                                 </p>
                             </div>
                         </div>                 
                     </form>
                 </div>
                 
              				<footer class="panel-footer">
                     <div class="row">
                        <div class="col-md-12 text-right" style="text-align: center;">
                           <button class="btn btn-primary modal-confirm assignBtn" style="margin-right: 2%;">수정</button>
                           <button class="btn btn-default modal-dismiss">반려</button>
                        </div>
                     </div>
              				</footer>
              			</section>
			</div>
			
			<!-- end Modal -->
			<!-- start: page -->
			<section class="content-with-menu content-with-menu-has-toolbar media-gallery">
				<div class="content-with-menu-container">
					<div class="inner-body mg-main">
            				<div class="inner-toolbar clearfix" style="padding-left:0px">
                				<ul>
                    				<li>
                        				<a href="#" id="mgSelectAll"><i class="fa fa-check-square"></i> <span data-all-text="Select All" data-none-text="Select None">Select All</span></a>
                    				</li> 
                    				<li>
                        				<a class="modal-with-form" href="#modalForm"><i class="fa fa-trash-o"></i> 추가</a>
                    				</li>
				                    <li>
				                        <a href="#"><i class="fa fa-trash-o"></i> 삭제</a>
				                    </li>
				                    <li class="right" data-sort-source data-sort-id="media-gallery">
				                        <ul class="nav nav-pills nav-pills-primary">
				                            <li class="active">
				                                <a data-option-value="*" href="#all">전체</a>
				                            </li>
				                            <li>
				                                <a data-option-value=".document" href="#document">팀장</a>
				                            </li>
				                            <li>
				                                <a data-option-value=".image" href="#image">일반</a>
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
					                <div class="isotope-item document col-sm-6 col-md-4 col-lg-3">
					                    <div class="thumbnail">
					                        <div class="thumb-preview">
					                            <a class="thumb-image" href="assets/images/projects/project-1.jpg">
					                                <img src="resources/assets/images/cho.jpg" class="img-responsive" alt="Project">
					                            </a>
					                            <div class="mg-thumb-options">
					                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
					                                <div class="mg-toolbar">
					                                    <div class="mg-option checkbox-custom checkbox-inline">
					                                        <input type="checkbox" id="file_1" value="1">
					                                        <label for="file_1">SELECT</label>
					                                    </div>
					                                    <div class="mg-group pull-right">
					                                        <a class="modal-with-form" href="#modalForm2">상세정보</a>
					                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
					                                            <i class="fa fa-caret-up"></i>
					                                        </button>
					                                        <ul class="dropdown-menu mg-menu" role="menu">
					                                            <li><a href="#"><i class="fa fa-download"></i> 수정</a></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <h5 class="mg-title text-semibold">조인성<small>왕</small></h5>
					                    </div>
					                </div>
					                <div class="isotope-item col-sm-6 col-md-4 col-lg-3">
					                    <div class="thumbnail">
					                        <div class="thumb-preview">
					                            <a class="thumb-image" href="assets/images/projects/project-2.jpg">
					                                <img src="resources/assets/images/projects/project-2.jpg" class="img-responsive" alt="Project">
					                            </a>
					                            <div class="mg-thumb-options">
					                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
					                                <div class="mg-toolbar">
					                                    <div class="mg-option checkbox-custom checkbox-inline">
					                                        <input type="checkbox" id="file_1" value="1">
					                                        <label for="file_1">SELECT</label>
					                                    </div>
					                                    <div class="mg-group pull-right">
					                                        <a href="#">상세정보</a>
					                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
					                                            <i class="fa fa-caret-up"></i>
					                                        </button>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <h5 class="mg-title text-semibold">정휘재<small>팀장</small></h5>
					                    </div>
					                </div>
				                	<div class="isotope-item col-sm-6 col-md-4 col-lg-3">
					                    <div class="thumbnail">
					                        <div class="thumb-preview">
					                            <a class="thumb-image" href="assets/images/projects/project-2.jpg">
					                                <img src="resources/assets/images/projects/project-2.jpg" class="img-responsive" alt="Project">
					                            </a>
					                            <div class="mg-thumb-options">
					                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
					                                <div class="mg-toolbar">
					                                    <div class="mg-option checkbox-custom checkbox-inline">
					                                        <input type="checkbox" id="file_1" value="1">
					                                        <label for="file_1">SELECT</label>
					                                    </div>
					                                    <div class="mg-group pull-right">
					                                        <a href="#">EDIT</a>
					                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
					                                            <i class="fa fa-caret-up"></i>
					                                        </button>
					                                        <ul class="dropdown-menu mg-menu" role="menu">
					                                            <li><a href="#"><i class="fa fa-download"></i> Download</a></li>
					                                            <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <h5 class="mg-title text-semibold">김주희<small>팀장</small></h5>
					                    </div>
				                	</div>
					                <div class="isotope-item col-sm-6 col-md-4 col-lg-3">
					                    <div class="thumbnail">
					                        <div class="thumb-preview">
					                            <a class="thumb-image" href="assets/images/projects/project-2.jpg">
					                                <img src="resources/assets/images/projects/project-2.jpg" class="img-responsive" alt="Project">
					                            </a>
					                            <div class="mg-thumb-options">
					                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
					                                <div class="mg-toolbar">
					                                    <div class="mg-option checkbox-custom checkbox-inline">
					                                        <input type="checkbox" id="file_1" value="1">
					                                        <label for="file_1">SELECT</label>
					                                    </div>
					                                    <div class="mg-group pull-right">
					                                        <a href="#">EDIT</a>
					                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
					                                            <i class="fa fa-caret-up"></i>
					                                        </button>
					                                        <ul class="dropdown-menu mg-menu" role="menu">
					                                            <li><a href="#"><i class="fa fa-download"></i> Download</a></li>
					                                            <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <h5 class="mg-title text-semibold">장미경<small>일반</small></h5>
					                    </div>
					                </div>
					                <div class="isotope-item col-sm-6 col-md-4 col-lg-3">
					                    <div class="thumbnail">
					                        <div class="thumb-preview">
					                            <a class="thumb-image" href="assets/images/projects/project-2.jpg">
					                                <img src="resources/assets/images/projects/project-2.jpg" class="img-responsive" alt="Project">
					                            </a>
					                            <div class="mg-thumb-options">
					                                <div class="mg-zoom"><i class="fa fa-search"></i></div>
					                                <div class="mg-toolbar">
					                                    <div class="mg-option checkbox-custom checkbox-inline">
					                                        <input type="checkbox" id="file_1" value="1">
					                                        <label for="file_1">SELECT</label>
					                                    </div>
					                                    <div class="mg-group pull-right">
					                                        <a href="#">EDIT</a>
					                                        <button class="dropdown-toggle mg-toggle" type="button" data-toggle="dropdown">
					                                            <i class="fa fa-caret-up"></i>
					                                        </button>
					                                        <ul class="dropdown-menu mg-menu" role="menu">
					                                            <li><a href="#"><i class="fa fa-download"></i> Download</a></li>
					                                            <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <h5 class="mg-title text-semibold">김재희<small>팀장</small></h5>
					                    </div>
					                </div>
			           			</div>
	            			</div>
            			</section>
            		</div>
           		</div>
			</section>
		<!-- end Page -->
		</section>
		 
		 
		</div>
		<!--/ 전체 레이어 -->
		
		
		
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
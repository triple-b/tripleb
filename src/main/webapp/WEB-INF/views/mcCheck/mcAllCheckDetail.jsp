<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

						<section class="panel">
							
							<header class="panel-heading">
								
								<div class="panel-btn" style="margin-bottom:10px;">
									<input type="hidden" class=" btn btn-primary" style="float:right ;" onclick="update();"></input>
								</div>
						
								<h1 class="panel-title">헬스장 시설 점검표</h1>
							</header>
							<div class="panel-body">
								
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
											
											<th>점검시설</th>
											<th class="hidden-phone">점검부위</th>
											<th class="hidden-phone">점검일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="m">
											<tr>
												<input type="hidden" name="machine" value="${m.machineChkNo }" onclick="oneCheckbox(this)">
												<td>${m.mcName}</td>
												<td class="center hidden-phone">${m.machineChkContent}</td>
												<td class="center hidden-phone">${m.machineChkDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</section>
						
						
					<!-- end: page -->
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
	var machineNo = "";
	
    function oneCheckbox(a){

        var obj = document.getElementsByName("machine");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }
        
        machineNo = a.value;
        

    }
    
    function update() {
    	location.href="updateForm.mcc?mccno="+machineNo;
    }
	</script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/tables/examples.datatables.default.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/javascripts/ui-elements/examples.modals.js"></script>
</body>
</html>
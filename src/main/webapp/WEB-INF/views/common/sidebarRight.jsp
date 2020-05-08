<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="today" class="java.util.Date" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside id="sidebar-right" class="sidebar-right">
		<div class="nano">
			<div class="nano-content">
				<a href="#" class="mobile-close visible-xs">
					Collapse <i class="fa fa-chevron-right"></i>
				</a>
	
				<div class="sidebar-right-wrapper">
	
					<div class="sidebar-widget widget-friends">
						<h6>트레이너 출/퇴근 현황</h6>
						<ul>
						
						
							<c:forEach items="${ onTrainer }" var="ot">
							
								<!-- 현재 날짜와 출근 시간 비교 -->
								<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" /> <!-- 현재 날짜 -->
								<fmt:formatDate var="sDate" value="${ ot.trainerScheck }" pattern="yyyyMMdd" /> <!-- 출근 시간 -->
								<fmt:formatDate var="eDate" value="${ ot.trainerEcheck }" pattern="yyyyMMdd" /> <!-- 퇴근 시간 -->
								
								<c:set var="dateSVersus" value="${sDate- now}" />
								<c:set var="dateEVersus" value="${eDate- now}" />
								
								<c:choose>
								  <c:when test="${dateEVersus eq 0}">
								  	<li class="status-offline">
								  </c:when>
								 <c:when test="${dateSVersus eq 0}">
									<li class="status-online">
								 </c:when>
								 <c:otherwise>
								 	<li class="status-offline">
								 </c:otherwise>
								</c:choose>
								<figure class="profile-picture">
									<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ ot.trainerThumbnail }" alt="${ ot.trainerName }" class="img-circle">
								</figure>
								<div class="profile-info">
									<span class="name">${ ot.trainerName } 트레이너 (${ ot.trainerGrade })</span>
									<span class="title">ON : 
										<c:choose>
											<c:when test="${ ot.trainerEcheck eq ot.trainerScheck }">
												${ ot.trainerScheck }
											</c:when>
											<c:otherwise>
												--
											</c:otherwise>
										</c:choose>
									
									</span>
									<span class="title">OFF : 
										<c:choose>
											<c:when test="${ ot.trainerEcheck eq ot.trainerScheck }">
												${ ot.trainerEcheck }
											</c:when>
											<c:otherwise>
												--
											</c:otherwise>
										</c:choose>
									</span>
								</div>
								</li>
							</c:forEach>
							

						</ul>
					</div>
	
				</div>
			</div>
		</div>
	</aside>
</body>
</html>
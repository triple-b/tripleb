<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Web Fonts  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
	
	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
	
	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/morris/morris.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jstree/themes/default/style.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/select2/select2.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
	
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme.css" />
	
	<!-- Skin CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/skins/default.css" />
	
	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/stylesheets/theme-custom.css">
	
	<!-- Head Libs -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/modernizr/modernizr.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendor/jquery/jquery.js"></script>
	
<style>
.btn_number{
	width:40px;
	font-size:14px;
	font-weight:600;
}
</style>
</head>
<body>
	

	<section class="body-sign body-locked">
		<div class="center-sign">
			<div class="panel panel-sign">
				<div class="panel-title-sign mt-xl text-right">
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> 출/퇴근</h2>
				</div>
				<div class="panel-body">
					<form action="login.utr" method="post">
						<div class="current-user text-center" style="margin-top:0px;">
							<img src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" height="54" alt="Porto Admin" />
							
						</div>
						<div class="form-group mb-lg">
							<div class="input-group input-group-icon">
								<input id="trainerPwd" type="password" name="trainerPwd" class="form-control input-lg">
								<span class="input-group-addon">
									<span class="icon icon-lg">
										<i class="fa fa-lock"></i>
									</span>
								</span>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<p class="mt-xs mb-none">
									<a href="${ pageContext.servletContext.contextPath }">출근번호 찾기</a>
								</p>
							</div>
							<div class="col-xs-6 text-right">
								<button type="submit" id="btn_submit" class="btn btn-primary">출/퇴근</button>
							</div>
						</div>
					</form>
				</div>
				
					
				<!-- 버튼 open -->
						<div id="btn_div" style="width:100%; display:none;">
								<section class="panel panel-featured-bottom panel-featured-primary">
									<div class="panel-body" style="padding-top:20px; padding-bottom:20px;">
										
								        <table style="width:100%;">
								            <tr>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText);">1</button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText);">2</button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">3</button></td>
								                <td><button class="btn btn-default btn_number" disabled><i class="fa fa-life-ring"></i></button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">4</button></td>
								                <td><button class="btn btn-default btn_number" disabled><i class="fa fa-life-ring"></i></button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">5</button></td>
								                <td><button class="btn btn-default" id="btnSubmit" style="width:60px;">확인</button></td>
								            </tr>
								            <tr>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">6</button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">7</button></td>
								                <td><button class="btn btn-default btn_number" disabled><i class="fa fa-life-ring"></i></button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">8</button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">9</button></td>
								                <td><button class="btn btn-default btn_number" disabled><i class="fa fa-life-ring"></i></button></td>
								                <td><button class="btn btn-default btn_number" onclick="btnNum(this.innerText)">0</button></td>
								                <td><button class="btn btn-default" style="width:60px;" onclick="btnSub()"><span style="display:none;">m</span><i class="fa fa-long-arrow-left"></i></button></td>
								            </tr>
								        </table>
								        
									</div>
								</section>
						</div>

					    <!-- 버튼 end -->
				    
				</div>
				
			</div>
			
		</section>
				
		

		<script>
		
		$(function(){
			$('#trainerPwd').click(function(){
				$('#btn_div').css('display', 'block');
				$(this).attr('disabled', true);
				$('#btn_submit').attr('disabled', true);
				
			})
			
			$('#btnSubmit').click(function(){
				$('#btn_div').css('display', 'none');
				$('#btn_submit').attr('disabled', false);
				$('#trainerPwd').attr('disabled', false);
			})
		})
		
		var bNum = "";
		function btnNum(e){
			bNum += e;
			$('input[name="trainerPwd"]').val(bNum);
			
			console.log($('input[name="trainerPwd"]').val());
		}
		
		function btnSub(){
		 	bNum = bNum.substr(0, bNum.length-1);
			$('#trainerPwd').val(bNum);
		}
		</script>
			
	<!-- jsp파일들 -->
	<jsp:include page="../common/footerjs.jsp" />
</body>
</html>
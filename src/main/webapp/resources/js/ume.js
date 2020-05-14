$(function(){
	
	// 회원 삭제
	$(".btn_memDel").click(function(){
	
		if($("input:checkbox[name=checkRow]:checked").length > 0){
		
			$("#delOk").click(function(){
				
				var chk = new Array();
				
				$("input[name=checkRow]:checked").each(function(){
					chk.push($(this).val());
				})
				
				location.href="delete.ume?chk="+chk;
					
			})
		
		}else{
			$('.btn_memDel').addClass('modal-dismiss');
			alert("회원을 1명 이상 선택해주세요");
		}
	
	});
	
	// 회원 일시정지
	$(".btn_memPause").click(function(){
		
		
		if($("input:checkbox[name=checkRow]:checked").length > 1){
			
			$('.btn_memPause').addClass('modal-dismiss');
			alert("일시정지 하실 1명의 회원만 선택해주세요.");
			
		}else if($("input:checkbox[name=checkRow]:checked").length == 1){
			
			var pno = $("input:checkbox[name=checkRow]:checked").val();
			$("#pauseMemberNo").attr("value", pno);
			
			
		}else{
			$('.btn_memPause').addClass('modal-dismiss');
			alert("일시정지할 회원을 선택해주세요.");
		}
	
	
	})
	
	// 회원 일시정지 해제
	
		$(".btn_memPauseCancel").click(function(){
		
		
		if($("input:checkbox[name=checkRow]:checked").length > 1){
			
			$('.btn_memPauseCancel').addClass('modal-dismiss');
			alert("일시정지 하실 1명의 회원만 선택해주세요.");
			
		}else if($("input:checkbox[name=checkRow]:checked").length == 1){
			
			var mname = $("input:checkbox[name=checkRow]:checked").parent().next().next().children().text();
			$("#pauseCancleMemberName").attr("value", mname);
			
			var pcno = $("input:checkbox[name=checkRow]:checked").val();
			$("#pauseCancleMemberNo").attr("value", pcno);
			
			
		}else{
			$('.btn_memPauseCancel').addClass('modal-dismiss');
			alert("일시정지할 회원을 선택해주세요.");
		}
	
	
	})
	
	
	// 회원 블랙리스트
	
	$(".btn_memBlack").click(function(){
		
		if($("input:checkbox[name=checkRow]:checked").length > 1){
			
			$('.btn_memBlack').addClass('modal-dismiss');
			alert("등록하실 1명의 회원만 선택해주세요.");
			
		}else if($("input:checkbox[name=checkRow]:checked").length == 1){
			
			var mno = $("input:checkbox[name=checkRow]:checked").val();
			$("#blackMemberNo").attr("value", mno);
			
		}else{
			$('.btn_memBlack').addClass('modal-dismiss');
			alert("등록하실 회원을 선택해주세요.");
		}
	
	});
	
	// 회원 블랙리스트 취소
	
	$('.btn_memblack_cancel').click(function(){
		if($("input:checkbox[name=checkRow]:checked").length > 1){
			
			$('.btn_memblack_cancel').addClass('modal-dismiss');
			alert("취소하실 1명의 회원만 선택해주세요.");
			
		}else if($("input:checkbox[name=checkRow]:checked").length == 1){
			
			var mno = $("input:checkbox[name=checkRow]:checked").val();
			$("#blCancelMemberNo").attr("value", mno);
			
		}else{
			$('.btn_memblack_cancel').addClass('modal-dismiss');
			alert("취소하실 회원을 선택해주세요.");
		}
	});
	
	
	// 회원 상세 보기
	$('table tbody').on('click', 'tr', function () {
		
	    var table = $('table').DataTable();
	    var data = table.row( this ).data();
	    var mno = data[1];
	    
	    
	    gen = data[4];
		
		$.ajax({
			url:"detail.ume",
			data:{mno:mno},
			type:"post",
			cashe:false,
			success:function(member){
				var trainer = "";
				
				if(member.memProductStart == undefined){
					startDate = " ";
					endDate = " ";
				}else{
					startDate = member.memProductStart;
					endDate = member.memProductEnd;
				}
				
				if(member.memberTrainer != null){
					trainer = member.memberTrainer + " 트레이너";
				}
				
				
				switch(gen){
				case "여" : $("#mgFemale").prop('checked', true), 
							$("#mgMale").prop('checked', false); break;
				case "남" : $("#mgMale").prop('checked', true),
							$("#mgFemale").prop('checked', false); break;
				}
				
				$("#memberMonth option").each(function(){
					if($(this).val() == member.memberBirth.substring(2, 4)){
						$(this).prop("selected", true);
					}
				});
				

				$('.mNo').attr("value", member.memberNo);
				$('.mName').attr("value", member.memberName);
				$('.mEmail').attr("value", member.memberEmail);
				$('.mPhone').attr("value", member.memberPhone);
				$('.mAddress').attr("value", member.memberAddress);
				$('.mHeight').attr("value", member.memberHeight);
				$('.mWeight').attr("value", member.memberWeight);
			
				
				$('#memberYear').attr("value", member.memberBirth.substring(0, 2));
				$('#memberDay').attr("value", member.memberBirth.substring(4, 6));
			
				
				if(member.memberNote == null){
					$('#mNote').text("");
				}else{					
					$('#mNote').text(member.memberNote);
				}
				$('#memTrainer').text(trainer);
				$('.pName').attr("value", member.productName);
				$('.mBirth').attr("value", member.memberBirth);
				$('.lNo').attr("value", member.lockerNo);
				

				$('#memPStart').text(startDate);
				$('#memPEnd').text(endDate);			
				
				if(member.pauseStart == undefined){
					$('#pStart').text(" ");
					$('#pEnd').text(" ");
				}else{
					$('#pStart').text(member.pauseStart);
					$('#pEnd').text(member.pauseEnd);
				}
				
			},error:function(){
				
			}
		})

	});
	
});
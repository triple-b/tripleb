	function send2(){
		
		var chk = new Array();
		var chk2 = new Array();
		$("input[name=lockerPosNo]:checked").each(function(){
			chk.push($(this).parent().next().next().next().next().val());
			chk2.push($(this).parent().next().next().next().next().next().val());
			console.log(chk);

			
			
		}) 
		
		//document.getElementById("demo-form-wlqrkrhtlvek-Enroll").submit();
		
	}
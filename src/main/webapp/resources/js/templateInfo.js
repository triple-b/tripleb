/**
 * 템플릿설정 관련 스크립트 파일
 * 작성자 : 장미경
 */

(function( $ ) {
	$('#menuTree').jstree({
		core:{
			check_callback: true,
			data:{
		       "url": 'detail.mtp',
		       "data": function (n) {
		           return n
		       }
			}
		},				
	    'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file-text'
			},
	    	'fa fa-group' : {
				'icon' : 'fa fa-group'
			},
			'fa fa-user' : {
				'icon' : 'fa fa-user'
			},
			'fa fa-list-ul' : {
				'icon' : 'fa fa-list-ul'
			},
			'fa fa-building-o' : {
				'icon' : 'fa fa-building-o'
			},
			'fa fa-bar-chart-o' : {
				'icon' : 'fa fa-bar-chart-o'
			},
			'fa fa-calendar' : {
				'icon' : 'fa fa-calendar'
			},
			'fa fa-bullhorn' : {
				'icon' : 'fa fa-bullhorn'
			}					
		},
		plugins: ['types', 'checkbox'],
	    checkbox: {
	        tie_selection: false
	    }
	}).bind("loaded.jstree", function (event, data) {		     
           $(this).jstree("open_all");
     })      
}).apply( this, [ jQuery ]);

var ArrayPrice = new Array();
ArrayPrice.push(0);
ArrayPrice.push(0);
ArrayPrice.push(0);
ArrayPrice.push(0);
ArrayPrice.push(0);
ArrayPrice.push(0);
ArrayPrice.push(0);

var menuList = "";

$('#menuTree').on("changed.jstree", function (e, data) {
	//console.log(data.selected);
	//["8-1-300000", "10-2-300000", "1-0-0", "9-1-200000"]
	//["8-1-300000", "10-2-300000", "1-0-0", "9-1-200000", "6-0-500000"]
	//item1 itemno-parentitmeno-가격
	var ArrayCheck = new Array();	//Array선언	
	var ArrayMenuList = new Array();
	setItemPrice()					// 가격 초기화
	var CheckArr = data.selected;	
					
	for(var i=0; i<CheckArr.length; i++){	
		var selectStr = CheckArr[i];				
		ArrayCheck = selectStr.split("-");
		
		ArrayMenuList.push(ArrayCheck[0]);
		
		if (ArrayCheck[1] == "0") {
			var idx = Number(ArrayCheck[0])-1		
			var pre_price = ArrayPrice[idx];
			var next_price = pre_price + Number(ArrayCheck[2]);
			ArrayPrice[idx] = next_price;
			$("#item" + ArrayCheck[0]).text(numberFormat(ArrayPrice[idx]));
		}else {
			var idx = Number(ArrayCheck[1])-1					
			var pre_price = ArrayPrice[idx];
			var next_price = pre_price + Number(ArrayCheck[2]);
			ArrayPrice[idx] = next_price;
			$("#item" + ArrayCheck[1]).text(numberFormat(ArrayPrice[idx]));
		}
		
	}	
	
	// 전체금액 계산
	var totalPrice = 0;		 
	for (var i=0; i < ArrayPrice.length; i++ ) {
		totalPrice += ArrayPrice[i];
	}
	$("#totalprice").text(numberFormat(totalPrice));
	
	// 선택한 메뉴리스트  값 저장(미리보기페이지에서 사용)
	menuList = ArrayMenuList.join(",");	
	
});


// 금액초기화
function setItemPrice() {
	for(var i=0; i<ArrayPrice.length; i++){
		ArrayPrice[i] = 0;
		$("#item" + (i+1)).text(0);
	}
}

// 천 단위마다 컴마 찍기
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//컴마제거 후 리턴
function stringNumberToInt(stringNumber){
	if(typeof(stringNumber) == "string") {
		if(stringNumber.indexOf(",") != -1) {
			return parseInt(stringNumber.replace(/,/g , ''));
		}else {
			return parseInt(stringNumber);
		}
	}else {
		return stringNumber
	}
}
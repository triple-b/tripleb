var morrisBarData = [{
	y: '1:1 PT',
	a: 50,
	b: 10
}, {
	y: '1:3 PT',
	a: 70,
	b: 25
}, {
	y: '1:5 PT',
	a: 30,
	b: 10
}];


(function( $ ) {

	'use strict';

	/*
	Morris: Bar
	*/
	Morris.Bar({
		resize: true,
		element: 'morrisBar',
		data: morrisBarData,
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['평균', '나'],
		hideHover: true,
		barColors: ['#0088cc', '#2baab1']
	});


}).apply( this, [ jQuery ]);
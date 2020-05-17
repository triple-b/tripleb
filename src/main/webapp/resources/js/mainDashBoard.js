
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
(function( $ ) {

	'use strict';
		
	/*
	Liquid Meter
	*/

	/*
	Morris: Bar
	*/
	Morris.Bar({
		resize: true,
		element: 'morrisBar',
		data: morrisBarData,
		xkey: 'y',
		ykeys: ['a', 'b', 'c'],
		labels: ['총매출액', '회원권', 'PT'],
		hideHover: true,
		barColors: ['#e36159','#0088cc', '#2baab1']
	});
	
	/*
	Flot: Bars
	*/
	(function() {
		var plot = $.plot('#flotBars', [flotBarsData], {
			colors: ['#8CC9E8'],
			series: {
				bars: {
					show: true,
					barWidth: 0.8,
					align: 'center'
				}
			},
			xaxis: {
				mode: 'categories',
				tickLength: 0
			},
			grid: {
				hoverable: true,
				clickable: true,
				borderColor: 'rgba(0,0,0,0.1)',
				borderWidth: 1,
				labelMargin: 15,
				backgroundColor: 'transparent'
			},
			tooltip: true,
			tooltipOpts: {
				content: '%y',
				shifts: {
					x: -10,
					y: 20
				},
				defaultTheme: false
			}
		});
	})();

	/*
	Morris: Donut
	*/
	Morris.Donut({
		resize: true,
		element: 'morrisDonut',
		data: morrisDonutData,
		colors: ['#d2322d', '#e89113', '#0077b3', '#3f923f']
	});

}).apply( this, [ jQuery ]);
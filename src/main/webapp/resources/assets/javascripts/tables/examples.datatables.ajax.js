
(function( $ ) {

	'use strict';

	var datatableInit = function() {

		var $table = $('#datatable-ajax');
		$table.dataTable({
			bProcessing: true,
			sAjaxSource: $table.data('url')
		});
		
		// initialize
		var datatable = $table.dataTable({
			aoColumnDefs: [{
				bSortable: false,
				aTargets: [ 3, 4, 6 ]
			}]
			
		});

	};

	$(function() {
		datatableInit();
	});

}).apply( this, [ jQuery ]);
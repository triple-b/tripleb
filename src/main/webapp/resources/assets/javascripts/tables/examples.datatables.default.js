

(function( $ ) {

	'use strict';

	var datatableInit = function() {
		

		$('#datatable-default').dataTable();
		$('#datatable-default1').dataTable();
		$('#datatable-default2').dataTable();
		$('#datatable-default3').dataTable();
		
	   /* var oTable = $('#datatable-default').dataTable();
		oTable.fnSort( );
*/
	};
	
	

	$(function() {
		datatableInit();
	});

}).apply( this, [ jQuery ]);
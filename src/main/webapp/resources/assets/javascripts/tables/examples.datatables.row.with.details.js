
(function( $ ) {

	'use strict';

	var datatableInit = function() {
		var $table = $('#datatable-details-invocie');

		// format function for row details
		var fnFormatDetails = function( datatable, tr ) {			
					
			return [
				'<table class="table mb-none" role="grid" aria-describedby="datatable-details-invocie_info">',
				'<tr class="b-top-none">',
					'<td data-click="null"><label class="mb-none">서비스 Url : ' + $(tr).attr("data-url") + '</label></td>',
				'</tr>',
				'<tr class="b-top-none">',
					'<td data-click="null"><label class="mb-none">주소 : ' + $(tr).attr("data-addr") + '</label></td>',
				'</tr>',
				'<tr class="b-top-none">',
					'<td data-click="null"><label class="mb-none">연락처 : ' + $(tr).attr("data-tel") + '</label></td>',
				'</tr>',
				'<tr class="b-top-none">',
					'<td data-click="null"><label class="mb-none">구매 상태 : ' + $(tr).attr("data-status") + '</label></td>',
				'</tr>',
				'<tr class="b-top-none">',
					'<td data-click="null"><label class="mb-none">구메 취소 사유 : ' + $(tr).attr("data-reason") + '</label></td>',
				'</tr>',
			'</div>'
			].join('');

		};

		// insert the expand/collapse column
		var th = document.createElement( 'th' );
		var td = document.createElement( 'td' );
		td.innerHTML = '<i data-toggle class="fa fa-plus-square-o text-primary h5 m-none"></i>';
		td.className = "text-center";
		//$(td).attr("data-clickid", "null");

		$table
			.find( 'thead tr' ).each(function() {
				this.insertBefore( th, this.childNodes[0] );
			});

		$table
			.find( 'tbody tr' ).each(function() {
				this.insertBefore(  td.cloneNode( true ), this.childNodes[0] );
			});

		// initialize
		var datatable = $table.dataTable({
			aoColumnDefs: [{
				bSortable: false,
				aTargets: [0]
			}],
			aaSorting: [
				[5, 'desc'],
				[1, 'asc']
			]
		});

		// add a listener i[data-click]
		$table.on('click', 'i[data-toggle]', function() {	
			var $this = $(this),
				tr = $(this).closest( 'tr' ).get(0);
				console.log(tr);

			if ( datatable.fnIsOpen(tr) ) {
				$this.removeClass( 'fa-minus-square-o' ).addClass( 'fa-plus-square-o' );
				datatable.fnClose( tr );
			} else {
				$this.removeClass( 'fa-plus-square-o' ).addClass( 'fa-minus-square-o' );
				datatable.fnOpen( tr, fnFormatDetails( datatable, tr), 'details' );
			}
		});
		
		$table.on('click', '[data-clickid]', function() {				
			var tr = $(this).closest( 'tr' );			
			location.href= "detail.miv?ino=" + tr.context.dataset.clickid;
		});		
		
	};

	$(function() {
		datatableInit();		
	});	
	
}).apply( this, [ jQuery ]);
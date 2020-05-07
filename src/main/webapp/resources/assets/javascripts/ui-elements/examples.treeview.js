
(function( $ ) {

	'use strict';

	/*
	Basic
	*/
	$('#treeBasic').jstree({
		'core' : {
			'themes' : {
				'responsive': false
			}
		},		
		'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file'
			}
		},
		'plugins': ['types']
	});
	
	
	$("#treeCheckbox").jstree({
        core: {
        	'themes' : {
				'responsive': false
			},
			check_callback: true
        },
        plugins: ["checkbox"],
        checkbox: {
            tie_selection: false
        }
    })
    .on("select_node.jstree deselect_node.jstree", function(e, data) {
        subfunction(data);
    })
    .on("check_node.jstree uncheck_node.jstree", function(e, data) {
        subfunction2(data);
    });

	function subfunction(data) {
		//some operation;
		 var id = data.instance.get_node(data.selected).id;        //id 가져오기
		 var item = data.instance.get_node(data.selected).text;    //type 가져오기
		 var price = data.instance.get_node(data.selected).price;    //paht 가져오기
		 var a = data.instance.get_node(data.selected).data.item;    //data 에서 a 가져오기
		 //data.instance.get_node(data.selected[i]).text)

		    console.log("id : " + id );
		    console.log("item : " + item );
		    console.log("price : " + price );
		    console.log("a : " + a );
	};

	function subfunction2(data) {
		//some operation;
		alert('체크 ' + data.node.state.checked);
		
		console.log("data : " + data);

		//  now you need to decide what you want to select or not
		// and do it manually, e.g. like below
		var selectFlag = true; 

		if (selectFlag) {
			var action = data.node.state.checked ? 'select_node' : 'deselect_node';
			$("#treeCheckbox").jstree(action, data.node);
		}
	};

	/*
	Checkbox
	*/
	$('#treeCheckbox1').jstree({
		'core' : {
			'themes' : {
				'responsive': false
			}
		},
		'check_callback' : true,
		'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file'
			}
		},
		'plugins': ['types', 'checkbox'],
		checkbox: {
            tie_selection: false
        }
	});


	/*
	Ajax HTML
	*/
	$('#treeAjaxHTML').jstree({
		'core' : {
			'themes' : {
				'responsive': false
			}, 
			'check_callback' : true,
			'data' : {
				'url' : function (node) {
				  return 'assets/ajax/ajax-treeview-nodes.html';
				},
				'data' : function (node) {
				  return { 'parent' : node.id };
				}
			}
		},
		'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file'
			}
		},
		'plugins': ['types']
	});

	/*
	Ajax JSON
	*/
	$('#treeAjaxJSON').jstree({
		'core' : {
			'themes' : {
				'responsive': false
			}, 
			'check_callback' : true,
			'data' : {
				'url' : function (node) {
					return node.id === '#' ? 'assets/ajax/ajax-treeview-roots.json' : 'assets/ajax/ajax-treeview-children.json';
				},
				'data' : function (node) {
					return { 'id' : node.id };
				}
			}
		},
		'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file'
			}
		},
		'plugins': ['types']
	});

	/*
	Drag & Drop
	*/
	$('#treeDragDrop').jstree({
		'core' : {
			'check_callback' : true,
			'themes' : {
				'responsive': false
			}
		},
		'types' : {
			'default' : {
				'icon' : 'fa fa-folder'
			},
			'file' : {
				'icon' : 'fa fa-file'
			}
		},
		'plugins': ['types', 'dnd']
	});

}).apply( this, [ jQuery ]);
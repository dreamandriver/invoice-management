<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>jQuery EasyUI</title>
<LINK rel="stylesheet" type="text/css" href="${baseurl}/js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
	<script>
	var useryyadd = function() {
		//alert(id);
		var sendUrl = "${baseurl}/user/useryyedit.action";
		createmodalwindow("添加医院信息", 800, 300, sendUrl);
	};
	//工具栏
	var toolbar = [ {
		id : 'useryyadd',
		text : '添加',
		iconCls : 'icon-add',
		handler : useryyadd
	} ];

	var frozenColumns;

	var columns = [ [{
		field : 'mc',
		title : '名称',
		width : 180
	}, {
		field : 'dqmc',
		title : '所属地区',
		width : 130
	}]];
	function initGrid() {
		$('#test').datagrid({
			title : '医院信息列表',
			//nowrap : false,
			striped : true,
			//collapsible : true,
			url : 'datagrid_data.json',
			//sortName : 'code',
			//sortOrder : 'desc',
			//remoteSort : false,
			idField : 'id',
			//frozenColumns : frozenColumns,
			columns : columns,
			pagination : true,
			rownumbers : true,
			toolbar : toolbar,
			loadMsg : "",
			pageList : [ 15, 30, 50, 100 ]/* ,
			onClickRow : function(index, field, value) {
				$('#test').datagrid('unselectRow', index);
			} */
		});
	}
	$(function() {
		initGrid();
		//tree= new createSyncTree("queryAreaTree_content","queryAreaTree","useryyCustom_dqmc","useryyCustom_dq",setting,null,null,"onClick");
	});
		//$(function(){
			/* $('#test').datagrid({
				title:'My Titledddd',
				iconCls:'icon-save',
				width:600,
				height:350,
				nowrap: false,
				striped: true,
				collapsible:true,
				url:'datagrid_data.json',
				sortName: 'code',
				sortOrder: 'desc',
				remoteSort: false,
				idField:'code',
				/frozenColumns:[[
	                {field:'ck',checkbox:true},
	                {title:'code',field:'code',width:80,sortable:true}
				]], 
				//datagrid的列
				columns:[[
			        {title:'Base Information',colspan:3},
					{field:'opt',title:'Operation',width:100,align:'center', rowspan:2,
						formatter:function(value,rec){
							return '<span style="color:red">Edit Delete</span>';
						}
					}
				],[
					{field:'name',title:'Name',width:120},
					{field:'addr',title:'Address',width:120,rowspan:2,sortable:true,
						sorter:function(a,b){
							return (a>b?1:-1);
						}
					},
					{field:'col4',title:'Col41',width:150,rowspan:2}
				]],
				pagination:true,
				rownumbers:true,
				//工具栏
				toolbar:[{
					id:'btnadd',
					text:'Add',
					iconCls:'icon-add',
					handler:function(){
						$('#btnsave').linkbutton('enable');
						alert('add')
					}
				},{
					id:'btncut',
					text:'Cut',
					iconCls:'icon-cut',
					handler:function(){
						$('#btnsave').linkbutton('enable');
						alert('cut')
					}
				},'-',{
					id:'btnsave',
					text:'Save',
					disabled:true,
					iconCls:'icon-save',
					handler:function(){
						$('#btnsave').linkbutton('disable');
						alert('save')
					}
				}]
			}); */
			/* var p = $('#test').datagrid('getPager');
			if (p){
				$(p).pagination({
					onBeforeRefresh:function(){
						alert('before refresh');
					}
				});
			} */
		//});
		function resize(){
			$('#test').datagrid('resize', {
				width:700,
				height:400
			});
		}
		function getSelected(){
			var selected = $('#test').datagrid('getSelected');
			if (selected){
				alert(selected.code+":"+selected.name+":"+selected.addr+":"+selected.col4);
			}
		}
		function getSelections(){
			var ids = [];
			var rows = $('#test').datagrid('getSelections');
			for(var i=0;i<rows.length;i++){
				ids.push(rows[i].code);
			}
			alert(ids.join(':'));
		}
		function clearSelections(){
			$('#test').datagrid('clearSelections');
		}
		function selectRow(){
			$('#test').datagrid('selectRow',2);
		}
		function selectRecord(){
			$('#test').datagrid('selectRecord','002');
		}
		function unselectRow(){
			$('#test').datagrid('unselectRow',2);
		}
		function mergeCells(){
			$('#test').datagrid('mergeCells',{
				index:2,
				field:'addr',
				rowspan:2,
				colspan:2
			});
		}
	</script>
</head>
<body>
	<h1>DataGrid</h1>
	<div style="margin-bottom:10px;">
		<a href="#" onclick="resize()">resize</a>
		<a href="#" onclick="getSelected()">getSelected</a>
		<a href="#" onclick="getSelections()">getSelections</a>
		<a href="#" onclick="clearSelections()">clearSelections</a>
		<a href="#" onclick="selectRow()">selectRow</a>
		<a href="#" onclick="selectRecord()">selectRecord</a>
		<a href="#" onclick="unselectRow()">unselectRow</a>
		<a href="#" onclick="mergeCells()">mergeCells</a>
	</div>
	
	<table id="test"></table>
	
</body>
</html>
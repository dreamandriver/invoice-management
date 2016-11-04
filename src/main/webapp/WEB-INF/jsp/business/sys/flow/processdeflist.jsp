<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<title>流程定义列表</title>
<script type="text/javascript">
var delprocessdefinition = function() {
	var sendUrl = "${baseurl}/sys/flow/deployprocess.action";
	createmodalwindow("部署流程定义", 800, 350, sendUrl);

};

	//工具栏
	var toolbar = [ {
		id : 'authorize_role',
		text : '部署流程定义',
		iconCls : 'icon-add',
		handler : delprocessdefinition
	}  ];

	var frozenColumns;

	var columns = [ [  {
		field : 'deploymentId',
		title : '流程部署id',
		width : 180
	}, {
		field : 'id',
		title : '流程定义id',
		width : 180
	}, {
		field : 'name',
		title : '流程定义名称',
		width : 180
	}, {
		field : 'key',
		title : '流程定义key',
		width : 180
	}, {
		field : 'version',
		title : '流程定义版本',
		width : 180
	}  ] ];

	function initGrid() {
		$('#processdeflist').datagrid({
			title : '流程定义列表',
			//nowrap : false,
			striped : true,
			//collapsible : true,
			url : '${baseurl}/sys/flow/processdeflist_result.action',
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
			pageList : [ 15, 30, 50, 100 ],
			onClickRow : function(index, field, value) {
				$('#processdeflist').datagrid('unselectRow', index);
			}
		});

	}
	
	$(function() {
		initGrid();
		
	});

    
</script>

</head>
<body>
<div id="sysrolequery_div">

		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<table id="processdeflist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</div>
	
	
</body>
</html>
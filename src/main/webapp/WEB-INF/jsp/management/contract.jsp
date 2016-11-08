<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>药品信息查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">

$(function() {
	initGrid();
	
	var start = {
			  elem: '#start',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16', //设定最小日期为当前日期
			  max: '2099-06-16', //最大日期
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  end.min = datas; //开始日选好后，重置结束日的最小日期
				  end.start = datas //将结束日的初始值设定为开始日
			  }
			};
	var end = {
			  elem: '#end',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16',
			  max: '2099-06-16',
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  start.max = datas; //结束日选好后，重置开始日的最大日期
			  }
			};
			laydate(start);
			laydate(end);
});

var addContract = function (){
	var sendUrl = "${baseurl}/management/contract/add";
	createmodalwindow("药品信息导入", 800, 300, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxximport_callback); */
};


var ypxxexport = function(){
	jquerySubByFId('contractQueryForm', ypxxexport_callback, null, "json");
};

function ypxxexport_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	
}
var ypxxdelList = function(){
	_confirm('您确定要执行删除操作吗?',null,
	  function(){
		var ids = [];
		var rows = $('#contractlist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#ypxxdelid").val(ids.join(','));
			//alert($("#ypxxdelid").val());
			jquerySubByFId('ypxxdelForm', ypxxdel_callback, null, "json");
		}else{
			alert_warn("请选择要删除的项目");
		}
		
	  }
	)
	
};
var ypxxdel = function(id){
	_confirm('您确定要执行删除操作吗?',null,
			function(){
				$("#ypxxdelid").val(id);
				jquerySubByFId('ypxxdelForm', ypxxdel_callback, null, "json");
			}
	)
};
function ypxxdel_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	contractQuery();
}
var ypxxedit = function (id){
	//alert(id);
	var sendUrl = "${baseurl}/ypml/ypxx/edit.action?editid="+id;
	
	createmodalwindow("药品信息修改", 900, 500, sendUrl);
	/* 
	var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxxedit_callback);  */
};

/* function ypxxedit_callback(redata){
	$('#contractQuery_div').css("display","none");
	$("#ypxxedit_div").css("display","block");
	$("#ypxxedit_div").html(redata);
} */
function contractinfo(id){
var sendUrl = "${baseurl}/ypml/ypxx/view.action?id="+id;
	
	createmodalwindow("药品信息查看", 900, 500, sendUrl);
}
var ypxxadd = function (){
	//alert(id);
	var sendUrl = "${baseurl}/ypml/ypxx/edit.action";
	createmodalwindow("药品信息添加", 900, 500, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxxedit_callback);  */
};

var rsyncypxx = function(id){
	_confirm('您确定要执行同步操作吗?',null,
			function(){
				jquerySubByFId('rsyncForm', rsyncypxx_callback, null, "json");
			}
	)
};
function rsyncypxx_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
}
//工具栏


var toolbar = [ {
	id : 'btnAddContract',
	text : '添加合同',
	iconCls : 'icon-add',
	handler : addContract
	},
	{
		id : 'export',
		text : '导出',
		iconCls : 'icon-redo',
		handler : ypxxexport
	}];

var frozenColumns;

var columns = [ [{
	field : 'id',
	title : '',
	checkbox:true
},{
	field : 'contractno',
	title : '合同号',
	width : 80
},{
	field : 'comsumer',
	title : '客户姓名',
	width : 80
},{
	field : 'createdate',
	title : '创建日期',
	width : 80
},{
	field : 'amount',
	title : '金额',
	width : 80
},{
	field : 'company',
	title : '单位名称',
	width : 180
},{
	field : 'comment',
	title : '备注',
	width : 200
}
<c:if test="${ismanager=='1'}">
,{
	field : 'opt1',
	title : '修改',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:ypxxedit(\''+row.id+'\')>修改</a>';
	}
},{
	field : 'opt2',
	title : '删除',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:ypxxdel(\''+row.id+'\')>删除</a>';
	}
}
</c:if>
,{
	field : 'opt3',
	title : '详细',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:contractinfo(\''+row.id+'\')>查看</a>';
	}
}]];

function initGrid(){
	$('#contractlist').datagrid({
		title : '合同列表',
		nowrap : true,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/management/contract/search',
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		idField : 'id',
		//frozenColumns : frozenColumns,
		columns : columns,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageSize:30,
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#contractlist').datagrid('unselectRow', index);
				}
		});

	}

	function contractQuery() {
 
		var formdata = $("#contractQueryForm").serializeJson();
		//alert(formdata);
		$('#contractlist').datagrid('unselectAll');
		$('#contractlist').datagrid('load', formdata);
	}
</script>
</HEAD>
<BODY>
<div id="contractQuery_div">
    <form id="contractQueryForm" name="contractQueryForm" action="${baseurl}/ypml/ypxx/exportypxx.action" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">合同号：</td>
						<td><INPUT type="text"  name="ypxxCustom.mc" /></TD>
						<TD class="left">客户名称：</TD>
						<td ><INPUT type="text" name="ypxxCustom.jx" /></td>
						 <td class="left">日期：</td>
				  		<td>
				      		<input class="laydate-icon" id="start" name="start" style="width:150px; margin-right:10px;">
				      		至
				      		<input class="laydate-icon" id="end" name="end" style="width:150px;">
				 		 </td>
				 		 <td colspan=2  >
							<a id="btn" href="#" onclick="contractQuery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						</td>
					</TR>
				</TBODY>
			</TABLE>
	    </form>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="contractlist"></table>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</div>
<div id="ypxximport_div">
test
</div>
<div id="ypxxedit_div">

</div>
<form id="ypxxdelForm" name="ypxxdelForm" action="${baseurl}/ypml/ypxxdel.action" method="post">
<input type="hidden" id="ypxxdelid" name="ypxxdelid"/>
</form>
<form id="rsyncForm" name="rsyncForm" action="${baseurl}/ypml/ypxx/rsyncypxx.action" method="post">

</form>
</BODY>
</HTML>


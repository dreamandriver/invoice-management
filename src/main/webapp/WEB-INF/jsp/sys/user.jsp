<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>用户查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">

$(function() {
	initGrid();
});

var addUser = function (){
	var sendUrl = "${baseurl}/sys/user/toadd";
	createmodalwindow("添加合同", 800, 300, sendUrl);
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
var userdelList = function(){
	_confirm('您确定要执行删除操作吗?',null,
	  function(){
		var ids = [];
		var rows = $('#contractlist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#userdelid").val(ids.join(','));
			//alert($("#userdelid").val());
			jquerySubByFId('userdelForm', userdel_callback, null, "json");
		}else{
			alert_warn("请选择要删除的项目");
		}
		
	  }
	)
	
};
var userdel = function(id){
	_confirm('您确定要执行删除操作吗?',null,
			function(){
				$("#userdelid").val(id);
				jquerySubByFId('userdelForm', userdel_callback, null, "json");
			}
	)
};
function userdel_callback(data) {
	//var result = getCallbackData(data);
	_alert(data);
	contractQuery();
}
var useredit = function (id){
	//alert(id);
	var sendUrl = "${baseurl}/sys/user/toupdate?serialNo="+id;
	
	createmodalwindow("用户信息修改", 900, 500, sendUrl);
	/* 
	var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', useredit_callback);  */
};

/* function useredit_callback(redata){
	$('#contractQuery_div').css("display","none");
	$("#useredit_div").css("display","block");
	$("#useredit_div").html(redata);
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
			_ajaxPostRequest(ajaxOption, '', useredit_callback);  */
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
	id : 'btnaddUser',
	text : '添加用户',
	iconCls : 'icon-add',
	handler : addUser
	}];

var frozenColumns;

var columns = [ [{
	field : 'id',
	title : '',
	checkbox:true
},{
	field : 'userid',
	title : '用户编号',
	width : 80
},{
	field : 'username',
	title : '用户姓名',
	width : 80
},{
	field : 'permission1',
	title : '操作发票',
	width : 80,
	formatter:function(value, row, index){
		if(value == "admin"){
			return "有";
		}else{
			return "无";
		}
		
	}
},{
	field : 'permission2',
	title : '操作支票',
	width : 80,
	formatter:function(value, row, index){
		if(value == "admin"){
			return "有";
		}else{
			return "无";
		}
		
	}
},{
	field : 'opt1',
	title : '修改',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:useredit(\''+row.serialno+'\')>修改</a>';
	}
},{
	field : 'opt2',
	title : '删除',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:userdel(\''+row.serialno+'\')>删除</a>';
	}
}
]];

function initGrid(){
	$('#contractlist').datagrid({
		title : '用户列表',
		nowrap : true,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/sys/user/search',
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		idField : 'id',
		//frozenColumns : frozenColumns,
		fitColumns: true,
		//showFooter:true,
		columns : columns,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageSize:50,
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
    <form id="contractQueryForm" name="contractQueryForm" action="${baseurl}/management/contract/search" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">合同号：</td>
						<td><INPUT type="text"  name="contractno" /></TD>
						<TD class="left">客户名称：</TD>
						<td ><INPUT type="text" name="consumer" /></td>
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

</div>
<div id="useredit_div">

</div>
<form id="userdelForm" name="userdelForm" action="${baseurl}/sys/user/del" method="post">
<input type="hidden" id="userdelid" name="serialno"/>
</form>
<form id="rsyncForm" name="rsyncForm" action="${baseurl}/ypml/ypxx/rsyncypxx.action" method="post">

</form>
</BODY>
</HTML>


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
	var instart = {
			  elem: '#instart',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16', //设定最小日期为当前日期
			  max: '2099-06-16', //最大日期
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  inend.min = datas; //开始日选好后，重置结束日的最小日期
				  inend.start = datas //将结束日的初始值设定为开始日
			  }
			};
	var inend = {
			  elem: '#inend',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16',
			  max: '2099-06-16',
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  instart.max = datas; //结束日选好后，重置开始日的最大日期
			  }
			};
			laydate(instart);
			laydate(inend);
	var outstart = {
			  elem: '#outstart',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16', //设定最小日期为当前日期
			  max: '2099-06-16', //最大日期
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  outend.min = datas; //开始日选好后，重置结束日的最小日期
				  outend.start = datas //将结束日的初始值设定为开始日
			  }
			};
	var outend = {
			  elem: '#outend',
			  format: 'YYYY/MM/DD',
			  min: '2001-06-16',
			  max: '2099-06-16',
			  istime: false,
			  istoday: false,
			  choose: function(datas){
				  outstart.max = datas; //结束日选好后，重置开始日的最大日期
			  }
			};
			laydate(outstart);
			laydate(outend);	
});
var addCheck = function (){
	var sendUrl = "${baseurl}/management/check/add";
	createmodalwindow("添加支票", 800, 300, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxximport_callback); */
};


var ypxxexport = function(){
	jquerySubByFId('ypxxqueryForm', ypxxexport_callback, null, "json");
};

function ypxxexport_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	
}
var ypxxdelList = function(){
	_confirm('您确定要执行删除操作吗?',null,
	  function(){
		var ids = [];
		var rows = $('#ypxxlist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#ypxxdelid").val(ids.join(','));
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
	ypxxquery();
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
	$('#ypxxquery_div').css("display","none");
	$("#ypxxedit_div").css("display","block");
	$("#ypxxedit_div").html(redata);
} */
function ypxxinfo(id){
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
	id : 'btnAddCheck',
	text : '添加支票',
	iconCls : 'icon-add',
	handler :  addCheck
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
	field : 'bm',
	title : '合同号',
	width : 80
},{
	field : 'mc',
	title : '客户名称',
	width : 130
},{
	field : 'jx',
	title : '支票号',
	width : 80
},{
	field : 'gg',
	title : '收入金额',
	width : 100
},{
	field : 'zhxs',
	title : '收入日期',
	width : 50
},{
	field : 'scqymc',
	title : '扣税金额',
	width : 180
},{
	field : 'spmc',
	title : '扣税税点',
	width : 150
},{
	field : 'zbjg',
	title : '支出金额',
	width : 50
},{
	field : 'zbjg',
	title : '支出日期',
	width : 50
},{
	field : 'zbjg',
	title : '结算',
	width : 50
},{
	field : 'zbjg',
	title : '单位名称',
	width : 50
},{
	field : 'zbjg',
	title : '备注',
	width : 50
},{
	field : 'dictinfoByJyzt.info',
	title : '交易状态',
	width : 60,
	//嵌套对象输出使用formatter方法
	formatter:function(value, row, index){
		return row.dictinfoByJyzt.info;
	}
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
		return '<a href=javascript:ypxxinfo(\''+row.id+'\')>查看</a>';
	}
}]];

function initGrid(){
	$('#ypxxlist').datagrid({
		title : '药品信息列表',
		//nowrap : false,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/ypml/ypxx/list_result.action',
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
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#ypxxlist').datagrid('unselectRow', index);
				}
		});

	}

	function ypxxquery() {
 
		var formdata = $("#ypxxqueryForm").serializeJson();
		//alert(formdata);
		$('#ypxxlist').datagrid('unselectAll');
		$('#ypxxlist').datagrid('load', formdata);
	}
</script>
</HEAD>
<BODY>
<div id="ypxxquery_div">
    <form id="ypxxqueryForm" name="ypxxqueryForm" action="${baseurl}/ypml/ypxx/exportypxx.action" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">合同号：</td>
						<td><INPUT type="text"  name="ypxxCustom.mc" /></TD>
						<TD class="left">客户名称：</TD>
						<td ><INPUT type="text" name="ypxxCustom.jx" /></td>
						<TD class="left">支票号：</TD>
						<td ><INPUT type="text" name="ypxxCustom.gg" /></td>
					</TR>
					<TR>
						 <td class="left">收入日期：</td>
				  		<td>
				      		<input class="laydate-icon" id="instart" name="instart" style="width:150px; margin-right:10px;">
				      		至
				      		<input class="laydate-icon" id="inend" name="inend" style="width:150px;">
				 		 </td>
						 <td class="left">支出日期：</td>
				  		<td>
				      		<input class="laydate-icon" id="outstart" name="outstart" style="width:150px; margin-right:10px;">
				      		至
				      		<input class="laydate-icon" id="outend" name="outend" style="width:150px;">
				 		 </td>
				 		 <td colspan=2 >
							<a id="btn" href="#" onclick="ypxxquery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						</td>
					</tr>
				</TBODY>
			</TABLE>
	    </form>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="ypxxlist"></table>
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


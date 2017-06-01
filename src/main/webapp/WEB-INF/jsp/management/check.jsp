<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
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
	var sendUrl = "${baseurl}/management/check/toadd";
	createmodalwindow("添加支票", 800, 300, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxximport_callback); */
};


var checkexport = function(){
	//jquerySubByFId('checkqueryForm', checkexport_callback, null, "json");
	$("#checkqueryForm").submit();
};

function checkexport_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	
}
var checkdelList = function(){
	_confirm('您确定要执行删除操作吗?',null,
	  function(){
		var ids = [];
		var rows = $('#ypxxlist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#checkdelid").val(ids.join(','));
			jquerySubByFId('checkdelForm', checkdel_callback, null, "json");
		}else{
			alert_warn("请选择要删除的项目");
		}
	  }
	)
};
var checkdel = function(id){
	_confirm('您确定要执行删除操作吗?',null,
			function(){
				$("#checkdelid").val(id);
				jquerySubByFId('checkdelForm', checkdel_callback, null, "json");
			}
	)
};
function checkdel_callback(data) {
	//var result = getCallbackData(data);
	_alert(data);
	checkquery();
}
var checkedit = function (id){
	//alert(id);
	var sendUrl = "${baseurl}/management/check/toupdate?serialNo="+id;
	
	createmodalwindow("支票信息修改", 900, 500, sendUrl);
	/* 
	var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', checkedit_callback);  */
};

//显示合同详情
var showcontract = function(serialNo){
	
	var sendUrl = '${baseurl}/management/contract/detail/' + serialNo;
	
	createmodalwindow("合同详情", 1155, 540, sendUrl);
}
/* function checkedit_callback(redata){
	$('#checkquery_div').css("display","none");
	$("#checkedit_div").css("display","block");
	$("#checkedit_div").html(redata);
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
			_ajaxPostRequest(ajaxOption, '', checkedit_callback);  */
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


var toolbar = [ 
	{
		id : 'export',
		text : '导出',
		iconCls : 'icon-redo',
		handler : checkexport
	}];

var frozenColumns;

var columns = [ [{
	field : 'id',
	title : '',
	checkbox:true,
	hidden:true
},{
	field : 'serialno',
	title : '标记',
	width : 60,
	formatter:function(value, row, index){
		if(row.serialno){
			var str = '<select name="'+ row.serialno +'" class="iffinish">';
			str += '<option value="1" ';
			if(row.finish ==1 ){
				str += ' selected ';
			}
			str += '>蓝</option>';
			str += '<option value="2" ';
			if(row.finish ==2 ){
				str += ' selected ';
			}
			str += '>红</option>';
			str += '<option value="3" ';
			if(row.finish ==3 ){
				str += ' selected ';
			}
			str += '>绿</option>';
			str += '<option value="0" ';
			if(row.finish ==0 ){
				str += ' selected ';
			}		
			str += '>白</option>';
			str += '</select>';
			return str;
		}
	}
},{
	field : 'contractno',
	title : '合同号',
	width : 80,
	formatter:function(value, row, index){
		if(row.serialno){
		    return '<a href=javascript:showcontract(\''+row.contractserialno+'\')>'+value+'</a>'
		}
	}
},{
	field : 'consumer',
	title : '客户名称',
	width : 80
},{
	field : 'checkno',
	title : '支票号',
	width : 120
},{
	field : 'incomeamount',
	title : '收入金额',
	width : 100
},{
	field : 'incomedate',
	title : '收入日期',
	width : 80,
	formatter:function(value, row, index){
		if(row.serialno){
			var date = new Date(value);
		    return date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
		}else{
			return "--";
		}
	}
},{
	field : 'taxamount',
	title : '扣税金额',
	width : 100
},{
	field : 'taxpoint',
	title : '扣税税点',
	width : 50
},{
	field : 'payamount',
	title : '支出金额',
	width : 100
},{
	field : 'paydate',
	title : '支出日期',
	width : 80,
	formatter:function(value, row, index){
		if(row.serialno){
			var date = new Date(value);
		    return date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
		}else{
			return "--";
		}
	}
	
},{
	field : 'other',
	title : '其他',
	width : 100,
	formatter:function(value, row, index){
		if(value){
			return value;
		}else if(row.serialno){
			return "0";
		}
	}
},{
	field : 'account',
	title : '结算',
	width : 100
},{
	field : 'company',
	title : '单位名称',
	width : 150
},{
	field : 'comment',
	title : '备注',
	width : 150
}
,{
	field : 'opt1',
	title : '修改',
	width : 60,
	formatter:function(value, row, index){
		if(row.serialno){
			return '<a href=javascript:checkedit(\''+row.serialno+'\')>修改</a>';
		}else{
			return "--";
		}
	}
},{
	field : 'opt2',
	title : '删除',
	width : 60,
	formatter:function(value, row, index){
		if(row.serialno){
			return '<a href=javascript:checkdel(\''+row.serialno+'\')>删除</a>';
		}else{
			return "--";
		}
	}
}
]];

function initGrid(){
	$('#ypxxlist').datagrid({
		title : '支票信息列表',
		//nowrap : false,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/management/check/search',
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		idField : 'id',
		//frozenColumns : frozenColumns,
		columns : columns,
		fitColumns: true,
		showFooter:true,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageSize:30,
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#ypxxlist').datagrid('unselectRow', index);
				},
		rowStyler:function(index,row,css){
			if (row.finish == 1){
				return 'background-color:#6293BB;color:#fff;font-weight:bold;width:auto;';
			}else if(row.finish == 2){
				return 'background-color:#E21616;color:#fff;font-weight:bold;width:auto;';
			}else if(row.finish == 3){
				return 'background-color:#68c942;color:#fff;font-weight:bold;width:auto;';
			}else{
				return 'width:auto;';
			}
		},
		onLoadSuccess:function(data){      
			
			$(".iffinish").change(function(){
				$.post("${baseurl}/management/check/changecl",
						{serialno:$(this).attr("name"),flag:$(this).val()},
						function(data){
							$('#ypxxlist').datagrid('reload');  
						},
						"json"
						);
			});
		}
		});

	}

	function checkquery() {
 
		var formdata = $("#checkqueryForm").serializeJson();
		//alert(formdata);
		$('#ypxxlist').datagrid('unselectAll');
		$('#ypxxlist').datagrid('load', formdata);
	}
	
</script>
</HEAD>
<BODY>
<div id="checkquery_div">
    <form id="checkqueryForm" name="checkqueryForm" action="${baseurl}/management/check/excelDownload" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">合同号：</td>
						<td><INPUT type="text"  name="contractno" /></TD>
						<TD class="left">客户名称：</TD>
						<td ><INPUT type="text" name="consumer" /></td>
						<TD class="left">单位名称：</TD>
						<td ><INPUT type="text" name="company" /></td>
						<TD class="left">支票号：</TD>
						<td ><INPUT type="text" name="checkno" /></td>
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
				 		 <td colspan=4 >
							<a id="btn" href="#" onclick="checkquery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
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
</div>
<div id="checkedit_div">

</div>
<form id="checkdelForm" name="checkdelForm" action="${baseurl}/management/check/del" method="post">
<input type="hidden" id="checkdelid" name="serialno"/>
</form>
<form id="rsyncForm" name="rsyncForm" action="${baseurl}/ypml/ypxx/rsyncypxx.action" method="post">

</form>
</BODY>
</HTML>


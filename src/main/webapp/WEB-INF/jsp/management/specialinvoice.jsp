<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>专业发票查询</title>
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

var addInvoice = function (){
	var sendUrl = "${baseurl}/management/invoice/toadd";
	createmodalwindow("添加发票", 800, 300, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', ypxximport_callback); */
};


var specialinvoiceexport = function(){
	//jquerySubByFId('specialinvoicequeryForm', specialinvoiceexport_callback, null, "json");
	$("#specialinvoicequeryForm").submit();
};

function specialinvoiceexport_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	
}
var invoicedelList = function(){
	_confirm('您确定要执行删除操作吗?',null,
	  function(){
		var ids = [];
		var rows = $('#invoicelist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#invoicedelid").val(ids.join(','));
			//alert($("#invoicedelid").val());
			jquerySubByFId('invoicedelForm', invoicedel_callback, null, "json");
		}else{
			alert_warn("请选择要删除的项目");
		}
		
	  }
	)
	
};
var invoicedel = function(id){
	_confirm('您确定要执行删除操作吗?',null,
			function(){
				$("#invoicedelid").val(id);
				jquerySubByFId('invoicedelForm', invoicedel_callback, null, "json");
			}
	)
};
function invoicedel_callback(data) {
	//var result = getCallbackData(data);
	_alert(data);
	commoninvoicequery();
}
var invoiceedit = function (id){
	//alert(id);
	var sendUrl = "${baseurl}/management/invoice/toupdate?serialNo="+id;
	
	createmodalwindow("发票信息修改", 900, 500, sendUrl);
	/* 
	var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', invoiceedit_callback);  */
};

//显示合同详情
var showcontract = function(serialNo){
	
	var sendUrl = '${baseurl}/management/contract/detail/' + serialNo;
	
	createmodalwindow("合同详情", 1100, 580, sendUrl);
}

/* function invoiceedit_callback(redata){
	$('#commoninvoicequery_div').css("display","none");
	$("#invoiceedit_div").css("display","block");
	$("#invoiceedit_div").html(redata);
} */
function invoiceinfo(id){
var sendUrl = "${baseurl}/ypml/ypxx/view.action?id="+id;
	
	createmodalwindow("药品信息查看", 900, 500, sendUrl);
}
var ypxxadd = function (){
	//alert(id);
	var sendUrl = "${baseurl}/ypml/ypxx/edit.action";
	createmodalwindow("药品信息添加", 900, 500, sendUrl);
	/* var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(true,sendUrl,"json","html");
			_ajaxPostRequest(ajaxOption, '', invoiceedit_callback);  */
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
		handler : specialinvoiceexport
	}];

var frozenColumns;

var columns = [ [{
	field : 'id',
	title : '',
	checkbox:true
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
	title : '客户姓名',
	width : 80
},{
	field : 'invoiceno',
	title : '发票号',
	width : 150
},{
	field : 'zuofei',
	title : '作废',
	width : 100,
	formatter:function(value, row, index){
		if(row.serialno){
			if(row.status == 1){
				return row.amount;
			}else{
				return "--"
			}
		}else{
			return row.zuofei;
		}
	}
},{
	field : 'amount',
	title : '金额',
	width : 100,
	formatter:function(value, row, index){
		if(row.serialno){
			if(row.status == 0){
				return row.amount;
			}else if(row.status == 2){
				return "<font color='red'>-"+row.amount+"</font>";
			}else{
				return "--";
			}
		}else{
			return row.amount;
		}
	}
},{
	field : 'taxpoint',
	title : '扣税税点',
	width : 100
},{
	field : 'taxamount',
	title : '扣税金额',
	width : 100
},{
	field : 'company',
	title : '单位名称',
	width : 180
},{
	field : 'createdatestr',
	title : '开票日期',
	width : 120
},{
	field : 'comment',
	title : '备注',
	width : 180
}
,{
	field : 'opt1',
	title : '修改',
	width : 60,
	formatter:function(value, row, index){
		if(row.serialno){
			return '<a href=javascript:invoiceedit(\''+row.serialno+'\')>修改</a>';
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
			return '<a href=javascript:invoicedel(\''+row.serialno+'\')>删除</a>';
		}else{
			return "--";
		}
	}
}
]];

function initGrid(){
	$('#invoicelist').datagrid({
		title : '专业发票列表',
		nowrap : true,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/management/invoice/search/special',
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		idField : 'id',
		//frozenColumns : frozenColumns,
		//fitColumns: true,
		showFooter:true,
		columns : columns,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageSize:30,
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#invoicelist').datagrid('unselectRow', index);
				}
		});

	}

	function commoninvoicequery() {
 
		var formdata = $("#specialinvoicequeryForm").serializeJson();
		//alert(formdata);
		$('#invoicelist').datagrid('unselectAll');
		$('#invoicelist').datagrid('load', formdata);
	}
	
	function invoicequery() {
		 
		var formdata = $("#specialinvoicequeryForm").serializeJson();
		//alert(formdata);
		$('#invoicelist').datagrid('unselectAll');
		$('#invoicelist').datagrid('load', formdata);
	}
</script>
</HEAD>
<BODY>
<div id="commoninvoicequery_div">
    <form id="specialinvoicequeryForm" name="specialinvoicequeryForm" action="${baseurl}/management/invoice/special/excelDownload" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">合同号：</td>
						<td><INPUT type="text"  name="contractno" /></TD>
						<TD class="left">客户名称：</TD>
						<td ><INPUT type="text" name="consumer" /></td>
						<TD class="left">发票号：</TD>
						<td ><INPUT type="text" name="invoiceno" /></td>
						<td class="left">开票日期：</td>
				  		<td>
				      		<input class="laydate-icon" id="start" name="start" style="width:150px; margin-right:10px;">
				      		至
				      		<input class="laydate-icon" id="end" name="end" style="width:150px;">
				 		</td>
				 		<td colspan=2 >
							<a id="btn" href="#" onclick="commoninvoicequery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						</td>
					</TR>
					
				</TBODY>
			</TABLE>
	    </form>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="invoicelist"></table>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</div>
<div id="ypxximport_div">
</div>
<div id="invoiceedit_div">

</div>
<form id="invoicedelForm" name="invoicedelForm" action="${baseurl}/management/invoice/del" method="post">
<input type="hidden" id="invoicedelid" name="serialno"/>
</form>
<form id="rsyncForm" name="rsyncForm" action="${baseurl}/ypml/ypxx/rsyncypxx.action" method="post">

</form>
</BODY>
</HTML>


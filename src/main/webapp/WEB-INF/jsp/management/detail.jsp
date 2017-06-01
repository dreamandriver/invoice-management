<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>合同查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css1.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js1.jsp"%>


<script type="text/javascript">
var columns1 = [ [{
	field : 'id',
	title : '',
	checkbox:true,
	hidden:true
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
				return "--";
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

]];

var columns2 = [ [{
	field : 'id',
	title : '',
	checkbox:true,
	hidden:true
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
]];

var columns3 = [ [{
	field : 'id',
	title : '',
	checkbox:true,
	hidden:true
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
]];


$(function() {
	
	<c:if test="${activeUser.permission1 == 'admin'}"> 
$('#invoicelist1').datagrid({   
	title : '普通发票列表',
	nowrap : true,
	striped : true,
	//collapsible : true,
	//sortName : 'code',
	//sortOrder : 'desc',
	//remoteSort : false,
	idField : 'id',
	//frozenColumns : frozenColumns,
	fitColumns: true,
	showFooter:true,
	pagination : true,
	rownumbers : true,
	toolbar : toolbar,
	loadMsg:"",
	pageSize:30,
	pageList:[15,30,50,100],
    url:'/management/invoice/searchd/common/${contract.contractno}',   
    columns:columns1,
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
	onClickRow : function(index, field, value) {
		$('#invoicelist1').datagrid('unselectRow', index);
	}
}); 

$('#invoicelist2').datagrid({
	title : '专业发票列表',
	nowrap : true,
	striped : true,
	//collapsible : true,
	url : '/management/invoice/searchd/special/${contract.contractno}',
	//sortName : 'code',
	//sortOrder : 'desc',
	//remoteSort : false,
	idField : 'id',
	//frozenColumns : frozenColumns,
	fitColumns: true,
	showFooter:true,
	columns : columns2,
	pagination : true,
	rownumbers : true,
	toolbar : toolbar,
	loadMsg:"",
	pageSize:30,
	pageList:[15,30,50,100],
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
	onClickRow : function(index, field, value) {
		$('#invoicelist2').datagrid('unselectRow', index);
	}
	});
</c:if>
<c:if test="${activeUser.permission2 == 'admin'}">   
$('#checklist').datagrid({
	title : '支票信息列表',
	//nowrap : false,
	striped : true,
	//collapsible : true,
	url : '/management/check/searchd/${contract.contractno}',
	//sortName : 'code',
	//sortOrder : 'desc',
	//remoteSort : false,
	idField : 'id',
	//frozenColumns : frozenColumns,
	columns : columns3,
	fitColumns: true,
	showFooter:true,
	pagination : true,
	rownumbers : true,
	toolbar : toolbar,
	loadMsg:"",
	pageSize:30,
	pageList:[15,30,50,100],
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
	onClickRow : function(index, field, value) {
		$('#checklist').datagrid('unselectRow', index);
	}
	});
</c:if>
});

</script>
</HEAD>
<BODY>
<!-- 合同 -->
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;内容</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							
							<TR>
								<TD height=30 width="15%" align=right >客户名称：</TD>
								<TD class=category width="35%">
								<div>
								${contract.consumer}
								</div>
								<div id="contract_consumerTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >合同号：</TD>
								<TD class=category width="35%">
								<div>
								${contract.contractno}
								</div>
								<div id="contract_contractNoTip"></div>
								</TD>
							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >单位名称：</TD>
								<TD class=category width="35%">
								<div>
									${contract.company}
								</div>
								<div id="contract_companyTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >金额：</TD>
								<TD class=category width="35%">
								<div>
								<fmt:formatNumber value="${contract.amount}" pattern="#.00" type="number"/>
								</div>
								<div id="contract_amountTip"></div>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right >是否正式合同：</TD>
								<TD class=category width="35%" >
								<div>
									<c:if test="${contract.ifformal=='1'}">是</c:if>
									<c:if test="${contract.ifformal=='0'}">否</c:if>
								</div>
								<div id="contract_companyTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >创建日期：</TD>
								<TD class=category width="35%">
								<div>
									${contract.createdatestr}
								</div>
								</TD>
							</TR>
							
							<TR >
							    <TD height=30 width="15%" align=right >备注：</TD>
								<TD class=category width="75%" colspan="3" >
								<div>
								${contract.comment}
								</div>
								</TD>
							</TR>
							
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	
	<div id="commoninvoicequery_div">
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="invoicelist1"></table>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</div>
	
	<div id="commoninvoicequery_div">
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="invoicelist2"></table>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</div>


<div id="checkquery_div">
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
		<TBODY>
			<TR>
				<TD>
					<table id="checklist"></table>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</div>
</BODY>
</HTML>


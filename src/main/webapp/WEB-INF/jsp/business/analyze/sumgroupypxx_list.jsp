<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>按药品统计</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">



//工具栏

var toolbar = [/* {
	id : 'resultexport',
	text : '导出',
	iconCls : 'icon-add',
	handler : resultexport
	} */];

var frozenColumns;

var columns = [ [
 {
	field : 'bm',
	title : '流水号',
	width : 50,
	formatter:function(value,row,index){
		return row.ypxx.bm;
	}
},{
	field : 'mc',
	title : '通用名',
	width : 100,
	formatter:function(value,row,index){
		return row.ypxx.mc;
	}
},{
	field : 'cgl',
	title : '采购量',
	width : 50
},{
	field : 'cgje',
	title : '采购金额',
	width : 50
},{
	field : 'rkl',
	title : '入库量',
	width : 50
},{
	field : 'rkje',
	title : '入库金额',
	width : 50
},{
	field : 'thl',
	title : '退货量',
	width : 50
},{
	field : 'thje',
	title : '退货金额',
	width : 50
},{
	field : 'jsl',
	title : '结算量',
	width : 50
},{
	field : 'jsje',
	title : '结算金额',
	width : 50
}]];

function initGrid(){
	$('#businesslist').datagrid({
		title : '交易明细',
		//nowrap : false,
		showFooter:true,//是否显示列表尾部区域
		striped : true,
		//collapsible : true,
		url : '${baseurl}/analyze/sumgroupypxx_list_result.action',
		queryParams:{
			//year:'${year}'
		},
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		//idField : 'id',//如果值不是主键则影响获取checkbox选中个数
		//frozenColumns : frozenColumns,
		columns : columns,
		autoRowHeight:true,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#businesslist').datagrid('unselectRow', index);
				}
		});

	}
	$(function() {
		initGrid();
		
	});

	function query() {
		var formdata = $("#businesslistForm").serializeJson();
		//alert(formdata);
		$('#businesslist').datagrid('unselectAll');
		$('#businesslist').datagrid('load', formdata);
	}
	$(function(){
		//加载年
		//businessyearlist('year');
		//加载采购状态
		//getDictinfoCodelist('011','yycgdmxCustom_cgzt');
	});
</script>
</HEAD>
<BODY>
    <form id="businesslistForm" name="businesslistForm" method="post" >
			<TABLE  class="table_search">
				<TBODY>
					
					<TR>
					   <TD class="left">统计开始时间：</TD>
						<td >
						 <INPUT id="yybuinessCustom.startDate"
							name="yybuinessCustom.startDate" 
							 onfocus="WdatePicker({isShowWeek:false,skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" style="width:80px"/>
						</td>
					   <TD class="left">统计截止时间：</td>
					    <td>
					     <INPUT id="yybuinessCustom.endDate" 
							name="yybuinessCustom.endDate"
							 onfocus="WdatePicker({isShowWeek:false,skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" style="width:80px"/>
						<a id="btn" href="#" onclick="query()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						 </TD>
						
						
					</tr>
					
					
				</TBODY>
			</TABLE>
	   
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<table id="businesslist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		 </form>

</BODY>
</HTML>


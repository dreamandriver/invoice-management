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
var addyycgdmx = function(){
	_confirm('您确定要采购选择的药品吗?',null,
	  function(){
		var ids = [];
		var rows = $('#ypxxlist').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].id);
		}
		if(ids.length>0){
			$("#ypxxids").val(ids.join(','));
			//alert($("#ypxxdelid").val());
			jquerySubByFId('addyycgdmxForm', addyycgdmx_callback, null, "json");
		}else{
			alert_warn("请选择要采购的药品");
		}
		
	  }
	)
	
};

function addyycgdmx_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
}


	function ypxxinfo(id) {
		var sendUrl = "${baseurl}/ypml/ypxx/view.action?id=" + id;

		createmodalwindow("药品信息查看", 900, 500, sendUrl);
	}

	//工具栏
	var toolbar = [ {
		id : 'ypxxdel',
		text : '确认采购',
		iconCls : 'icon-remove',
		handler : addyycgdmx
	} ];

	var frozenColumns;

	var columns = [ [ {
		field : 'id',
		title : '',
		checkbox : true
	}, {
		field : 'bm',
		title : '流水号',
		width : 80
	}, {
		field : 'mc',
		title : '通用名',
		width : 130
	}, {
		field : 'jx',
		title : '剂型',
		width : 80
	}, {
		field : 'gg',
		title : '规格',
		width : 100
	}, {
		field : 'zhxs',
		title : '转换系数',
		width : 50
	}, {
		field : 'scqymc',
		title : '生产企业',
		width : 180
	}, {
		field : 'spmc',
		title : '商品名称',
		width : 150
	}, {
		field : 'zbjg',
		title : '中标价',
		width : 50
	}, {
		field : 'dictinfoByJyzt.info',
		title : '交易状态',
		width : 60,
		//嵌套对象输出使用formatter方法
		formatter : function(value, row, index) {
			return row.dictinfoByJyzt.info;
		}
	}, {
		field : 'opt3',
		title : '详细',
		width : 60,
		formatter : function(value, row, index) {
			return '<a href=javascript:ypxxinfo(\'' + row.id + '\')>查看</a>';
		}
	} ] ];

	function initGrid() {
		$('#ypxxlist').datagrid({
			title : '药品信息列表',
			//nowrap : false,
			striped : true,
			//collapsible : true,
			url : '${baseurl}/cgd/addyycgmx_ypxxlist_result.action',
			queryParams : {//url的参数，初始加载datagrid时使用的参数
				'yycgdCustom.id' : '${yycgdCustom.id}'//yycgdid是参数名称，如果参数名称中间有点，将参数用单引号括起来
			},
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
				$('#ypxxlist').datagrid('unselectRow', index);
			}
		});

	}
	$(function() {
		initGrid();

	});

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
    <form id="ypxxqueryForm" name="ypxxqueryForm" action="" method="post">
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">通用名：</td>
						<td><INPUT type="text"  name="ypxxCustom.mc" /></TD>
						<TD class="left">剂型：</TD>
						<td ><INPUT type="text" name="ypxxCustom.jx" /></td>
						<TD class="left">规格：</TD>
						<td ><INPUT type="text" name="ypxxCustom.gg" /></td>
						<TD class="left">转换系数：</TD>
						<td ><INPUT type="text" name="ypxxCustom.zhxs" /></td>
					</TR>
					<TR>
						<TD class="left">流水号：</TD>
						<td ><INPUT type="text" name="ypxxCustom.bm" /></td>
						<TD class="left">生产企业：</TD>
						<td ><INPUT type="text" name="ypxxCustom.scqymc" /></td>
						<TD class="left">商品名称：</TD>
						<td ><INPUT type="text" name="ypxxCustom.spmc" /></td>
						 <td class="left">价格范围：</td>
				  		<td>
				      		<INPUT id="ypxxCustom.zbjglower" name="ypxxCustom.zbjglower" style="width:70px"/>
							至
							<INPUT id="ypxxCustom.zbjgupper" name="ypxxCustom.zbjgupper" style="width:70px"/>
							
				 		 </td>
					</tr>
					<tr>
					  
						<TD class="left">药品类别：</TD>
						<td >
							<select id="ypxxCustom.lb" name="ypxxCustom.lb" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${yplbList}" var="value">
									<option value="${value.id}">${value.info}</option>
								</c:forEach>
							</select>
						</td>
						<TD class="left">交易状态：</TD>
						<td >
							<select id="ypxxCustom.jyzt" name="ypxxCustom.jyzt" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${jyztList}" var="value">
									<option value="${value.id}">${value.info}</option>
								</c:forEach>
							</select>
							
						</td>
						
				 		 <td class="left" height="25">质量层次：</td>
				  		<td>
				  		<select id="ypxxCustom.zlcc" name="ypxxCustom.zlcc" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${ypzlccList}" var="value">
									<option value="${value.id}">${value.info}</option>
								</c:forEach>
						</select>
					
				  		</td>
						<td colspan=2 >
							<a id="btn" href="#" onclick="ypxxquery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						</td>
					</TR>
					
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

<form id="addyycgdmxForm" name="addyycgdmxForm" action="${baseurl}/cgd/addyycgdmxsubmit.action" method="post">
<input type="hidden" name="yycgdCustom.id" value="${yycgdCustom.id}"/>
<input type="hidden" id="ypxxids" name="ypxxids"/>
</form>
</BODY>
</HTML>


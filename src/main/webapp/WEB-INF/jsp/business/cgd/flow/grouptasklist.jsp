<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>采购单组任务列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>


<script type="text/javascript">


function claimTask(taskid){
	$("#taskid").val(taskid);
	jquerySubByFId('claimTaskForm', claimTask_callback, null);
}
function claimTask_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
}

//工具栏

var toolbar = [];

var frozenColumns;

var columns = [ [
 
 {
	field : 'taskId',
	title : '任务id',
	width : 80
},{
	field : 'taskName',
	title : '任务名称',
	width : 150
},{
	field : 'yycgdmc',
	title : '采购单名称',
	width : 150,
	formatter:function(value,row,index){
		return row.yycgdCustom.mc;
	}
},{
	field : 'useryymc',
	title : '下单医院',
	width : 150,
	formatter:function(value,row,index){
		return row.yycgdCustom.useryy.mc;
	}
},{
	field : 'cjtime',
	title : '建单时间',
	width : 80,
	formatter: function(value,row,index){
		value = row.yycgdCustom.cjtime;
		if(value){
			try{
			//通过js日期格式化
			var date = new Date(value);
			var y = date.getFullYear();//获取年
			var m = date.getMonth()+1;//获取月
			var d = date.getDate();
			return y+"-"+m+"-"+d;
			}catch(e){
				alert(e);
			}
		}
		
	}
},{
	field : 'opt3',
	title : '拾取任务',
	width : 60,
	formatter:function(value, row, index){
		return '<a href=javascript:claimTask("'+row.taskId+'")>拾取任务</a>';
	}
}]];

function initGrid(){
	$('#yycgdlist').datagrid({
		title : '采购单列表',
		//nowrap : false,
		striped : true,
		//collapsible : true,
		url : '${baseurl}/cgd/flow/grouptasklist_result.action',
		queryParams:{//查询参数，只在加载时使用，点击查询使用load重新加载不使用此参数
			//businessyear:'${year}'
		}, 
		//sortName : 'code',
		//sortOrder : 'desc',
		//remoteSort : false,
		idField : 'taskid',//查询结果集主键采购单id
		//frozenColumns : frozenColumns,
		columns : columns,
		autoRowHeight:true,
		pagination : true,
		rownumbers : true,
		toolbar : toolbar,
		loadMsg:"",
		pageList:[15,30,50,100],
		onClickRow : function(index, field, value) {
					$('#yycgdlist').datagrid('unselectRow', index);
				}
		});

	}
	$(function() {
		initGrid();
	});

	function yycgdquery() {
		var formdata = $("#yycgdqueryForm").serializeJson();//将form中的input数据取出来
		//alert(formdata);
		$('#yycgdlist').datagrid('load', formdata);
	}
	

	
	$(function(){
		//加载采购单状态
		//getDictinfoCodelist('010','yycgdCustom.zt');
		//加载年
		//businessyearlist('businessyear');
	

	});
</script>
</HEAD>
<BODY>
    <form id="yycgdqueryForm" name="yycgdqueryForm" method="post" >
			<TABLE  class="table_search">
				<TBODY>
					
					<TR> 
					<TD class="left">采购单编号：</td>
						<td><INPUT type="text"  name="yycgdCustom.id" /></TD>
					<TD class="left">采购单名称：</TD>
						<td ><INPUT type="text" name="yycgdCustom.mc" /></td>
					  <TD class="left">采购单状态：</TD>
						<td >
							<select id="yycgdCustom.zt" name="yycgdCustom.zt" style="width:150px">
							<option value="">全部</option>
								<c:forEach items="${cgdztlist}" var="dictinfo">
									<option value="${dictinfo.id}">${dictinfo.info}</option>
								</c:forEach>
							</select>
							<a id="btn" href="#" onclick="yycgdquery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>	
						</td>
						
						
						
					</tr>
					
				</TBODY>
			</TABLE>
	   
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<table id="yycgdlist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		 </form>
<form id="claimTaskForm" action="${baseurl }/cgd/flow/claimtask.action" method="post">
<input type="hidden" name="taskid" id="taskid"/>
</form>

</BODY>
</HTML>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
<head>
<title>系统用户信息查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>


<script type="text/javascript">
	var sysuserdel = function(id) {
		_confirm('您确定要执行删除操作吗?', null, function() {
			$("#sysuserdelid").val(id);
			jquerySubByFId('sysuserdelForm', sysuserdel_callback, null, "json");
		});
	};
	function sysuserdel_callback(data) {
		var result = getCallbackData(data);
		_alert(result);
		sysuserquery();
	}
	var sysuseredit = function(id) {
		//alert(id);
		var sendUrl = "${baseurl}/sys/user/edit.action?id=" + id;
		createmodalwindow("修改医院信息", 800, 250, sendUrl);

	};

	function sysuserview(id) {
		var sendUrl = "${baseurl}/sys/user/view.action?editid=" + id;
		createmodalwindow("查看医院信息", 800, 250, sendUrl);
	}
	var sysuseradd = function() {
		//alert(id);
		var sendUrl = "${baseurl}/sys/user/add.action";
		createmodalwindow("添加医院信息", 800, 250, sendUrl);
	};

	//工具栏
	var toolbar = [ {
		id : 'sysuseradd',
		text : '添加',
		iconCls : 'icon-add',
		handler : sysuseradd
	} ];

	var frozenColumns;

	var columns = [ [ /* {
		field : 'id',
		title : '',
		checkbox : true
	}, */ {
		field : 'usercode',
		title : '账号',
		width : 180
	}, {
		field : 'username',
		title : '名称',
		width : 130
	}, {
		field : 'groupname',
		title : '用户类型',
		width : 100,
		formatter:function(value,row,index){
			return row.dictinfoByGroupid.info;
		}
	}, {
		field : 'sysmc',
		title : '所属单位',
		width : 200,
		formatter:function(value,row,index){
			if(row.useryy){
				return row.useryy.mc;
			}else if(row.userjd){
				return row.userjd.mc;
			}else if(row.usergys){
				return row.usergys.mc;
			}
		}
	}, {
		field : 'userstate',
		title : '状态',
		width : 100,
		formatter : function(value, row, index) {
			return row.dictinfoByUserstate.info;
		}
	}, {
		field : 'opt1',
		title : '修改',
		width : 60,
		formatter : function(value, row, index) {
			return '<a href=javascript:sysuseredit(\'' + row.id + '\')>修改</a>';
		}
	}, {
		field : 'opt2',
		title : '删除',
		width : 60,
		formatter : function(value, row, index) {
			return '<a href=javascript:sysuserdel(\'' + row.id + '\')>删除</a>';
		}
	} ] ];

	function initGrid() {
		$('#sysuserlist').datagrid({
			title : '系统用户列表',
			//nowrap : false,
			striped : true,
			//collapsible : true,
			url : '${baseurl}/sys/user/list_result.action',
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
				$('#sysuserlist').datagrid('unselectRow', index);
			}
		});

	}
	$(function() {
		initGrid();
		
	});

	function sysuserquery() {

		var formdata = $("#sysuserqueryForm").serializeJson();
		//alert(formdata);
		$('#sysuserlist').datagrid('unselectAll');
		$('#sysuserlist').datagrid('load', formdata);
	}

	
</script>
</HEAD>
<BODY>
	<div id="sysuserquery_div">
		<form id="sysuserqueryForm" name="sysuserqueryForm" method="post" action="${baseurl}/sys/user/list_result.action">
			<TABLE class="table_search">
				<TBODY>
					<TR>
						<TD class="left">用户账号：${sysuserCustom.usercode }</td>
						<td><INPUT type="text" name="sysuserCustom.usercode" /></TD>
						<TD class="left">用户名称：</TD>
						<td><INPUT type="text" name="sysuserCustom.username" /></TD>

						<TD class="left">用户类型：</TD>
						<td>
							<select name="sysuserCustom.groupid">
								<option value="">请选择</option>
								<c:forEach items="${userGroupList}" var="dictinfo">
								  <option value="${dictinfo.id}">${dictinfo.info}</option>
								</c:forEach>
								
							</select>
						</TD>
						<td >
						<shiro:hasPermission name="user:list">
						<a id="btn" href="#" onclick="sysuserquery()"
							class="easyui-linkbutton" iconCls='icon-search'>查询</a>
						</shiro:hasPermission>
							</td>
					</TR>


				</TBODY>
			</TABLE>
		</form>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<table id="sysuserlist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</div>

	<div id="sysuseredit_div"></div>
	<form id="sysuserdelForm" name="sysuserdelForm"
		action="${baseurl}/sys/user/delete.action" method="post">
		<input type="hidden" id="sysuserdelid" name="id" />
	</form>

</BODY>
</HTML>


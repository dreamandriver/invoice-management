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
	
	var syspermissionadd = function() {
		//alert(id);
		var sendUrl = "${baseurl}/sys/permission/add.action";
		createmodalwindow("添加权限信息", 800, 250, sendUrl);
	};

	//工具栏
	var toolbar = [ {
		id : 'sysuseradd',
		text : '添加',
		iconCls : 'icon-add',
		handler : syspermissionadd
	} ];

	var frozenColumns;

	var columns = [ [ /* {
		field : 'id',
		title : '',
		checkbox : true
	}, */ {
		field : 'id',
		title : '权限id',
		width : 180
	}, {
		field : 'name',
		title : '权限名称',
		width : 130
	}, {
		field : 'url',
		title : 'url',
		width : 200
	}, {
		field : 'ismenu',
		title : '是否菜单',
		width : 200,
		formatter:function(value,row,index){
			if(value=='1'){
				return "是";
			}else{
				return "否";
			}
		}
	} ] ];

	function initGrid() {
		$('#syspermissionlist').datagrid({
			title : '系统权限列表',
			//nowrap : false,
			striped : true,
			//collapsible : true,
			url : '${baseurl}/sys/permission/list_result.action',
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
				$('#syspermissionlist').datagrid('unselectRow', index);
			}
		});

	}
	
	function syspermissionquery() {

		var formdata = $("#syspermissionqueryForm").serializeJson();
		//alert(formdata);
		$('#syspermissionlist').datagrid('unselectAll');
		$('#syspermissionlist').datagrid('load', formdata);
	}

	
	
	var setting = {
		view : {
			selectedMulti : false
		},
		check : {
			enable : false,
			chkStyle : "checkbox",
			chkboxType : {
				"Y" : "ps",
				"N" : "ps"
			}
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "parentid",
				rootPId : 0
			},
			key: {
				url: "xUrl"
			}
		},
		callback : {
			onClick : null
		}
	};

	var tree;
	var zNodes;
	function showSysPermissionTree() {
		tree.showMenu();
	}
	
	$(function() {
		initGrid();
		
		//通过ajax获取树的结点
		var sendUrl = "${baseurl}/sys/permission/listByjson.action";
		var ajaxOption = new AjaxOption();
			ajaxOption._initPostRequest(false,sendUrl,"pame","json");
			_ajaxPostRequest(ajaxOption, '', permissionload_callback);	
		
		tree = new createSyncTree("permissionTreeContent", "permissionTree",
				"sysPermissionCustom_name", "sysPermissionCustom_id", setting, zNodes, null,
				"onClick", '${sysPermissionCustom.id}');
	});
	function permissionload_callback(redata){
		try{
		//zNodes = redata.sysPermissionList;
			zNodes = redata;
		}catch(e){
			//alert(e);
		}
		return ;
	}

	
</script>
</HEAD>
<BODY>
	<div id="syspermissionquery_div">
		<form id="syspermissionqueryForm" name="syspermissionqueryForm" method="post" action="${baseurl}/sys/permission/list_result.action">
			<TABLE class="table_search">
				<TBODY>
					<TR>
						<TD class="left">上级菜单：</td>
						<td><INPUT type="text" id="sysPermissionCustom_name" onclick="showSysPermissionTree()"/>
							<INPUT type="text" name="sysPermissionCustom.id" id="sysPermissionCustom_id" value="${syspermissionCustom.parentid }"/>
							<div id="permissionTreeContent"
							class="zTreeDemoBackground left ztree_customcss">
								<ul id="permissionTree" class="ztree"></ul>
							</div>
						</TD>
						
						<td ><a id="btn" href="#" onclick="syspermissionquery()"
							class="easyui-linkbutton" iconCls='icon-search'>查询</a></td>
					</TR>


				</TBODY>
			</TABLE>
		</form>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<table id="syspermissionlist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</div>


</BODY>
</HTML>


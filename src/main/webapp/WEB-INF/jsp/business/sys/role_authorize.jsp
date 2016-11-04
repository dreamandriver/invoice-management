<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

		<script type="text/javascript">
		
	
	function role_authorize_submit(){
			
			jquerySubByFId('role_authorize_form',role_authorize_submit_callback,null,"json");

	}
	function role_authorize_submit_callback(data){
		var result = getCallbackData(data);
		var type = result.type;
		_alert(result);
		/* if (TYPE_RESULT_SUCCESS == type) {
			parent.sysPermissionquery();
			parent.closemodalwindow();
		} 	 */
	}
	
	
	var setting = {
			view : {
				selectedMulti : false,
				showLine: true
			},
			check : {
				enable : true,
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
			
			$('#submitbtn').linkbutton({   
	    		iconCls: 'icon-ok'  
			});  
			$('#closebtn').linkbutton({   
	    		iconCls: 'icon-cancel'  
			});
			//通过ajax获取树的结点
			//var sendUrl = "${baseurl}/sys/permission/listByjson.action";
			//var ajaxOption = new AjaxOption();
			//	ajaxOption._initPostRequest(false,sendUrl,"pame","json");
			//	_ajaxPostRequest(ajaxOption, '', permissionload_callback);	
			jquerySubByFId('listByjson',permissionload_callback,null,"json",false);
			tree = new createSyncTree("permissionTreeContent", "permissionTree",
					"sysPermissionCustom_name", "sysPermissionIds", setting, zNodes, null,
					"onCheck", '${sysPermissionIds}');
			//展开所有结点
			tree.expandAll();
			
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
<form id="listByjson" action="${baseurl}/sys/permission/listByjson.action" method="post"></form>
<form id="role_authorize_form" name="role_authorize_form" action="${baseurl}/sys/role/authorize_submit.action" method="post">
<input type="text" name="sysRoleCustom.id" value="${sysRoleCustom.id }"/>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;分配权限信息</TD>
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
								<TD width="100%" align=right rolspan=2>
								
								<input type="text" id="sysPermissionIds" name="sysPermissionIds" value="${sysPermissionAndMenuIds }"/>
								<div id="permissionTreeContent" >
									<ul id="permissionTree" class="ztree"></ul>
								</div>
								</TD>
								
							</TR>
							
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="role_authorize_submit()">提交</a>
								<a id="closebtn" href="#" onclick="parent.closemodalwindow()">关闭</a>
							  </td>
							</tr>
						
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</form>

</BODY>
</HTML>


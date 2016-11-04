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
		
	
	function sysPermissionsave(){

			jquerySubByFId('sysPermissioneditform',sysPermissionsave_callback,null,"json");

	}
	function sysPermissionsave_callback(data){
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
			//***********按钮**************
			$('#submitbtn').linkbutton({   
	    		iconCls: 'icon-ok'  
			});  
			$('#closebtn').linkbutton({   
	    		iconCls: 'icon-cancel'  
			});
			
			//通过ajax获取树的结点
			var sendUrl = "${baseurl}/sys/permission/listByjson.action";
			var ajaxOption = new AjaxOption();
				ajaxOption._initPostRequest(false,sendUrl,"pame","json");
				_ajaxPostRequest(ajaxOption, '', permissionload_callback);	
			
			tree = new createSyncTree("permissionTreeContent", "permissionTree",
					"sysPermissionCustom_parentname", "sysPermissionCustom_parentid", setting, zNodes, null,
					"onClick", '${sysPermissionCustom.parentid}');
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
<form id="sysPermissioneditform" name="sysPermissioneditform" action="${baseurl}/sys/permission/insertsubmit.action" method="post">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;系统权限信息</TD>
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
								<TD height=30 width="15%" align=right >权限id：</TD>
								<TD class=category width="35%">
								<input type="text" id="sysPermissionCustom_id" name="sysPermissionCustom.id" value="${sysPermissionCustom.id}"   />
								
								</TD>
								<TD height=30 width="15%" align=right >权限名称：</TD>
								<TD class=category width="35%">
								<input type="text" id="sysPermissionCustom_name" name="sysPermissionCustom.name" value="${sysPermissionCustom.name}"   />
								</TD>
							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >父权限：</TD>
								<TD class=category width="35%">
								<input type="text" id="sysPermissionCustom_parentname" onclick="showSysPermissionTree()"/>
								<input type="hidden" id="sysPermissionCustom_parentid" name="sysPermissionCustom.parentid" value="${sysPermissionCustom.parentid}" />
								<div id="permissionTreeContent"
									class="zTreeDemoBackground left ztree_customcss">
									<ul id="permissionTree" class="ztree"></ul>
								</div>
								</TD>
								<TD height=30 width="15%" align=right >排序号：</TD>
								<TD class=category width="35%">
								<input type="text" id="sysPermissionCustom_showorder" name="sysPermissionCustom.showorder" value="${sysPermissionCustom.showorder}"/>
								</TD>

							</TR>
							
							<TR>
							    <TD height=30 width="15%" align=right >url：</TD>
								<TD class=category width="35%" colspan=3>
								<input type="text" name="sysPermissionCustom.url" value="${sysPermissionCustom.url}" style="width:550px"/>
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="15%" align=right >是否菜单：</TD>
								<TD class=category width="35%">
								是<input type="radio" name="sysPermissionCustom.ismenu" value="1" <c:if test="${sysPermissionCustom.ismenu== '1'}">checked</c:if>/>
								否<input type="radio" name="sysPermissionCustom.ismenu" value="0" <c:if test="${sysPermissionCustom.ismenu== '0'}">checked</c:if>/>
								</TD>
								<TD height=30 width="15%" align=right >是否可用：</TD>
								<TD class=category width="35%">
								是<input type="radio" name="sysPermissionCustom.isused" value="1" <c:if test="${sysPermissionCustom.isused== '1'}">checked</c:if>/>
								否<input type="radio" name="sysPermissionCustom.isused" value="0" <c:if test="${sysPermissionCustom.isused== '0'}">checked</c:if>/>
								</TD>

							</TR>
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="sysPermissionsave()">提交</a>
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


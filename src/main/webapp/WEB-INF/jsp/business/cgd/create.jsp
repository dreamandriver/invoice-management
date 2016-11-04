<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>采购单创建</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">

//采购单保存
function yycgdsave(){
	jquerySubByFId('yycgdsaveForm', yycgdsave_callback, null);
}
/**
 * 采购单保存回调
 */
function yycgdsave_callback(data) {
	_alert(data.resultInfo);
	
	//获取新添加的采购单的id
	
	//alert(data.resultInfo.sysdata.yycgdid);
	//在这里必须拿新添加的 采购单的id
	 if(data.resultInfo.type==TYPE_RESULT_SUCCESS){//如果成功跳转至修改页面
		//alert(result.sysdata.yycgdid);
		var yycgdid=data.resultInfo.sysdata.yycgdid;
		window.location='${baseurl}/cgd/edit.action?yycgdCustom.id='+yycgdid;
	} 
	 
}

</script>
</HEAD>
<BODY>

<form id="yycgdsaveForm" name="yycgdsaveForm" action="${baseurl}/cgd/createsubmit.action" method="post">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="70%" bgColor=#c4d8ed align=center>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;药品采购单</TD>
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
							    
								<TD height=30 width="15%" align=right>采购单号：</TD>
								<TD class=category width="35%">
								${yycgdCustom.id}
								<input type="hidden" name="yycgdCustom.id" value="${yycgdCustom.id}"/>
								</TD>
								<TD height=30 width="15%" align=right >采购单名称：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="yycgd_mc" name="yycgdCustom.mc" value=""  style="width:260px" />
								</div>
								<div id="yycgd_mcTip"></div>
								</TD>
							</TR>
							<TR>
							   <TD height=30 width="15%" align=right >建单时间：</TD>
								<TD class=category width="35%">
									
								</TD>
								<TD height=30 width="15%" align=right >提交时间：</TD>
								<TD class=category width="35%">
								
								</TD>
								
							</TR>
							<TR>
								<TD height=30 width="15%" align=right>联系人：</TD>
								<TD class=category width="35%">
								<input type="text" name="yycgdCustom.lxr" id="yycgdCustom.lxr"  style="width:260px" />
								</TD>
								<TD height=30 width="15%" align=right >联系电话：</TD>
								<TD class=category width="35%">
								<input type="text" name="yycgdCustom.lxdh" id="yycgdCustom.lxdh" style="width:260px" />
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right>采购单状态：</TD>
								<TD class=category width="35%">
								
								</TD>
								<TD height=30 width="15%" align=right>备注：</TD>
								<TD colspan=3>
									<textarea rows="2" cols="30" name="yycgdCustom.bz"></textarea>
								</TD>
							</TR>
							
							<TR>
								<TD height=30 width="15%" align=right>审核时间：</TD>
								<TD class=category width="35%">
								
								</TD>
								<TD height=30 width="15%" align=right >审核意见：</TD>
								<TD class=category width="35%">
								
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a  href="#" onclick="yycgdsave()" class="easyui-linkbutton" iconCls='icon-save'>保存</a>
								
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


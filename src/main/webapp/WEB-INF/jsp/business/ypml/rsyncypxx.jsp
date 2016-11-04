<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>药品信息同步</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script lang="text/javascript">
$(function(){
	//***********按钮**************
	$('#submitbtn').linkbutton({   
		iconCls: 'icon-ok'  
	});  
	$('#closebtn').linkbutton({   
		iconCls: 'icon-cancel'  
	});
});
//药品同步提交
function rsyncypxxsubmit(){
	jquerySubByFId('rsyncypxxForm',rsyncypxxsubmit_callback,null);
}
function rsyncypxxsubmit_callback(data){
	message_alert(data);
}
</script>

</head>
<body>

<form id="rsyncypxxForm" name="rsyncypxxForm" action="${baseurl}/ypml/ypxx/rsyncypxxsubmit.action" method="post" >
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;药品信息同步</TD>
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
								<TD height=30 align=right>同步说明：</TD>
								<TD >
								1、此操作将从省级医药采购平台同步所有药品信息<br/>
								2、此操作不会影响市平台特有药品
								</TD>
							</TR>
							
							<TR>
								
								<TD colspan=2  align=center class=category>
									<a id="submitbtn" href="#" onclick="rsyncypxxsubmit()">同步</a>
									<!-- <a id="closebtn" href="#" onclick="parent.closemodalwindow()">关闭</a> -->
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</form>
</body>

</html>


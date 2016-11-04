<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>药品信息导入</title>
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
//文件导入提交
function importypxxsubmit(){
	jquerySubByFId('importypxxForm',importypxxsubmit_callback,null);
}
function importypxxsubmit_callback(data){
	message_alert(data);
}
</script>

</head>
<body>
<form id="importypxxForm" name="ypxximportForm" action="${baseurl}/ypml/ypxx/importypxxsubmit.action" method="post" enctype="multipart/form-data">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;药品信息导入</TD>
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
								<TD height=30 align=right>导入说明：</TD>
								<TD >
								1、导入文件为Excel 97-2003版本，文件扩展名为.xls，如果使用高版本的Excel请另存为Excel 97-2003版本。
								<br>2、点击 <a class="blue" href="${baseurl}/template/ypxx_template.xls"><u>药品信息模板</u></a> 下载，并按照说明录入药品信息。
								<br>3、导入文件内容填写完毕请在下方选择导入文件，点击 导入按钮。
								</TD>
							</TR>
							<TR>
								<TD height=30 align=right>选择导入文件</TD>
								<TD class=category>
								<input type="file" name="ypxximportfile" />					
								</TD>
							</TR>
							<TR>
								
								<TD colspan=2  align=center class=category>
									<a id="submitbtn" href="#" onclick="importypxxsubmit()">导入</a>
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


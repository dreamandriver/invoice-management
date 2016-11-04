<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>药品目录导出</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">
//药品信息导出
function ypxxexport(){
	//调用ajax Form提交
	jquerySubByFId('ypxxlistFrom',ypxxExprot_callback,null,"json");
	
}
function ypxxExprot_callback(data){
	
	//在这里提示信息中有文件下载链接
	message_alert(data);
	
}
</script>

</head>
<body>
<!-- 导出条件 -->

<form id="ypxxlistFrom" name="ypxxlistFrom" action="${baseurl}/ypml/ypxx/exportypxxsubmit.action" method="post">
<TABLE  class="table_search">
				<TBODY>
					<TR>
						<TD class="left">流水号：</TD>
						<td ><INPUT type="text" name="ypxxCustom.bm" /></td>
						<TD class="left">通用名：</td>
						<td><INPUT type="text"  name="ypxxCustom.mc" /></TD>
						
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
					</TR>
					<tr>
					  <td colspan="12" style="text-align:center"><a id="btn" href="#" onclick="ypxxexport()" class="easyui-linkbutton" iconCls='icon-search'>导出</a></td>
					</tr>
				</TBODY>
			</TABLE>
			
</form>


</body>
</html>
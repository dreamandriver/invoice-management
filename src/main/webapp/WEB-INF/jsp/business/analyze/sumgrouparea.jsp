<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>按区域统计</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">
//查询方法
function query(){
	//根据查询条件进行统计，执行form提交
	
	document.businesslistForm.submit();
}

</script>

</HEAD>
<BODY>
    <form id="businesslistForm" name="businesslistForm" method="post" action="${baseurl }/analyze/sumgrouparea.action">
			<TABLE  class="table_search">
				<TBODY>
					
					<TR>
					   <TD class="left">统计开始时间：</TD>
						<td >
						 <INPUT id="yybuinessCustom.startDate"
							name="yybuinessCustom.startDate" 
							 onfocus="WdatePicker({isShowWeek:false,skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" style="width:80px"/>
						</td>
					   <TD class="left">统计截止时间：</td>
					    <td>
					     <INPUT id="yybuinessCustom.endDate" 
							name="yybuinessCustom.endDate"
							 onfocus="WdatePicker({isShowWeek:false,skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" style="width:80px"/>
						<a id="btn" href="#" onclick="query()" class="easyui-linkbutton" iconCls='icon-search'>统计</a>
						 </TD>
						
						
					</tr>
					
					
				</TBODY>
			</TABLE>
	   
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
						<!-- jfreechart图形 -->
						<img src="${baseurl }/jfreechart?filename=${jfreechart_filename }"  border=0 />
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		 </form>

</BODY>
</HTML>


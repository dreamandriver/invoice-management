<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

		<script type="text/javascript">
		
	$(function (){
		//***********按钮**************
		$('#submitbtn').linkbutton({   
    		iconCls: 'icon-ok'  
		});  
		$('#closebtn').linkbutton({   
    		iconCls: 'icon-cancel'  
		});
		
		var incomedate = {
				  elem: '#check_incomedatestr',
				  format: 'YYYY/MM/DD',
				  min: '2001-06-16', //设定最小日期为当前日期
				  max: '2099-06-16', //最大日期
				  istime: false,
				  istoday: false,
				  choose: function(datas){
					  paydate.min = datas; //开始日选好后，重置结束日的最小日期
					  paydate.start = datas //将结束日的初始值设定为开始日
				  }
				};
		var paydate = {
				  elem: '#check_paydatestr',
				  format: 'YYYY/MM/DD',
				  min: '2001-06-16',
				  max: '2099-06-16',
				  istime: false,
				  istoday: false,
				  choose: function(datas){
					  incomedate.max = datas; //结束日选好后，重置开始日的最大日期
				  }
				};
				laydate(incomedate);
				laydate(paydate);
				
		//**********表单校验*************
		$.formValidator.initConfig({
			formID : "checkaddform",
			theme : "Default",
			onError : function(msg, obj, errorlist) {
				//alert(msg);
			}
		});
		//客户名称
		$("#check_checkno").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			max : 20,
			onError : "请输入发票号"
		});
		//金额
		$("#check_incomeamount").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"num",dataType:"enum",onError:"金额式不正确"});
		
		$("#check_payamount").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"num",dataType:"enum",onError:"金额式不正确"});
		
		$("#check_other").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"num",dataType:"enum",onError:"金额式不正确"});
		
		$("#check_taxpoint").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"num",dataType:"enum",onError:"金额式不正确"});
		
		
		//日期
		$("#check_incomedatestr").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		});
		$("#check_paydatestr").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		});
		//公司名称
		$("#check_company").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请填写公司名称"
		});
		
	});
	function checksave(){
		if($.formValidator.pageIsValid()){
			jquerySubByFId('checkaddform',checksave_callback,null,"json");
		}

	}
	function checksave_callback(data){
		//var result = getCallbackData(data);
		var type = data.type;
		if (TYPE_RESULT_SUCCESS == type) {
			parent.checkquery();
			parent.closemodalwindow();
		}else{
			_alert(data);
		}
	}
	
	</script>
 </HEAD>
<BODY>
<form id="checkaddform" name="checkaddform" action="${baseurl}/management/check/update" method="post">
<input type="hidden" name="check.contractserialno" value="${check.contractserialno}"/>
<input type="hidden" name="check.contractno" value="${check.contractno}"/>
<input type="hidden" name="check.consumer" value="${check.consumer}" />
<input type="hidden" name="check.serialno" value="${check.serialno}" />
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;内容</TD>
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
								<TD height=30 width="15%" align=right >合同号：</TD>
								<TD class=category width="35%">
								<div>
									${check.contractno}
								</div>
								
								</TD>
								<TD height=30 width="15%" align=right >客户名称：</TD>
								<TD class=category width="35%">
								<div>
									${check.consumer}
								</div>
								</TD>

							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >支票号：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="check_checkno" name="check.checkno" value="${check.checkno}"/>
								</div>
								
								<div id="check_checknoTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >税点(%)：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="check_taxpoint" name="check.taxpoint" value="${check.taxpoint}"/>
								</div>
								<div id="check_taxpointTip"></div>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right >收入金额：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="check_incomeamount" name="check.incomeamount" value="${check.incomeamount}"   />
								</div>
								<div id="check_incomeamountTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >收入日期：</TD>
								<TD class=category width="35%">
								<div>
									<input class="laydate-icon" id="check_incomedatestr" name="check.incomedate" value=<fmt:formatDate value='${check.incomedate}' pattern='yyyy/MM/dd' /> style="width:150px;">
								</div>
								<div id="check_incomedatestrTip"></div>
								</TD>
							</TR>
							
							<TR>
								<TD height=30 width="15%" align=right >支出金额：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="check_payamount" name="check.payamount" value="${check.payamount}"   />
								</div>
								<div id="check_payamountTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >支出日期：</TD>
								<TD class=category width="35%">
								<div>
									<input class="laydate-icon" id="check_paydatestr" name="check.paydate" value=<fmt:formatDate value='${check.paydate}' pattern='yyyy/MM/dd' /> style="width:150px;">
								</div>
								
								<div id="check_paydatestrTip"></div>
								</TD>
							</TR>
							<TR >
							    <TD height=30 width="15%" align=right >其他费用：</TD>
								<TD class=category width="75%" colspan="3" >
								<div>
								<input type="text" id="check_other" name="check.other" value="${check.other}" style=" width: 640px;"/>
								</div>
								<div id="check_otherTip"></div>
								</TD>
							</TR>
							<TR >
							    <TD height=30 width="15%" align=right >单位名称：</TD>
								<TD class=category width="75%" colspan="3" >
								<div>
								<input type="text" id="check_company" name="check.company" value="${check.company}" style=" width: 640px;"/>
								</div>
								<div id="check_companyTip"></div>
								</TD>
							</TR>
							
							<TR >
							    <TD height=30 width="15%" align=right >备注：</TD>
								<TD class=category width="75%" colspan="3" >
								<input type="text" name="check.comment" value="${check.comment}" style=" width: 640px;"/>
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="checksave()">提交</a>
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


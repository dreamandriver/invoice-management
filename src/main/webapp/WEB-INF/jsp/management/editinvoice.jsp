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
		
	$(function (){
		//***********按钮**************
		$('#submitbtn').linkbutton({   
    		iconCls: 'icon-ok'  
		});  
		$('#closebtn').linkbutton({   
    		iconCls: 'icon-cancel'  
		});
		
		var paydate = {
				  elem: '#invoice_createdate',
				  format: 'YYYY/MM/DD',
				  min: '2001-06-16',
				  max: '2099-06-16',
				  istime: false,
				  istoday: false,
				};
		laydate(paydate);
				
		
		//**********表单校验*************
		$.formValidator.initConfig({
			formID : "invoiceaddform",
			theme : "Default",
			onError : function(msg, obj, errorlist) {
				//alert(msg);
			}
		});
		//客户名称
		$("#invoice_invoiceno").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			max : 20,
			onError : "请输入发票号"
		});
		//发票金额
		$("#invoice_amount").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"decmal4",dataType:"enum",onError:"金额式不正确"});
		//公司名称
		$("#invoice_company").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请填写公司名称"
		});
		
		
		$("#invoice_taxpoint").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"num",dataType:"enum",onError:"税点格式不正确"});
		
	});
	function invoiceedit(){
		if($.formValidator.pageIsValid()){
			jquerySubByFId('invoiceaddform',invoiceedit_callback,null,"json");
		}

	}
	function invoiceedit_callback(data){
		//var result = getCallbackData(data);
		var type = data.type;
		if (TYPE_RESULT_SUCCESS == type) {
			parent.invoicequery();
			parent.closemodalwindow();
		}else{
			_alert(data);
		}
	}
	
	</script>
 </HEAD>
<BODY>
<form id="invoiceaddform" name="invoiceaddform" action="${baseurl}/management/invoice/update" method="post">
<input type="hidden" name="invoice.serialno" value="${invoice.serialno}"/>
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
									${contract.contractno}
								</div>
								
								</TD>
								<TD height=30 width="15%" align=right >客户名称：</TD>
								<TD class=category width="35%">
								<div>
									${contract.consumer}
								</div>
								</TD>

							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >发票号：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="invoice_invoiceno" name="invoice.invoiceno" value="${invoice.invoiceno}"/>
								</div>
								<div id="invoice_invoicenoTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >发票类型：</TD>
								<TD class=category width="35%">
								<div>
									<input type="radio" name="invoice.invoicetype" value="0" <c:if test="${invoice.invoicetype=='0'}">checked="checked"</c:if> />普通发票  &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="invoice.invoicetype" value="1" <c:if test="${invoice.invoicetype=='1'}">checked="checked"</c:if> />专业发票
								</div>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right >发票状态：</TD>
								<TD class=category width="35%">
								<div>
									<input type="radio" name="invoice.status" value="0" <c:if test="${invoice.status=='0'}">checked="checked"</c:if> />正常  &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="invoice.status" value="1" <c:if test="${invoice.status=='1'}">checked="checked"</c:if> />作废  &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="invoice.status" value="2" <c:if test="${invoice.status=='2'}">checked="checked"</c:if> />退票
								</div>
								</TD>
								<TD height=30 width="15%" align=right >金额：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="invoice_amount" name="invoice.amount" value="<fmt:formatNumber value='${invoice.amount}' pattern='0.00'/>"/>
								</div>
								<div id="invoice_amountTip"></div>
								</TD>
							</TR>
							
							<TR >
							    <TD height=30 width="15%" align=right >开票日期：</TD>
								<TD class=category width="35%" >
								<div>
									<input class="laydate-icon" id="invoice_createdate" name="invoice.createdate" value="<fmt:formatDate value='${invoice.createdate}' pattern='yyyy/MM/dd' />" style="width:150px;">
								</div>
								<div id="invoice_createdateTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >税点(%)：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="invoice_taxpoint" name="invoice.taxpoint" value="${invoice.taxpoint}"/>
								</div>
								<div id="invoice_taxpointTip"></div>
								</TD>
							</TR>
							<TR >
							    <TD height=30 width="15%" align=right >单位名称：</TD>
								<TD class=category width="75%" colspan="3">
								<div>
								<input type="text" id="invoice_company" name="invoice.company" value="${invoice.company}" style=" width: 640px;"/>
								</div>
								<div id="invoice_companyTip"></div>
								</TD>
							</TR>
							<TR >
							    <TD height=30 width="15%" align=right >备注：</TD>
								<TD class=category width="75%" colspan="3" >
								<input type="text" name="invoice.comment" value="${invoice.comment}" style=" width: 640px;"/>
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="invoiceedit()">保存</a>
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


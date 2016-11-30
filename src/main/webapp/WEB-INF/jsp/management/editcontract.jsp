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
		//**********表单校验*************
		$.formValidator.initConfig({
			formID : "contracteditform",
			theme : "Default",
			onError : function(msg, obj, errorlist) {
				//alert(msg);
			}
		});
		//客户名称
		$("#contract_consumer").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			max : 20,
			onError : "请输入客户名称(最长10个字符)"
		});
		//合同金额
		$("#contract_amount").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).regexValidator({regExp:"decmal4",dataType:"enum",onError:"金额式不正确"});
		//公司名称
		$("#contract_company").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请填写公司名称"
		});
		
	});
	function contractedit(){
		if($.formValidator.pageIsValid()){
			jquerySubByFId('contracteditform',contractedit_callback,null,"json");
		}

	}
	function contractedit_callback(data){
		//var result = getCallbackData(data);
		var type = data.type;
		if (TYPE_RESULT_SUCCESS == type) {
			parent.contractQuery();
			parent.closemodalwindow();
		}else{
			_alert(data);
		}
	}
	
	var selectConsumer = function (){
		var sendUrl = "${baseurl}/management/contract/toadd";
		createmodalwindow("创建合同", 800, 300, sendUrl);
		/* var ajaxOption = new AjaxOption();
				ajaxOption._initPostRequest(true,sendUrl,"json","html");
				_ajaxPostRequest(ajaxOption, '', ypxximport_callback); */
	};
	
	</script>
 </HEAD>
<BODY>
<form id="contracteditform" name="contracteditform" action="${baseurl}/management/contract/update" method="post">
<input type="hidden" name="contract.serialno" value="${contract.serialno}"/>
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
								<TD height=30 width="15%" align=right >客户名称：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="contract_consumer" name="contract.consumer" value="${contract.consumer}" />
								</div>
								<div id="contract_consumerTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >合同号：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="contract_contractNo" name="contract.contractno" value="${contract.contractno}"   />
								</div>
								<div id="contract_contractNoTip"></div>
								</TD>
							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >单位名称：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="contract_company" name="contract.company" value="${contract.company}"/>
								</div>
								<div id="contract_companyTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >金额：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="contract_amount" name="contract.amount" value="${contract.amount}"   />
								</div>
								<div id="contract_amountTip"></div>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right >是否正式合同：</TD>
								<TD class=category width="35%" >
								<div>
									<input type="radio" name="contract.ifformal" value="1" <c:if test="${contract.ifformal=='1'}">checked="checked"</c:if> />是  &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="contract.ifformal" value="0" <c:if test="${contract.ifformal=='0'}">checked="checked"</c:if> />否
								</div>
								<div id="contract_companyTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >创建日期：</TD>
								<TD class=category width="35%">
								<div>
									${contract.createdatestr}
								</div>
								</TD>
							</TR>
							
							<TR >
							    <TD height=30 width="15%" align=right >备注：</TD>
								<TD class=category width="75%" colspan="3" >
								<input type="text" name="contract.comment" value="${contract.comment}" style=" width: 640px;"/>
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="contractedit()">保存</a>
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


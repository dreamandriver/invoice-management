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
			formID : "useraddform",
			theme : "Default",
			onError : function(msg, obj, errorlist) {
				//alert(msg);
			}
		});
		//客户名称
		$("#user_userid").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请输入用户名称"
		});
		//合同金额
		$("#user_username").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请填写用户姓名"
		});
		//公司名称
		$("#user_password").formValidator({
			onShow : "",
			onCorrect:"&nbsp;"
		}).inputValidator({
			min : 1,
			onError : "请填写密码"
		});
		
	});
	function usersave(){
		if($.formValidator.pageIsValid()){
			jquerySubByFId('useraddform',usersave_callback,null,"json");
		}

	}
	function usersave_callback(data){
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
<form id="useraddform" name="useraddform" action="${baseurl}/sys/user/add" method="post">
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
								<TD height=30 width="15%" align=right >用户ID：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="user_userid" name="user.userid" value="${user.userid}" />
								</div>
								<div id="user_useridTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >用户姓名：</TD>
								<TD class=category width="35%">
								<div>
								<input type="text" id="user_username" name="user.username" value="${user.username}"   />
								</div>
								<div id="user_usernameTip"></div>
								</TD>
							</TR>
							
							
							<TR>
								<TD height=30 width="15%" align=right >用户密码：</TD>
								<TD class=category width="35%">
								<div>
									<input type="text" id="user_password" name="user.password" value="${user.password}"/>
								</div>
								<div id="user_passwordTip"></div>
								</TD>
								<TD height=30 width="15%" align=right >是否有权限：</TD>
								<TD class=category width="35%">
								<div>
									<input type="radio" name = "user.permission" value ="admin"> 有 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name = "user.permission" value ="" checked="checked"> 无
								</div>
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn" href="#" onclick="usersave()">提交</a>
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


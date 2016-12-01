<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
<head>
<title>${test}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<LINK rel="stylesheet" type="text/css"
	href="../../js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<SCRIPT type="text/javascript">
	var _menus;

	$(function() {
		//$.ajax({
		//	//url : '${baseurl}/sysmenu.action',
		//	url:'${baseurl}/menu.json',
		//	type : 'POST',
		//	dataType : 'json',
		//	success : function(data) {
		//		_menus = data;
		//		initMenu(_menus);
		//	},
		//	error : function(msg) {
		//		alert('菜单加载异常!');
		//	}
		//});

		data = {
			"menus" : [ 
			<c:if test="${activeUser.userid == 'admin'}">      
			            {
				"icon" : "icon-sys",
				"menuid" : "1",
				"menuname" : "系统管理",
				"url" : "",
				"menus" : [ {
					"icon" : "icon-log",
					"menuid" : "1_1",
					"menuname" : "用戶管理",
					"url" : "/sys/user"
				}]
			}, 
			</c:if>
			{
				"icon" : "icon-sys",
				"menuid" : "1",
				"menuname" : "业务管理",
				"url" : "",
				"menus" : [{
					"icon" : "icon-log",
					"menuid" : "1_1",
					"menuname" : "合同管理",
					"url" : "/management/contract"
				}, {
					"icon" : "icon-log",
					"menuid" : "1_1",
					"menuname" : "普通发票管理",
					"url" : "/management/commoninvoice"
				} ,{
					"icon" : "icon-log",
					"menuid" : "1_1",
					"menuname" : "专业发票管理",
					"url" : "/management/specialinvoice"
				} ,{
					"icon" : "icon-log",
					"menuid" : "1_1",
					"menuname" : "支票管理",
					"url" : "/management/check"
				}]
			}]
		};
		_menus = data;
		initMenu(_menus);
		//tabClose();
		//tabCloseEven();

		$('#tabs').tabs('add', {
			title : '欢迎使用',
			content : createFrame('${baseurl}/welcome')
		}).tabs({
			onSelect : function(title) {
				var currTab = $('#tabs').tabs('getTab', title);
				var iframe = $(currTab.panel('options').content);

				var src = iframe.attr('src');
				if (src)
					$('#tabs').tabs('update', {
						tab : currTab,
						options : {
							content : createFrame(src)
						}
					});

			}
		});

		//修改密码
		$('#modifypwd').click(menuclick);

	});

	//退出系统方法
	function logout() {
		_confirm('您确定要退出本系统吗?', null, function() {
			location.href = '${baseurl}/logout';
		})
	}
	
	//显示合同详情
	function showContract(serialNo){
		$('#tabs').tabs('add',{   
		    title:'合同详情',   
		    content:createFrame('${baseurl}/management/contract/detail/' + serialNo),   
		    closable:true
		});  
	}
</SCRIPT>



<META name="GENERATOR" content="MSHTML 9.00.8112.16540">
</HEAD>

<BODY style="overflow-y: hidden;" class="easyui-layout" scroll="no">
	<DIV
		style='background: url("../../../images/layout-browser-hd-bg.gif") repeat-x center 50% rgb(127, 153, 190); height: 30px; color: rgb(255, 255, 255); line-height: 20px; overflow: hidden; font-family: Verdana, 微软雅黑, 黑体;'
		border="false" split="true" region="north">
		<SPAN style="padding-right: 20px; float: right;" class="head">
			欢迎当前用户：${activeUser.username}&nbsp;&nbsp;&nbsp; <A
			id="loginOut" href=javascript:logout()>退出系统</A>

		</SPAN> <SPAN style="padding-left: 10px; font-size: 16px;"><IMG
			align="absmiddle" src="../../../images/blocks.gif" width="20"
			height="20"> 发票管理系统</SPAN> <SPAN style="padding-left: 15px;"
			id="News"></SPAN>
	</DIV>

	<DIV style="background: rgb(210, 224, 242); height: 30px;"
		split="false" region="south">

		<DIV class="footer">
			系统版本号：${version_number}&nbsp;&nbsp;&nbsp;发布日期：${version_date}</DIV>
	</DIV>

	<DIV style="width: 180px;" id="west" title="导航菜单" split="true"
		region="west" hide="true">

		<DIV id="nav" class="easyui-accordion" border="false" fit="true">
			<!--  导航内容 -->
		</DIV>
	</DIV>

	<DIV style="background: rgb(238, 238, 238); overflow-y: hidden;"
		id="mainPanle" region="center">
		<DIV id="tabs" class="easyui-tabs" border="false" fit="true"></DIV>
	</DIV>


</BODY>
</HTML>

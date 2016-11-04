<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html> 
<head>
<title>采购单修改</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript">
//采购单保存
function yycgdsave(){
	//由form被多个功能公用，每次操作设置form的url
	$("#yycgdsaveForm").attr("action","${baseurl}/cgd/editsubmit.action");
	jquerySubByFId('yycgdsaveForm', yycgdsave_callback, null);
}

function yycgdsave_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
}



//采购单提交
function yycgdsubmit(){
	_confirm('提交后采购单将不允许修改，是否继续?',null,
			  function(){
		$("#yycgdsaveForm").attr("action","${baseurl}/cgd/submit.action");
		jquerySubByFId('yycgdsaveForm', yycgdsubmit_callback, null);
	 }
   );
	
}
//采购单提交回调
function yycgdsubmit_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	//提交成功再刷新本页面
	if(result.type==TYPE_RESULT_SUCCESS){
		window.location="${baseurl}/cgd/edit.action?yycgdCustom.id=${yycgdCustom.id}";
	}
	
}

//采购单明细列表的工具栏
//采购药品添加
function yycgdmxaddshow(){
	var sendUrl="${baseurl}/cgd/addyycgmx_ypxxlist.action?yycgdCustom.id=${yycgdCustom.id}";
	createmodalwindow("采购药品添加", 1124, 500, sendUrl);
}
//采购药品删除
function yycgdmxdelete(){
	_confirm('您确定要删除选择的采购药品吗?',null,
			  function(){
						
				var indexs = [];//选择记录的序号
				var rows = $('#yycgdmxlist').datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=$('#yycgdmxlist').datagrid('getRowIndex',rows[i]);
					indexs.push(index);
				}
				if(rows.length>0){
					$("#indexs").val(indexs.join(','));
					//由于删除和保存对同一个form进行操作，所以这里给yycgdmxForm的action重新赋值
					$("#yycgdmxForm").attr("action",'${baseurl}/cgd/delyycgdmxdel.action');
					jquerySubByFId('yycgdmxForm', yycgdmxdelete_callback, null);
				}else{
					alert_warn("请选择要删除的采购药品");
				}
			  }
			)
}
function yycgdmxdelete_callback(data) {
	var result = getCallbackData(data);
	_alert(result);
	yycgdmxquery();
}
//保存采购药品信息
function yycgdmxsave(){
	_confirm('您确定要保存选择的采购药品吗?',null,
			  function(){
						
				var indexs = [];//选择记录的序号
				var rows = $('#yycgdmxlist').datagrid('getSelections');
				for(var i=0;i<rows.length;i++){
					var index=$('#yycgdmxlist').datagrid('getRowIndex',rows[i]);
					indexs.push(index);
				}
				if(rows.length>0){
					$("#indexs").val(indexs.join(','));
					//由于保存和删除对同一个form进行操作，所以这里给yycgdmxForm的action重新赋值
					$("#yycgdmxForm").attr("action",'${baseurl}/cgd/saveyycgdmxsubmit.action');
					jquerySubByFId('yycgdmxForm',yycgdmxsave_callback, null);
				}else{
					alert_warn("请选择要保存的采购药品");
				}
			  }
			)
}
function yycgdmxsave_callback(data){
	var result = getCallbackData(data);
	_alert(result);
	yycgdmxquery();
}
var toolbar=[];
//如果采购单未提交或审核不通过显示此下操作按钮
<c:if test="${yycgdCustom.dictinfoByZt.dictcode=='1' || yycgdCustom.dictinfoByZt.dictcode=='4'}">
toolbar = [{
	id : 'yycgdmxaddshow',
	text : '采购药品添加',
	iconCls : 'icon-add',
	handler : yycgdmxaddshow
	}
	,{
		id : 'yycgdmxdelete',
		text : '采购药品删除',
		iconCls : 'icon-add',
		handler : yycgdmxdelete
	}
	,{
		id : 'yycgdmxsave',
		text : '保存采购药品信息',
		iconCls : 'icon-add',
		handler : yycgdmxsave
	}
	];
</c:if>
//采购单明细列表的列定义

var columns = [ [{
	checkbox:true
},{
	field : 'id',
	hidden : true,
	formatter: function(value,row,index){
		if(value){
			return '<input type="hidden" name="yycgdmxs['+index+'].ypxxid" value="'+row.ypxx.id+'" />';
		}
		
	}
},{
	field : 'bm',
	title : '流水号',
	width : 50,
	formatter: function(value,row,index){
		return row.ypxx.bm;
	}
	
},{
	field : 'mc',
	title : '通用名',
	width : 100,
	formatter: function(value,row,index){
		return row.ypxx.mc;
	}
},{
	field : 'jx',
	title : '剂型',
	width : 70,
	formatter: function(value,row,index){
		return row.ypxx.jx;
	}
},{
	field : 'gg',
	title : '规格',
	width : 70,
	formatter: function(value,row,index){
		return row.ypxx.gg;
	}
},{
	field : 'zhxs',
	title : '转换系数',
	width : 50,
	formatter: function(value,row,index){
		return row.ypxx.zhxs;
	}
},{
	field : 'zbjg',
	title : '中标价',
	width : 50,
	formatter: function(value,row,index){
		return row.ypxx.zbjg;
	}
},{
	field : 'jyztmc',
	title : '交易状态',
	width : 50,
	formatter: function(value,row,index){
		return row.ypxx.dictinfoByJyzt.info;
	}
},{
	field : 'jyjg',
	title : '交易价',
	width : 50,
	formatter:function(value,row,index){
		if(row.id){
			return '<input type="text" name="yycgdmxs['+index+'].jyjg" value="'+(value?value:row.zbjg)+'" />';
		}
		   
	}
},{
	field : 'cgl',
	title : '采购量',
	width : 50,
	formatter:function(value,row,index){
		if(row.id){
			return '<input type="text" name="yycgdmxs['+index+'].cgl" value="'+(value?value:"")+'" />';
		}else{
			return value;
		}
		   
	}
},{
	field : 'cgje',
	title : '采购金额',
	width : 50
},{
	field : 'cgztmc',
	title : '采购状态',
	width : 80,
	formatter: function(value,row,index){
		return row.dictinfoByCgzt.info;
	}
}]];

//加载datagrid（yycgdmxlist）

	 $(function() {
		$('#yycgdmxlist').datagrid({
			title : '采购药品列表',
			showFooter:true,//是否显示总计行
			striped : true,
			url : '${baseurl}/cgd/yycgdmxlist_result.action',//这里后边带了一个参数，所以form中不需要此参数yycgdid
			 queryParams:{//url的参数，初始加载datagrid时使用的参数
				'yycgdCustom.id':'${yycgdCustom.id}'//yycgdid是参数名称，如果参数名称中间有点，将参数用单引号括起来
			}, 
			idField : 'id',//采购药品明细id
			//frozenColumns : frozenColumns,
			columns : columns,
			pagination : true,
			rownumbers : true,
			showFooter:true,//显示总计
			toolbar : toolbar,
			loadMsg:"",
			pageList:[15,30,50,100]
			} );
	}); 

//采购药品明细查询方法
function yycgdmxquery(){
	var formdata = $("#yycgdmxForm").serializeJson();
	//alert(formdata);
	$('#yycgdmxlist').datagrid('unselectAll');//取所有选中，避免重新load保留选中状态
	$('#yycgdmxlist').datagrid('load', formdata);
}
</script>
</HEAD>
<BODY>
<!-- 采购单主信息保存form -->
<form id="yycgdsaveForm" name="yycgdsaveForm" action="${baseurl}/cgd/editsubmit.action" method="post">
<input type="hidden" name="yycgdCustom.id" value="${yycgdCustom.id}"/>
<input type="hidden" name="taskid" value="${taskid }"/>
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
								<TD height=30 width="15%" align=right>采购单编号：</TD>
								<TD class=category width="35%">
								${yycgdCustom.id}
								</TD>
								<TD height=30 width="15%" align=right >采购单名称：</TD>
								<TD class=category width="35%">
								${yycgdCustom.mc}
								</TD>
							</TR>
							<TR>
							   <TD height=30 width="15%" align=right >建单时间：</TD>
								<TD class=category width="35%">
									<fmt:formatDate value="${yycgdCustom.cjtime}" pattern="yyyy-MM-dd"/>
								</TD>
								<TD height=30 width="15%" align=right >提交时间：</TD>
								<TD class=category width="35%">
								<fmt:formatDate value="${yycgdCustom.tjtime}" pattern="yyyy-MM-dd"/>
								</TD>
								
							</TR>
							<TR>
								<TD height=30 width="15%" align=right>联系人：</TD>
								<TD class=category width="35%">
								<input type="text" name="yycgd.lxr" id="yycgd.lxr" value="${yycgdCustom.lxr}"  style="width:260px" />
								</TD>
								<TD height=30 width="15%" align=right >联系电话：</TD>
								<TD class=category width="35%">
								<input type="text" name="yycgd.lxdh" id="yycgd.lxdh" value="${yycgdCustom.lxdh}"  style="width:260px" />
								</TD>
							</TR>
							<TR>
								<TD height=30 width="15%" align=right>采购单状态：</TD>
								<TD class=category width="35%">
								${yycgdCustom.dictinfoByZt.info}
								</TD>
								<TD height=30 width="15%" align=right>备注：</TD>
								<TD colspan=3>
									<textarea rows="2" cols="30" name="yycgd.bz">${yycgdCustom.bz}</textarea>
								</TD>
							</TR>
							
							<TR>
								<TD height=30 width="15%" align=right>审核时间：</TD>
								<TD class=category width="35%">
								<fmt:formatDate value="${yycgd.shtime}" pattern="yyyy-MM-dd"/>
								</TD>
								<TD height=30 width="15%" align=right >审核意见：</TD>
								<TD class=category width="35%">
								${yycgd.shyj}
								</TD>
							</TR>
							
							<tr>
							  <td colspan=4 align=center class=category>
							  <!-- 采购单状态为1：未提交、或、4：审核不通过显示提交 -->
								<c:if test="${yycgdCustom.dictinfoByZt.dictcode =='1' or yycgdCustom.dictinfoByZt.dictcode=='4'}">
								<a  href="#" onclick="yycgdsave()" class="easyui-linkbutton" iconCls='icon-save'>保存</a>
							    <a  href="#" onclick="yycgdsubmit()" class="easyui-linkbutton" iconCls='icon-save'>提交</a>
							 	</c:if>
							  </td>
							</tr>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</form>

<!-- 采购单明细信息 -->
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
		<TBODY>
			<TR>
				<TD background=images/r_0.gif width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;采购药品列表</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	
	
	<!-- 采购单明细form -->
	<form id="yycgdmxForm" name="yycgdmxForm" method="post" >
	<input type="hidden" name="indexs" id="indexs" />
	<input type="hidden" name="yycgdCustom.id" value="${yycgdCustom.id}"/>
			<TABLE  class="table_search">
				<TBODY>
					<TR>
						
						<TD class="left">通用名：</td>
						<td><INPUT type="text"  name="ypxxCustom.mc" /></TD>
						<TD class="left">剂型：</TD>
						<td ><INPUT type="text" name="ypxxCustom.jx" /></td>
						<TD class="left">规格：</TD>
						<td ><INPUT type="text" name="ypxxCustom.gg" /></td>
						<TD class="left">转换系数：</TD>
						<td ><INPUT type="text" name="ypxxCustom.zhxs" /></td>
					</TR>
					<TR>
						<TD class="left">流水号：</TD>
						<td ><INPUT type="text" name="ypxxCustom.bm" /></td>
						<TD class="left">生产企业：</TD>
						<td ><INPUT type="text" name="ypxxCustom.scqymc" /></td>
						<TD class="left">商品名称：</TD>
						<td ><INPUT type="text" name="ypxxCustom.spmc" /></td>
						 <td class="left">价格范围：</td>
				  		<td>
				      		<INPUT id="ypxxCustom.zbjglower" name="ypxxCustom.zbjglower" style="width:70px"/>
							至
							<INPUT id="ypxxCustom.zbjgupper" name="ypxxCustom.zbjgupper" style="width:70px"/>
							
				 		 </td>
					</tr>
					<tr>
					  
						<TD class="left">药品类别：</TD>
						<td >
							<!-- 药品类别从数据字典中取id作为页面传入action的value -->
							<select id="ypxxCustom.lb" name="ypxxCustom.lb" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${yplbList}" var="value">
									<option value="${value.id}">${value.info}</option>
								</c:forEach>
							</select>
						</td>
						<TD class="left">交易状态：</TD>
						<td >
						    <!-- 交易状态从数据字典中取出dictcode作为页面传入action的value -->
							<select id="ypxxCustom.jyzt" name="ypxxCustom.jyzt" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${jyztList}" var="value">
									<option value="${value.dictcode}">${value.info}</option>
								</c:forEach>
							</select>
							
						</td>
						<TD class="left">采购状态：</TD>
						<td >
						   
							<select id="yycgdCustom.cgzt" name="yycgdCustom.cgzt" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${cgztList}" var="value">
									<option value="${value.dictcode}">${value.info}</option>
								</c:forEach>
							</select>
							
						</td>
				 		<TD class="left">供货状态：</TD>
						<td >
						   
							<select id="gysypmlCustom.control" name="gysypmlCustom.control" style="width:150px">
								<option value="">全部</option>
								<c:forEach items="${ghztList}" var="value">
									<option value="${value.dictcode}">${value.info}</option>
								</c:forEach>
							</select>
							
						</td>

				  		<td colspan=2>
				  		
						<a id="btn" href="#" onclick="yycgdmxquery()" class="easyui-linkbutton" iconCls='icon-search'>查询</a>
				  		</td>
						
					</TR>
					
				</TBODY>
			</TABLE>
	   
	   <!-- datagrid -->
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
			<TBODY>
				<TR>
					<TD>
					<!-- 采购单明细列表 -->
						<table id="yycgdmxlist"></table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</form>



</BODY>
</HTML>


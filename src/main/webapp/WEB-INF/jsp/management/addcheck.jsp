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

<%@ include file="/WEB-INF/jsp/base/common_css1.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js1.jsp"%>

<script type="text/javascript">

	//普票和专票表格初始化
	var columns = [ [
	//{
	//	field : 'id',
	//	title : '',
	//	checkbox:true,
	//	hidden:true
	//},
	//{
	//	field : 'contractno',
	//	title : '合同号',
	//	width : 80,
	//	formatter:function(value, row, index){
	//		if(row.serialno){
	//		    return '<a href=javascript:showcontract(\''+row.contractserialno+'\')>'+value+'</a>'
	//		}
	//	}
	//},{
	//	field : 'consumer',
	//	title : '客户姓名',
	//	width : 80
	//},
	//{
	//	field : 'invoiceno',
	//	title : '发票号',
	//	width : 150
	//},
	{
		field : 'zuofei',
		title : '作废',
		width : 100,
		formatter:function(value, row, index){
			if(row.serialno){
				if(row.status == 1){
					return row.amount;
				}else{
					return "--";
				}
			}else{
				return row.zuofei;
			}		
		}
	},{
		field : 'amount',
		title : '金额',
		width : 100,
		formatter:function(value, row, index){
			if(row.serialno){
				if(row.status == 0){
					return row.amount;
				}else if(row.status == 2){
					return "<font color='red'>-"+row.amount+"</font>";
				}else{
					return "--";
				}
			}else{
				return row.amount;
			}
		}
	},{
		field : 'taxpoint',
		title : '扣税税点',
		width : 100
	},{
		field : 'taxamount',
		title : '扣税金额',
		width : 100
	},{
		field : 'company',
		title : '单位名称',
		width : 180
	},{
		field : 'createdatestr',
		title : '开票日期',
		width : 120
	},{
		field : 'comment',
		title : '备注',
		width : 180
	}
	
	]];
		
	//初始化方法
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
		}).regexValidator({regExp:"num",dataType:"enum",onError:"税点格式不正确"});
		
		
		//日期
		$("#check_incomedatestr").formValidator({
			onShow : "${createDate}",
			onCorrect:"&nbsp;"
		});
		$("#check_paydatestr").formValidator({
			onShow : "${createDate}",
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
		
		//发票列表初始化
		$('#invoicelist').datagrid({   
			title : '发票列表',
			nowrap : true,
			striped : true,
			//collapsible : true,
			//sortName : 'code',
			//sortOrder : 'desc',
			//remoteSort : false,
			idField : 'serialno',
			//frozenColumns : frozenColumns,
			fitColumns: true,
			showFooter:true,
			pagination : true,
			rownumbers : true,
			toolbar : toolbar,
			loadMsg:"",
			pageSize:30,
			pageList:[15,30,50,100],
		    url:'/management/invoice/searchd/${contract.contractno}',   
		  	frozenColumns:[[
                {
                	field : 'serialno',
                	checkbox:true
               	},
                {
            		field : 'invoiceno',
            		title : '发票号',
            		width : 100
            	}
			]],
		    columns:columns,
			rowStyler:function(index,row,css){
				if (row.finish == 1){
					return 'background-color:#6293BB;color:#fff;font-weight:bold;width:auto;';
				}else if(row.finish == 2){
					return 'background-color:#E21616;color:#fff;font-weight:bold;width:auto;';
				}else if(row.finish == 3){
					return 'background-color:#68c942;color:#fff;font-weight:bold;width:auto;';
				}else{
					return 'width:auto;';
				}
			},
			onClickRow : function(index, field, value) {
				$('#invoicelist').datagrid('unselectRow', index);
			}
		}); 

	});
	function checksave(){
		if($.formValidator.pageIsValid()){
			var ids = [];
			var rows = $('#invoicelist').datagrid('getSelections');
			for(var i=0; i<rows.length; i++){
				ids.push(rows[i].serialno);
			}
			$('#invoiceids').val(ids.join(','));
			//alert("rows.length=" + rows.length + "; rows=" + rows + "; ids=" + ids.join(',') + "; val=" + $('#invoiceids').val());
			jquerySubByFId('checkaddform',checksave_callback,null,"json");
		}

	}
	function checksave_callback(data){
		//var result = getCallbackData(data);
		var type = data.type;
		if (TYPE_RESULT_SUCCESS == type) {
			parent.contractQuery();
			parent.closemodalwindow();
		}else{
			_alert(data);
		}
	}
	
	</script>
 </HEAD>
<BODY>
<form id="checkaddform" name="checkaddform" action="${baseurl}/management/check/add" method="post">
<input type="hidden" name="check.contractserialno" value="${contract.serialno}"/>
<input type="hidden" name="check.contractno" value="${contract.contractno}"/>
<input type="hidden" name="check.consumer" value="${contract.consumer}" />
<input type="hidden" name="invoiceids" id="invoiceids" value="" />
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
									<input class="laydate-icon" id="check_incomedatestr" name="check.incomedate" value="${createDate}" style="width:150px;">
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
									<input class="laydate-icon" id="check_paydatestr" name="check.paydate" value="${createDate}" style="width:150px;">
								</div>
								<div id="check_paydatestrTip"></div>
								</TD>
							</TR>
							
							<TR >
							    <TD height=30 width="15%" align=right >其他费用：</TD>
								<TD class=category width="75%" colspan="3" >
								<div>
								<input type="text" id="check_other" name="check.other" value="0.00" style=" width: 640px;"/>
								</div>
								<div id="check_otherTip"></div>
								</TD>
							</TR>
							<TR >
							    <TD height=30 width="15%" align=right >单位名称：</TD>
								<TD class=category width="75%" colspan="3" >
								<div>
								<input type="text" id="check_company" name="check.company" value="${contract.company}" style=" width: 640px;"/>
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
								<div id="commoninvoicequery_div">
									<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%"
										align=center>
										<TBODY>
											<TR>
												<TD>
													<table id="invoicelist"></table>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</div>
							</tr>
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


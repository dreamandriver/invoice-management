<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zTree test</title>
<link rel="stylesheet"
	href="${baseurl}/js/zTree_v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<%@ include file="/WEB-INF/jsp/base/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>

<script type="text/javascript"
	src="${baseurl}/js/zTree_v3/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${baseurl}/js/zTree_v3/jquery.ztree.excheck-3.5.js"></script>

<script type="text/javascript">
<!--
	var zNodes = [ {
		"areaid" : "1.",
		"areaname" : "XX市",
		"arealevel" : 1,
		"areafullname" : null,
		"parentid" : "0",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : "20140423184716",
		"yzcode" : null,
		"vchar1" : "1.",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "0",
		"id" : "1.",
		"name" : "XX市",
		"isParent" : "true"
	}, {
		"areaid" : "1.1.",
		"areaname" : "崔庙镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "cmz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.1.",
		"name" : "崔庙镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.10.",
		"areaname" : "汜水镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "ssz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.10.",
		"name" : "汜水镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.11.",
		"areaname" : "高山镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "gsz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.11.",
		"name" : "高山镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.12.",
		"areaname" : "城关乡",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "cgx",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.12.",
		"name" : "城关乡",
		"isParent" : "false"
	}, {
		"areaid" : "1.13.",
		"areaname" : "刘河镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "lhz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.13.",
		"name" : "刘河镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.14.",
		"areaname" : "环翠峪",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "hcy",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.14.",
		"name" : "环翠峪",
		"isParent" : "false"
	}, {
		"areaid" : "1.15.",
		"areaname" : "贾峪镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "jyz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.15.",
		"name" : "贾峪镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.2.",
		"areaname" : "豫龙镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "ylz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.2.",
		"name" : "豫龙镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.3.",
		"areaname" : "索河",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "sh",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.3.",
		"name" : "索河",
		"isParent" : "false"
	}, {
		"areaid" : "1.4.",
		"areaname" : "京城",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "jc",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.4.",
		"name" : "京城",
		"isParent" : "false"
	}, {
		"areaid" : "1.5.",
		"areaname" : "乔楼镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "qlz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.5.",
		"name" : "乔楼镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.6.",
		"areaname" : "广武镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "gwz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.6.",
		"name" : "广武镇",
		"isParent" : "false"
	}, {
		"areaid" : "1.7.",
		"areaname" : "高村乡",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "gcx",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.7.",
		"name" : "高村乡",
		"isParent" : "false"
	}, {
		"areaid" : "1.8.",
		"areaname" : "金寨乡",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "jzx",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.8.",
		"name" : "金寨乡",
		"isParent" : "false"
	}, {
		"areaid" : "1.9.",
		"areaname" : "王村镇",
		"arealevel" : 2,
		"areafullname" : null,
		"parentid" : "1.",
		"shortname" : null,
		"isunit" : null,
		"lastupdate" : null,
		"yzcode" : null,
		"vchar1" : "wcz",
		"vchar2" : null,
		"vchar3" : null,
		"vchar4" : null,
		"vchar5" : null,
		"vchar6" : null,
		"isleaf" : "1",
		"id" : "1.9.",
		"name" : "王村镇",
		"isParent" : "false"
	} ];

	/* var setting = {
		view : {
			selectedMulti : false
		},
		check : {
			enable : false,
			chkStyle : "checkbox",
			chkboxType : {
				"Y" : "ps",
				"N" : "ps"
			}
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "parentid",
				rootPId : 0
			}
		},
		callback : {
			onClick : null
		}
	}; */
	var setting = {
			view : {
				selectedMulti : false,
				showLine: true
			},
			check : {
				enable : true,
				chkStyle : "checkbox",
				chkboxType : {
					"Y" : "ps",
					"N" : "ps"
				}
			},
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "parentid",
					rootPId : 0
				},
				key: {
					url: "xUrl"
				}
			},
			callback : {
				onClick : null
			}
		};
	var tree;
	function showAreaTree() {
		tree.showMenu();
	}
	$(document).ready(
			function() {
				tree = new createSyncTree("areaTreeContent", "areaTree",
						"usergysghdq", "usergysghdqid", setting, zNodes, null,
						"onCheck", '${usergysghdqid}');
				//展开所有结点
				tree.expandAll();
			});
//-->
</script>

</head>
<body>
	<div>
		<input type="text" id="usergysghdq" value=""
			onclick="showAreaTree()" />
		<input type="text" id="usergysghdqid"
			name="usergysghdqid" value="" />
	</div>
	<!-- <div id="areaTreeContent"
		class="zTreeDemoBackground left ztree_customcss">
		<ul id="areaTree" class="ztree"></ul>
	</div> -->
	<div id="areaTreeContent"
		>
		<ul id="areaTree" class="ztree"></ul>
	</div>
</body>
</html>
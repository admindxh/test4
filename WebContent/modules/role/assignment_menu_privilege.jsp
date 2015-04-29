<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<html>
<head>
    <title>权限选择</title>
    <%@include file="/common/meta.jsp"%>
	<ui:combine widgets="tree,blockui"></ui:combine>
	<ui:script src="/modules/role/script/assignment_menu_privilege.js"></ui:script>
	<script>
		var roleId = '${param.roleId}';
	    var selectedOperationRuleList = []; //已选操作规则的数组
	</script>
</head>
  
<body style="background-color: white;overflow: hidden;" id="itemdetail">
<div class="itemdetail">
	<div style="width:100%;padding-top:6px">
		<table style="width:100%;height:20px;border:1px solid #f4b98e;background:#fefde8;">
			<tr valign="middle">
				<td width="100%" style="padding-left:2px" align="left">
					温馨提示：您现在是给&nbsp;${param.roleName}&nbsp;分配权限
				</td>
			</tr>
		</table>    
	</div>
	
	<table width="100%">
		<tr>
			<td>
				<div style="overflow:hidden;vertical-align: top;border-style: solid;border-width: 1px 1px 1px 1px;border-color: #A8CFEB;" >
					<table width="100%" style="height:90%">
						<tr>
							<td style="width:60%; height:500px;vertical-align: top;border-right:1px solid #A8CFEB;">
								<div class="main" id="treeDiv" style="width:100%;height:100%;overflow: auto;padding-left:3px;vertical-align:top;">
							    </div>
							</td>
							<td valign="top" width="40%">
								<div style="padding-top: 8px;padding-left: 5px;width:100%;">
									<div id="dataEntityId"/>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 页脚区域 -->
				<div class="footbtn" id="divFlyBar" style="position: absolute;padding-bottom: 10px" >
				    <a href="#" class="combtn" onclick="savePrivilege();"><span><img src="${path}/themes/default/form/ico_ok.gif" />保存</span> </a>
					<a href="javascript:void(0);" class="combtn" onclick="$(this).dialogClose();"><span><img src="${path}/themes/default/form/ico_close_win.gif" />关闭</span></a>
				</div> 
			</td>
		</tr>
	</table>
</div>
</body>
</html>

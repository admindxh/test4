<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>角色用户指派</title>
		<%@ include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox,listselectdialog"></ui:combine>
		
		<ui:script src="modules/role/script/list_sec_role_user.js"></ui:script>
		<script type="text/javascript">
			var role_id = '${param.RoleId}';
		</script>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>角色对应的用户列表</h2>
			</div>	
			<div class="panel search-panel">
				<div class="panel-head">
					<div class="row-fluid">
						<div class="span6 first">
							<i class="icon-list-alt"></i>
							查询条件
						</div>
						<div class="span6"></div>
					</div>
					<a href="#" class="toggle"></a>	
				</div>
				<div class="panel-content">
					<div class="toolbar">
					<form id="queryForm" style="margin: 0px;">
						<table>
						    <!--
							<tr>
								<td class="btn-toggle" rowspan="5">									
									<a href="###" data-widget="btn-toggle" data-options="{rel:'.toggle-content2'}"  title="高级选项"><i class="icon-plus2"></i></a>
								</td>
							</tr>
							-->
							<tr>
							    <th>
									登录帐号：
								</th>
								<td>
									<input type="text" maxlength="20" name="LoginId" style="width:110px" id="LoginId" class="input-large"/>
								</td>
								<th>
									用户名称：
								</th>
								<td>
									<input type="text" maxlength="20" name="Name" style="width:110px" id="Name" class="input-large"/>
								</td> 
								<td class="toolbar-btns" rowspan="3">
									<button type="button" class="btn" onclick="role_user_grid.doSearch();">查询</button>
									<button type="button" class="btn"/ onclick="document.forms['queryForm'].reset();">重置</button>
								</td>
							</tr>
						</table>
						</form>				
					</div>	
				</div>
			</div>
		
			<!-- 列表框 -->
			<div class="panel grid-panel">
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">
								<i class="icon-list-alt"></i>
								角色对应的用户列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<a class="btn" href="javascript:void(0);" onclick="addUsers()"><i class="icon-plus"></i>添加用户</a>
					                <a class="btn" href="javascript:void(0);" onclick="deleteUsers()"><i class="icon-remove"></i>删除用户</a>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="role_user_div" id="role_user_grid">
							<dg:datasource selectSqlId="role.listRoleUser" fixedQueryCondition="{RoleId:'${param.RoleId}'}"></dg:datasource>
							<dg:checkAllColumn/>
							<dg:operationColumn>
								<dg:action label="删除" onClick="deleteUser" id="delete_menu" icon="/statics/images/ico_del.gif"></dg:action>
							</dg:operationColumn>
							<dg:column id="USER_ID" width="0" header="用户ID" align="center" type="ro" isKey="true"></dg:column>
							<dg:column id="LOGIN_ID" width="20" header="登录帐号" align="left" type="ro"></dg:column>
							<dg:column id="USER_NAME" width="25" header="用户名称" align="left" type="ro"></dg:column>
							<dg:column id="ORG_NAME" width="20" header="所在组织" align="left" type="ro"></dg:column>
							<dg:column id="TYPE_NAME" width="15" header="帐号类型" align="left" type="ro"></dg:column>
							<dg:column id="STATUS" width="10" header="状态" align="center" type="ro"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
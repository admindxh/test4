<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox"></ui:combine>
		<ui:script src="modules/role/script/list_sec_role.js"></ui:script>
	</head>
	
	<body class="container-body">
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>角色列表</h2>
			</div>
			<!--搜索框 -->
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
							                    角色名称：
								</th>
								<td>
									<input type="text" name="name" id="name" class="input-large"/>
								</td>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$EDIT_WORKFLOW_ROLE")) {%>
								<th>
									 角色类型：
								</th>
								<td>
									<select id="type" name="type">
										<option value=""></option>
										<option value="0">功能角色</option>
										<option value="1">流程角色</option>
										<option value="2">混合角色</option>
									</select>
								</td>
								<%}%>
								<td class="toolbar-btns" rowspan="3">
									<button type="button" class="btn" onclick="role_grid.doSearch();">查询</button>
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
								角色信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$CREATE_ROLE")) {%>
									<a  class="btn" href="javascript:" onclick="createRole()"><i class="icon-plus"></i>新建角色</a>
									<%}%>
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$DELETE_ROLE")) {%>
									<a class="btn" href="javascript:" onclick="deleteRoles()"><i class="icon-remove"></i>删除角色</a>
									<%}%>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="role_div" id="role_grid">
							<dg:datasource selectSqlId="role.listRole"></dg:datasource>
							<dg:checkAllColumn/>
							<dg:operationColumn>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$EDIT_ROLE")) {%>
								<dg:action label="修改角色" onClick="modifyRole" id="edit_menu" icon="/statics/images/ico_edit.gif"></dg:action>
								<%}%>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$INHERIT_ROLE")) {%>
								<dg:action label="继承角色" onClick="extendRoles" id="inherit_menu" icon="/statics/images/ico_role_extend.gif"></dg:action>
								<%}%>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$ASSIGN_PRIVILEGE")) {%>
								<dg:action label="分配功能权限" onClick="assignPrivilege" id="assign_privilege" icon="/statics/images/ico_assign_auth.gif"></dg:action>
								<%}%>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$ASSIGN_USER")) {%>
								<dg:action label="分配用户" onClick="assignUsers" id="assign_user_menu" icon="/statics/images/ico_assign_user.gif"></dg:action>
								<%}%>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$DELETE_ROLE")) {%>
								<dg:action label="删除角色" onClick="deleteRole" id="deleteRole" icon="/statics/images/ico_del.gif"></dg:action>
								<%}%>
							</dg:operationColumn>
							<dg:column id="ID" width="0" header="角色id" type="ro" frozen="false" isKey="true" visible="false"></dg:column>
							<dg:column id="NAME" width="25" header="角色名称" type="ro" frozen="false"></dg:column>
							<%if (SecurityContext.hasPermission("ROLE_MANAGE$EDIT_WORKFLOW_ROLE")) { %>
							<dg:column id="TYPE" width="10" header="角色类型" type="ro" frozen="false" align="center"></dg:column>
							<%}%>
							<dg:column id="DESCRIPTION" width="65" header="角色描述" type="ro" frozen="false"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
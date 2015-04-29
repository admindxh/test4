<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户列表</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="modules/user/script/list_sec_user.js"></ui:script>
		<script type="text/javascript">
			var orgId = '${param.orgId}';
			var orgName = '${param.orgName}';
		</script>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
			<div class="grid-page">
				<div class="page-title">
					<h2>用户列表</h2>
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
								<tr>
									<td class="btn-toggle" rowspan="5">									
										<a href="###" data-widget="btn-toggle" data-options="{rel:'.toggle-content2'}"  title="高级选项"><i class="icon-plus2"></i></a>
									</td>
								</tr>
								<tr>
								    <th>
										用户名称：
									</th>
									<td>
										<input type="text" maxlength="20" name="USER_NAME" style="width:110px" id="USER_NAME" class="input-large"/>
									</td> 
									<th>
										登录帐号：
									</th>
									<td>
										<input type="text" maxlength="20" name="ACCOUNT" style="width:110px" id="ACCOUNT" class="input-large"/>
									</td>
									<th>
										状态：
									</th>
									<td>
										<select name='STATUS' multiple="multiple" data-widget="multiselect" data-options="{oneOrMoreSelected: '*' }">
											<option value=''></option>
											<option value='enabled' selected="selected">已启用</option>
											<option value='disabled'>已停用</option>
										</select>
									</td>
									<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="user_grid.doSearch();">查询</button>
										<button type="button" class="btn"/ onclick="document.forms['queryForm'].reset();">重置</button>
									</td>
								</tr>
								<tr class="toggle-content2" style="display:none">
									<th>
										手机号码：
									</th>
									<td>
										<input type="text" maxlength="20" name="MOBILE" style="width:110px" id="MOBILE" class="input-large"/>
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
								用户信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
								    <security:isAllow privilege="USER_MANAGE$CREATE_USER">
									    <a class="btn" href="javascript:void(0);" onclick="createUser()"><i class="icon-plus"></i>新建用户</a>	
									</security:isAllow>
									<security:isAllow privilege="USER_MANAGE$ENABLE_USER">
										<a class="btn" href="javascript:void(0);" onclick="enableUsers()"><i class="icon-play"></i>启用</a>	
									</security:isAllow>
									<security:isAllow privilege="USER_MANAGE$DISABLE_USER">
										<a class="btn" href="javascript:void(0);" onclick="disableUsers()"><i class="icon-stop"></i>停用</a>	
									</security:isAllow>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="user_div" id="user_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="user.user_list" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								<security:isAllow privilege="USER_MANAGE$ENABLE_USER">
									<dg:action label="启用帐号" onClick="enableUser" id="enabled_user" icon="/statics/images/ico_start.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$DISABLE_USER">
									<dg:action label="停用帐号" onClick="disableUser" id="disabled_user" icon="/statics/images/ico_pause.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="修改用户" onClick="modifyUser" id="modify_user" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$RESET_PASSWORD">
									<dg:action label="重置密码" onClick="setPassword" id="set_password" icon="/statics/images/ico_reset.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$ASSIGN_ROLE">
									<dg:action label="分配角色" onClick="assignRole" id="assign_role" icon="/statics/images/ico_assign_role.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$DELETE_USER">
									<dg:action label="删除用户" onClick="deleteUser" id="delete_user" icon="/statics/images/ico_del.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="Id" width="0" header="用户ID" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="Login_Id" width="15" header="登录帐号" type="ro" align="left"></dg:column>
							<dg:column id="Name" width="18" header="用户名称" type="ro" align="left"></dg:column>
							<dg:column id="OrgName" width="15" header="所在组织" type="ro" align="left"></dg:column>
							<dg:column id="TypeName" width="14" header="帐号类型" type="ro" align="left"></dg:column>
							<dg:column id="Type" width="0" header="类型ID" type="ro" align="center" visible="false"></dg:column>
							<dg:column id="Mobile_Phone" width="12" header="手机号码" type="ro" align="center"></dg:column>
							<dg:column id="ACCOUNT_STATUS" width="0" header="状态ID" type="ro" align="center" visible="false"></dg:column>
							<dg:column id="Status" width="8" header="状态" type="ro" align="center"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
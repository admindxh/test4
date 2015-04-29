<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户角色列表</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,messagebox,listselectdialog,dialog"></ui:combine>
		<ui:script src="/modules/user/script/list_sec_user_role.js"></ui:script>
		<script>
			var userId = '${param.userId}';
		</script>
	</head>
	
	<body class="container-body">
		<div class="container-fluid">
			<div class="grid-page">
				<div class="page-title">
					<h2>用户对应的角色</h2>
				</div>	
			
				<!-- 列表框 -->
				<div class="panel grid-panel">
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">
								<i class="icon-list-alt"></i>
								用户角色列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<a class="btn" href="javascript:void(0);" onclick="addRoles()"><i class="icon-plus"></i>添加角色</a>	
									<a class="btn" href="javascript:void(0);" onclick="deleteUserRoles()"><i class="icon-remove"></i>删除角色</a>	
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="user_role_div" id="user_role_grid">
							<dg:datasource selectSqlId="user.listUserRole" fixedQueryCondition="{userId:'${param.userId}'}"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn>
								<dg:action label="删除角色" onClick="deleteUserRole" id="delete_menu" icon="/statics/images/ico_del.gif"></dg:action>
							</dg:operationColumn>
							<dg:column id="ROLE_NAME" width="38" header="角色名称"></dg:column>
							<security:isAllow privilege="USER_MANAGE$ASSIGN_WF_ROLE">
							<dg:column id="ROLE_TYPE" width="12" header="角色类型" align="center"></dg:column>
							</security:isAllow>
							<dg:column id="ROLE_DESCRIPTION" width="50" header="角色描述"></dg:column>
							<dg:column id="ROLE_ID" width="0" header="角色Id" isKey="true"></dg:column>
							<dg:column id="USER_ID" width="0" header="用户ID" isKey="true"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
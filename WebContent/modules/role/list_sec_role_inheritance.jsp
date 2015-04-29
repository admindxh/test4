<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>角色包含的角色列表</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox,listselectdialog"></ui:combine>
		<script type="text/javascript" src="${path }/common/control/listSelect/list_select.js"></script>
		<ui:script src="/modules/role/script/list_sec_role_inheritance.js"></ui:script>
		<script type="text/javascript">
			var role_id   = '${param.roleId}';
		</script>
	</head>
	
	<body class="container-body">
		<div class="grid-page">
			<div class="page-title">
				<h2>角色继承</h2>
			</div>
		
			<!-- 列表框 -->
			<div class="panel grid-panel">
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">
								<i class="icon-list-alt"></i>
								继承的角色列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<a class="btn" href="javascript:void(0);" onclick="addRoles()"><i class="icon-plus"></i>添加角色</a>
									<a class="btn" href="javascript:void(0);" onclick="deleteRoles()"><i class="icon-remove"></i>删除角色</a>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					
					<div class="panel-content">
							<dg:grid container="role_inheritance_div" id="role_inheritance_grid">
								<dg:datasource selectSqlId="role.listRoleInheritance" fixedQueryCondition="{ROLE_ID:'${param.roleId}'}"></dg:datasource>
								<dg:checkAllColumn/>
								<dg:operationColumn>
									<dg:action label="删除角色" onClick="deleteRole" id="delete_menu" icon="/statics/images/ico_del.gif"></dg:action>
								</dg:operationColumn>
								<dg:column id="ROLE_NAME" width="26" header="角色名称"></dg:column>
								<dg:column id="ROLE_ID" width="0" header="角色ID" isKey="true"></dg:column>
								<dg:column id="DESCRIPTION" width="50" header="角色描述"></dg:column>
								<dg:column id="PARENT_ROLE" width="0" header="父角色"></dg:column>
							</dg:grid>
					</div>
			</div>
		</div>
	</body>
</html>
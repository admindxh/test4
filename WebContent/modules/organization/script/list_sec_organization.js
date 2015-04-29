function loadData(grid) {
	grid.doSearch();
}

// 新增组织机构
function addOrg(parentOrgId, parentOrgName) {
	var parent_id = "";
	var parent_name = "根组织机构";
	if (parentOrgId != 'root') {
		parent_id = parentOrgId;
		parent_name = parentOrgName;
	}
	var url = "~/modules/organization/edit_sec_organization.jsp?orgId=&parentId="
			+ parent_id + "&parentName=" + encodeURI(parent_name);
	$.open(url, 450, null, {}, function() {
				if ($.dialogReturnValue()) {
					organization_list_grid.refresh();
					parent.refreshNodeByNodeId();
				}
			});
}

// 从列表为入口编辑
function editOrganization(grid, rowData, keyData) {
	editOrg(keyData, parentId, parentName);
}

// 从树形为入口编辑
function editOrg(orgId, parentId, parentName) {
	var url = "~/organizationController/editOrganization.do?orgId=" + orgId
			+ "&parentName=" + encodeURI(parentName);
	$.open(url, 450, null, {}, function() {
				if ($.dialogReturnValue()) {
					organization_list_grid.refresh();
					parent.refreshNodeByNodeId();
				}
			});
}

// 从树形为入口编辑
function deleteOrg(orgId, orgName, parentId) {
	$.messageBox.confirm({
				message : "您确认要删除\"" + orgName + "\"及该组织下的所有子组织和移除该组织下的用户和角色？",
				callback : function(result) {
					if (result) {
						$
								.dataservice(
										"spring:organizationService.deleteOrganization",
										{
											orgId : orgId
										}, function() {
											organization_list_grid.refresh();
											parent.refreshNodeByNodeId();
										});
					}
				}
			});
}

// 从列表为入口编辑
function deleteOrganization(grid, rowData, keyData) {
	if (keyData) {
		var orgName = rowData['NAME'];
		var _parentId = rowData['PARENT'];
		deleteOrg(keyData, orgName, _parentId);
	}
}

// 从树形为入口启用
function enabledOrg(orgId) {
	$.messageBox.confirm({
				message : "您确认要启用该组织吗？",
				callback : function(result) {
					if (result) {
						$
								.dataservice(
										"spring:organizationService.enabledOrganization",
										{
											orgId : orgId
										}, function() {
											organization_list_grid.refresh();
											parent.refreshNodeByNodeId();
										});
					}
				}
			});
}

// 从列表为入口启用
function enabledOrganization(grid, rowData, keyData) {
	if (keyData) {
		var orgName = rowData['NAME'];
		var _parentId = rowData['PARENT'];
		enabledOrg(keyData, orgName, _parentId);
	}
}

// 从树形为入口停用
function disabledOrg(orgId) {
	$.messageBox.confirm({
				message : "您确认要停用该组织吗？",
				callback : function(result) {
					$.dataservice(
							"spring:organizationService.disabledOrganization",
							{
								orgId : orgId
							}, function() {
								organization_list_grid.refresh();
								parent.refreshNodeByNodeId();
							});
				}
			});
}

// 从列表为入口停用
function disabledOrganization(grid, rowData, keyData) {
	if (keyData) {
		var orgName = rowData['NAME'];
		var _parentId = rowData['PARENT'];
		disabledOrg(keyData, orgName, _parentId);
	}
}

function doOnBeforeMenuRender(grid, rowData, menuItems) {
	var status = rowData.STATUS;
	switch (status) {
		case 'disabled' :
			menuItems.showItem("enabled_organization");
			menuItems.hideItem("disabled_organization");
			break;
		case 'enabled' :
			menuItems.showItem("disabled_organization");
			menuItems.hideItem("enabled_organization");
			break;
	}
	return true;
}
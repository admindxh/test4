// 新建
function createRole() {
	var url = '~/modules/role/edit_sec_role.jsp'
	$.open(url, 810, null, {}, function() {
				if ($.dialogReturnValue()) {
					role_grid.refresh();
				}
			});
}

// 编辑
function modifyRole(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/role/editRole.do?roleId=' + keyData;
		$.open(url, 810, null, {}, function() {
					if ($.dialogReturnValue()) {
						role_grid.refresh();
					}
				});
	}
}

// 删除
function deleteRole(grid, rowData, keyData) {
	if (keyData) {
		var roleName = rowData['NAME'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + roleName
							+ "\"角色以及和该角色有关的角色用户关系、权限关系和继承角色关系吗？",
					callback : function(result) {
						$.dataservice("spring:roleService.deleteRole", {
									roleId : keyData
								}, function(response) {
									role_grid.refresh();
								});
					}
				});
	}
}

// 批量删除
function deleteRoles() {
	var ids = role_grid.getCheckedRowIds().split(',');

	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.warning({
					message : "请选择需要删除的角色!"
				});
		return;
	}

	$.messageBox.confirm({
				message : "您确定要删除所选择的角色以及和这些角色有关的角色用户关系、权限关系和继承角色关系吗？",
				callback : function(result) {
					var vals = [];
					for (var i = 0; i < ids.length; i++) {
						vals.push(role_grid.getCellValue("" + ids[i], 'ID'));
					}
					$.dataservice("spring:roleService.deleteRoles", {
								roleIds : vals.join(",")
							}, function(response) {
								role_grid.refresh();
							});s
				}
			});

}

// 分配用户
function assignUsers(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/modules/role/list_sec_role_user.jsp?RoleId=' + keyData;
		$.open(url, 810, 480, function() {
					if ($.dialogReturnValue()) {
						grid.refresh();
					}
				});
	}
}

// 角色继承
function extendRoles(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/modules/role/list_sec_role_inheritance.jsp?roleId='
				+ keyData;
		$.open(url, 810, 420, {}, function() {
					if ($.dialogReturnValue()) {
						grid.refresh();
					}
				});
	}
}

// 分配权限
function assignPrivilege(grid, rowData, keyData) {
	if (keyData) {
		var roleName = encodeURI("<b>‘" + rowData.NAME + "’</b>");
		var url = '~/modules/role/assignment_privilege.jsp?roleId=' + keyData
				+ '&roleName=' + roleName;
		$.open(url, 900);
	}
}

// 分配权限
function assignMenuPrivilege(grid, rowData, keyData) {
	if (keyData) {
		var roleName = encodeURI("<b>‘" + rowData.NAME + "’</b>");
		var url = '~/modules/role/assignment_menu_privilege.jsp?roleId='
				+ keyData + '&roleName=' + roleName;
		$.open(url, 900);
	}
}
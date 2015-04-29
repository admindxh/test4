function deleteRoles() {
	var ids = role_inheritance_grid.getCheckedRowIds().split(',');

	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.warning({
					message : "请您先选择要移除的角色再进行删除操作！"
				});
		return;
	}

	$.messageBox.confirm({
		message : "您确定要批量移除选择的角色吗？",
		callback : function(result) {
			if (result) {
				var vals = [];
				for (var i = 0; i < ids.length; i++) {
					var id = ids[i] + '';
					var idString = ''
							+ role_inheritance_grid.getCellValue(id, 'ROLE_ID');
					vals.push(idString);
				}
				$.dataservice("spring:roleService.deleteInheritanceRoles", {
							parentRoleId : role_id,
							childRoleIds : vals.join(",")
						}, function() {
							role_inheritance_grid.refresh();
						});
			}
		}
	});
}

function deleteRole(grid, rowData, keyData) {
	var roleId = keyData;
	var roleName = rowData['ROLE_NAME'];

	$.messageBox.confirm({
				message : "您确定要移除\"" + roleName + "\"角色吗?",
				callback : function() {
					$.dataservice("spring:roleService.deleteInheritanceRole", {
								parentRoleId : role_id,
								childRoleId : roleId
							}, function() {
								role_inheritance_grid.refresh();
							});
				}
			});
}

function addRoles() {
	$.listselectdialog({
				title : '请选择要包含的角色',
				key : {
					value : 'ID',
					label : 'NAME'
				},
				CommandName : 'sqlid:role.selectChildRoles',
				multi : true,
				params : {
					PARENT_ROLE : role_id
				},
				queryFields : [{
							key : "NAME",
							label : "角色名称",
							width : "100"
						}]
			}, function() {
				$.dataservice("spring:roleService.addInheritanceRoles", {
							parentId : role_id,
							childIds : jQuery.dialogReturnValue().value
						}, function() {
							role_inheritance_grid.refresh();
						});
			});
}
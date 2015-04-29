function deleteUserRoles() {
	var ids = user_role_grid.getCheckedRowIds().split(',');

	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.info({
					message : "请先选择角色再点击删除!"
				});
		return;
	}

	$.messageBox.confirm({
				message : "您确定要删除选择的角色吗？",
				callback : function(result) {
					if (result) {
						var roleIds = [];
						for (var i = 0; i < ids.length; i++) {
							var id = ids[i] + '';
							var roleId = user_role_grid.getCellValue(id,
									'ROLE_ID');
							roleIds.push(roleId);
						}
						$.dataservice("spring:userService.deleteUserRoles", {
									userId : userId,
									roleIds : roleIds.join(",")
								}, function(response) {
									user_role_grid.refresh();
								});
					}
				}
			});

}

function deleteUserRole(grid, rowData, keyData) {
	var role_name = rowData['ROLE_NAME'];
	$.messageBox.confirm({
				message : "确定删除该用户的 \"" + role_name + "\" 角色吗？",
				callback : function(result) {
					if (result) {
						var roleIds = [];
						var roleId = rowData['ROLE_ID'];
						roleIds.push(roleId);

						$.dataservice("spring:userService.deleteUserRoles", {
									userId : userId,
									roleIds : roleIds.join(",")
								}, function(response) {
									grid.refresh();
								});
					}
				}
			});

}
// 触发添加角色
function addRoles() {
	$.listselectdialog({
				title : '请选择角色',
				key : {
					value : 'ID',
					label : 'NAME'
				},
				CommandName : 'sqlid:user.selectUserRole',
				multi : true,
				params : {
					userId : userId
				},
				queryFields : [{
							key : "NAME",
							label : "角色名称",
							width : "180"
						}]
			}, function() {
				$.dataservice("spring:userService.assignRoles", {
							userId : userId,
							roleIds : jQuery.dialogReturnValue().value
						}, function() {
							user_role_grid.refresh();
						});
			});
}
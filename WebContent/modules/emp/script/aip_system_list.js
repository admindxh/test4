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
//查看方法
function viewEntity(row,col,primarykey){
	var editPagePath=getEditPagePath();
	var win=showCenterModerldialog(editPagePath+"primarykey");
		app_manage_aip_system_list_grid.doSearch();
}
//修改方法
function editEntity(row,col,primarykey){
	var editPagePath=getEditPagePath();
	var win=showCenterModerldialog(editPagePath+"primarykey");
		app_manage_aip_system_list_grid.doSearch(); 
}
//删除方法
function delEntity(row,col,primarykey){
	if(window.confirm("你确定删除当前记录吗?")){
		xalert('待删除记录的ID是'+primarykey);
		alert('del to do');
		app_manage_aip_system_list_grid.doSeach();
}


}
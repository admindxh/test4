function loadData(grid) {
	grid.doSearch();
}
// 新建用户
function createEmp() {
	
	//var url = '~/empController/createEmp.do';
	
	var url = '~/employee/createEmp.do'
	
			
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					user_grid.refresh();
				}
			});
}

//查看用户信息
function selectEmp(grid,rowData,keyData){
	if (keyData) {
		var url = '~/employee/selectEmp.do?empno='+keyData;
		
		$.open(url, 680, null, {}, function() {
			user_grid.refresh();
				});
	}
	
}

//修改用户
function editEmp(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/employee/editEmp.do?empno='+keyData;
		
		$.open(url, 680, null, {}, function() {
			user_grid.refresh();
				});
	}
}
//删除用户
function deleteEmpUser(grid, rowData, keyData) {
	if (keyData) {
		var userName = rowData['ename'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + userName + "\"员工吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:employeeService.deleteEmpUser", {
								     empno : keyData
									}, function() {
										user_grid.refresh();
									});
						}
					}
				});
	}
}
//批量删除
function deleteEmpUsers() {
	var ids = user_grid.getCheckedRowIds().split(',');

	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.warning({
					message : "请选择需要删除的员工!"
				});
		return;
	}

	$.messageBox.confirm({
				message : "您确定要删除所选择的员工吗？",
				callback : function(result) {
					var vals = [];
					for (var i = 0; i < ids.length; i++) {
						vals.push(user_grid.getCellValue("" + ids[i], 'EMPNO'));
					}
					$.dataservice("spring:employeeService.deleteEmpUsers", {
						       empnos : vals.join(",")
							}, function(response) {
								user_grid.refresh();
							});
				}
			});

}
function doOnBeforeMenuRender(grid, rowData, menuItems) {
	var status = rowData.ACCOUNT_STATUS;
	switch (status) {
		case 'disabled' :
			menuItems.showItem("enabled_user");
			menuItems.hideItem("disabled_user");
			break;
		case 'enabled' :
			menuItems.showItem("disabled_user");
			menuItems.hideItem("enabled_user");
			break;
	}
	return true;
}
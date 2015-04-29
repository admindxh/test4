function loadData(grid) {
	grid.doSearch();
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

//新增参数
function createUserXTCS() {
	
	//var url = '~/empController/createEmp.do';
	
	var url = '~/userCanShu/createUserCanShu.do';
	
			
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					user_grid.refresh();
				}
			});
}

//修改信息
function updateXTCS(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/userCanShu/editUserCanShu.do?yhbh='+keyData;
		
		$.open(url, 680, null, {}, function() {
			user_grid.refresh();
				});
	}
}
//删除参数
function deleteXTCS(grid, rowData, keyData) {
	if (keyData) {
		var yhjb  = rowData['yhjb'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + yhjb+ "\"吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:userCanShuService.deleteUserCanShu", {
								yhbh : keyData
									}, function() {
										user_grid.refresh();
									});
						}
					}
				});
	}
}


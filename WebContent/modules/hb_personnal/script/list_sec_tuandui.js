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

//提取红包基金
function tiqujijin(grid, rowData, keyData) {
	
	var url = "~/exchangehbb/deltejijin.do?yhdxdh="+keyData;
	
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}



// 删除用户
function deleteUser(grid, rowData, keyData) {
	if (keyData) {
		var userName = rowData['username'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + userName + "\"用户吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:YHDLservice.deleteUsers", {
								yhdxdh : keyData
									}, function() {
										grid.refresh();
									});
						}
					}
				});
	}
}

// 新建用户
function createusers(grid, rowData, keyData) {
	
	var url = "~/exchangehbb/createuser.do?yhdxdh="+keyData;
	
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}

// 修改用户
function modifyUsers(grid, rowData, keyData) {
	
	if (keyData) {
		var url = '~/userDx/editUsers.do?yhdxdh='+keyData;
		
		$.open(url, 680, null, {}, function() {
			user_grid.refresh();
				});
	}
}

//提取收益金额

function deleteshouyi(grid, rowData, keyData){ 	
	var url = "~/exchangehbb/delteshouyi.do?yhdxdh="+keyData;
	if(keyData){
		
	$.open(url, 680, null, {}, function() {
		if ($.dialogReturnValue()) {
			grid.refresh();
		}
	});
	}
	
}
	


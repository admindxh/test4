function loadData(grid) {
	grid.doSearch();
}

// 获取激活码
function enableJHM(grid, rowData, keyData) {
	
				var url = "~/userDx/createJHM.do?dldxbh="+keyData;
				
			   $.open(url, 680, null, {}, function() {
					if ($.dialogReturnValue()) {
						user_grid.refresh();
					}
				});
}

//激活码查询
function selectJHM() {
	
	var url = "~/modules/userjhm/list_sec_selectjhm.jsp";
	
   $.open(url, 860, null, {}, function() {
		if ($.dialogReturnValue()) {
			user_grid.refresh();
		}
	});
}

// 批量停用用户账号
function disableUsers() {
	var ids = user_grid.getCheckedRowIds().split(',');
	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.info({
					message : "请您先选择要停用的账号,然后再进行此操作！"
				});
		return;
	}

	var vals = [];
	for (var i = 0; i < ids.length; i++) {
		var id = ids[i] + '';
		var value = user_grid.getCellValue(id, 'Status');
		if (value == '已启用') {
			vals.push(user_grid.getCellValue(id, 'Id'));
		}
	}
	if (vals.length == 0) {
		$.messageBox.info({
					message : "您选择的用户已经全部处于启用状态，不需要进行停用操作！"
				});
	} else {
		$.messageBox.confirm({
					message : "您确定要批量停用已勾选的" + ids.length + "个账号吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:userService.disableAccount",
									{
										userIds : vals.join(",")
									}, function() {
										$.messageBox.info({
													message : "您成功停用了"
															+ vals.length
															+ "个账号!",
													callback : function() {
														user_grid.refresh();
													}
												});
									});
						}
					}
				});

	}
}

// 启用用户账号
function enableUser(grid, rowData, keyData) {
	if (keyData) {
		var userName = rowData['Name'];
		$.messageBox.confirm({
					message : "您确定要启用\"" + userName + "\"账号吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:userService.enableAccount", {
										userIds : keyData
									}, function() {
										$.messageBox.info({
													message : "启用\"" + userName
															+ "\"账号成功!",
													timeout: 5,
													callback : function() {
														grid.refresh();
													}
												});
									});
						}
					}
				});
	}
}

// 停用用户账号
function disableUser(grid, rowData, keyData) {
	if (keyData) {
		var userName = rowData['Name'];
		$.messageBox.confirm({
					message : "您确定要停用\"" + userName + "\"账号吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:userService.disableAccount",
									{
										userIds : keyData
									}, function() {
										$.messageBox.info({
													message : "停用\"" + userName
															+ "\"账号成功!",
													timeout : 5,
													callback : function() {
														grid.refresh();
													}
												});
									});
						}
					}
				});
	}
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
function createZCUser() {
	
	var url = "~/yhdl/createUser.do";
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}

//常见问题分类
function problelr(grid, rowData, keyData){
	
	
	var url = "~/hbproble/doSerch.do";
	alert(1);
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					user_grid.refresh();
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

// 设置密码
function setPassword(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/user/setUserPassword.do?yhdxdh=' + keyData;
		var result = $.open(url, 420);
	}
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

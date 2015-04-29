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
function createXTCANSHU() {
	
	
	//var url = '~/empController/createEmp.do';
	
	var url = '~/canShuLL/createCanShuLL.do';
	
			
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					cslb_grid.refresh();
				}
			});
	
}

//修改商品信息
function updateXTCS(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/canShuLL/editCanShuLL.do?llbh='+keyData;
		
		$.open(url, 680, null, {}, function() {
			cslb_grid.refresh();
				});
	}
}
//删除参数
function deleteXTCS(grid, rowData, keyData) {
	if (keyData) {
		var llfl = rowData['llfl'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + llfl + "\"吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:canShuLLService.deleteCanShuLL", {
								     llbh : keyData
									}, function() {
										cslb_grid.refresh();
									});
						}
					}
				});
	}
}
//批量删除参数
function deleteXTCSties() {
	var ids = cslb_grid.getCheckedRowIds().split(',');

	if (ids.length == 0 || ids[0] == '') {
		$.messageBox.warning({
					message : "请选择需要删除的商品!"
				});
		return;
	}

	$.messageBox.confirm({
				message : "您确定要删除所选择的商品吗？",
				callback : function(result) {
					var vals = [];
					for (var i = 0; i < ids.length; i++) {
						vals.push(cslb_grid.getCellValue("" + ids[i], 'llbh'));
					}
					$.dataservice("spring:canShuLLService.deleteAllCanShuLL", {
						llbhs : vals.join(",")
							}, function(response) {
								cslb_grid.refresh();
							});
				}
			});

}
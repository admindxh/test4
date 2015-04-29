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

//新增商品种类
function addCommodityClass() {
	
	//var url = '~/empController/createEmp.do';
	
	var url = '~/commodityClass/addCommodityClass.do';
	
   
	$.open(url, 480, null, {}, function() {
				if ($.dialogReturnValue()) {
					shopping_grid.refresh();
				}
			});
}
/*
//查看商品信息
function selectCommodity(grid,rowData,keyData){
	if (keyData) {
		var url = '~/commodity/selectEmp.do?empno='+keyData;
		
		$.open(url, 680, null, {}, function() {
			shopping_grid.refresh();
				});
	}
	
}*/

//修改商品信息
function updateCommodityClass(grid, rowData, keyData) {
	if (keyData) {
		var url = '~/commodity/editCommodity.do?commodityId='+keyData;
		
		$.open(url, 680, null, {}, function() {
			shopping_grid.refresh();
				});
	}
}
//删除商品
function deleteCommodityClass(grid, rowData, keyData) {
	if (keyData) {
		var commodityClassName = rowData['commodityClassName'];
		$.messageBox.confirm({
					message : "您确定要删除\"" + commodityClassName + "\"商品种类信息吗？",
					callback : function(result) {
						if (result) {
							$.dataservice("spring:commodityClassService.deleteCommodityClass", {
								commodityClassID : keyData
									}, function() {
										shopping_grid.refresh();
									});
						}
					}
				});
	}
}
//批量删除商品
function deleteCommodityClasses() {
	var ids = shopping_grid.getCheckedRowIds().split(',');

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
						vals.push(shopping_grid.getCellValue("" + ids[i], 'commodityClassID'));
					}
					$.dataservice("spring:commodityClassService.deleteCommodityClasses", {
						commodityClassIDs : vals.join(",")
							}, function(response) {
								shopping_grid.refresh();
							});
				}
			});

}
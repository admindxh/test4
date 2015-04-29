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

//提取代理商收益金额
function dopreeds(grid, rowData, keyData){
var url = "~/exchangehbb/dodailiMoney.do?yhdxdh="+keyData;
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}

//新建用户
function createusers(grid, rowData, keyData) {
	
	var url = "~/exchangehbb/createuser.do?yhdxdh="+keyData;
	
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
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
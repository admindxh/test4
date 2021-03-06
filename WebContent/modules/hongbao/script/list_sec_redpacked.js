
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

// 普通红包
function putongRedpackge(grid, rowData, keyData) {
	var url = '~/modules/hongbao/edit_sec_putong.jsp'
	$.open(url, 500, null, {}, function() {
				if ($.dialogReturnValue()) {
					role_grid.refresh();
				}
			});
}

//群红包
function qunfaRedpackge(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	var url='~/redPackge/doqunfa.do?yhdxdh='+keyData;
	$.open(url, 500, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}

/**
 * 抢红包
 * 
 **/
function qiangRedpackge(grid, rowData, keyData){
     
	
	var url = "~/redPackge/doQianghb.do?hbcID="+keyData;
	
	   $.open(url, 500, null, {}, function() {
			if ($.dialogReturnValue()) {
				grid.refresh();
			}
		});
	
}







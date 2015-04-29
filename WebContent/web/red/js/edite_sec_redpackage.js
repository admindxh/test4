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

/**
 * ajax异步请求  提交登陆
 */

  function ajaxsubmit(){
	  alert(1);
	
		//function 是后台请求成功的callback函数
		 var valInfo = $.validation.validate("#SEC_USER_FOMR");
			if (valInfo.isError)
				

			var user = $('#SEC_USER_FOMR').toJson();
            
			$.dataservice("spring:exchangehbbService.dosave", user, function(response) {
						$.dialogReturnValue(true);
						$(document).dialogClose();
					});
		 
  }
  
/**
 * 普通红包
 */
function doSaveputong() {
	var valInfo = $.validation.validate("#SEC_PUTONG_FOMR");
	if (valInfo.isError)
		return;

	var putong = $('#SEC_PUTONG_FOMR').toJson();

	$.dataservice("spring:redpackageService.putonghb", putong, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 群红包
 */
function doSavequnfa() {
	var valInfo = $.validation.validate("#SEC_QUNFA_FOMR");
	
	if (valInfo.isError)
		return;

	var qunfa = $('#SEC_QUNFA_FOMR').toJson();

	$.dataservice("spring:redpackageService.saveOrUpdateRedpackge", qunfa, function(response) {
		alert(1);
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 派红包
 * @return
 */
function doQianghb(grid, rowData, keyData){
	alert(1);
	var url = '~/poral/doQianghb.do?yhdxdh='+keyData;
	 $.open(url, 680, null, {}, function() {
			if ($.dialogReturnValue()) {
				grid.refresh();
			}
		});
	
	 
}
/*//兑换红包币
function modifyhbb(grid, rowData, keyData){
     
	
	var url = "~/exchangehbb/doediteExchange.do?yhdxdh="+keyData;
	
	   $.open(url, 500, null, {}, function() {
			if ($.dialogReturnValue()) {
				grid.refresh();
			}
		});
	
}*/

/*//普通红包
function putongRedpackge(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_putong.jsp'
	
	var url='~/exchangehbb/doExchangehbb.do?yhdxdh='+ keyData;
	
	$.open(url, 680, 680, {}, function() {
				if ($.dialogReturnValue()) {
					user_grid.refresh();
				}
			});
}
*/
//抢红包
function qunfaRedpackge(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	
	//var url='~/web/red/takePacket.jsp';
	window.location.href='../red/takePacket.jsp';
}

//抢红包
function qianghb(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	
	var url='~/poral/doqunfa.do?yhdxdh='+keyData;
	$.open(url, 750, 750, {}, function() {
		if ($.dialogReturnValue()) {
			user_grid.refresh();
		}
	});
	
}


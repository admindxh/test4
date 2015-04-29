

/**
 * 新增参数信息
 */
function doSaveJHMUser() {
	
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	if (valInfo.isError)
		return;

	var dlUser = $('#SEC_COMMODITY_FOMR').toJson();

	$.dataservice("spring:dldxService.addYhdxDL", dlUser, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
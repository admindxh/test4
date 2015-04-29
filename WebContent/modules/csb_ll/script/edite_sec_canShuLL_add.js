
/**
 * 新增参数信息
 */
function doSaveCanshu() {
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	if (valInfo.isError)
		return;

	var canShuLL = $('#SEC_COMMODITY_FOMR').toJson();

	$.dataservice("spring:canShuLLService.saveCanShuLL", canShuLL, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
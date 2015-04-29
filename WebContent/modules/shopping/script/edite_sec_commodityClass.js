
/**
 * 处理保存按钮动作
 */

function doSave() {
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var commodity = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:commodityService.saveOrUpdateCommodity", commodity, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 新增商品种类信息
 */
function doSaveCommodityClass() {
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:commodityClassService.addCommodityClass", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
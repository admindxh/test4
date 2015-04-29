/**
 * 红包基金保存按钮动作
 * @return
 */
function doSavehbjj(){
	var valInfo = $.validation.validate("#SEC_EXCHANGE_FOMR");
	if (valInfo.isError)
		return;

	var redjj = $('#SEC_EXCHANGE_FOMR').toJson();

	$.dataservice("spring:exchangehbbService.deleteRedpackge", redjj, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
/**
 * 提取收益总额动作
 * @return
 */
function doproceeds(){
	var valInfo = $.validation.validate("#SEC_EXCHANGE_FOMR");
	if (valInfo.isError)
		return;

	var proceeds = $('#SEC_EXCHANGE_FOMR').toJson();

	$.dataservice("spring:exchangehbbService.deleteProceeds", proceeds, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}


/**
 * 处理保存按钮动作
 */
function doSaveexchange() {
	var valInfo = $.validation.validate("#SEC_EXCHANGE_FOMR");
	if (valInfo.isError)
		return;

	var exchange = $('#SEC_EXCHANGE_FOMR').toJson();

	$.dataservice("spring:exchangehbbService.saveOrUpdate", exchange, function(response) {
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

	$.dataservice("spring:redpackageService.UpdateRedpackge", putong, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
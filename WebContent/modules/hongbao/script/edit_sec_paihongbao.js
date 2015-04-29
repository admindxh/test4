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



function selectuser(){
	var valInfo = $.validation.validate("#SEC_PUTONG_FOMR");
	if (valInfo.isError)
		return;

	var putong = $('#SEC_PUTONG_FOMR').toJson();

	$.dataservice("spring:dldxService.addYhdxDL", putong, function(response) {
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
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 抢红包
 * @return
 */
function doSaveowen(){
	
	var valInfo = $.validation.validate("#SEC_QHB_FOMR");
	if (valInfo.isError)
		return;

	var qhb = $('#SEC_QHB_FOMR').toJson();
	$.dataservice("spring:redpackageService.UpdateRedpackge", qhb, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
	
}




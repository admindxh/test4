/**
 * 处理保存按钮动作
 */
function doSave() {
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:userCanShuService.saveUserCanShu", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 新增参数信息
 */
function doSaveCsUser() {
	
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	if (valInfo.isError)
		return;

	var csUser = $('#SEC_COMMODITY_FOMR').toJson();

	$.dataservice("spring:userCanShuService.saveUserCanShu", csUser, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

//定时器

function timers() {
	
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	
	if (valInfo.isError)
		return;
	
	var user = $('#SEC_COMMODITY_FOMR').toJson();
	alert(1);
	$.dataservice("spring:exchangehbbService.getupdatejsrq", user, function(response) {
		
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
	
}
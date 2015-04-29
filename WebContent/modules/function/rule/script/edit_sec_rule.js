/**
 * 处理保存按钮动作
 */
function doSave() {
	var valInfo = $.validation.validate("#AIP_SYSTEM_FUNCTION_EDIT_FORM");
	if (valInfo.isError)
		return;

	$.dataservice("spring:functionService.saveRule",
			$('#AIP_SYSTEM_FUNCTION_EDIT_FORM').toJson(), function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
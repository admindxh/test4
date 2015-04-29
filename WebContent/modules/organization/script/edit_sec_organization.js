function doSave() {
	var valInfo = $.validation.validate("#USF_ORGANIZATION_EDIT_FORM");
	if (valInfo.isError)
		return {
			result : 'FAIL',
			resultDesc : '校验失败!',
			isClose : 'false',
			isTip : 'false'
		};
	var org = $('#USF_ORGANIZATION_EDIT_FORM').toJson();

	$.dataservice("spring:organizationService.saveOrUpdate", org, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
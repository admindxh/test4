function doSave() {
	var valInfo = $.validation.validate("#AIP_SYSTEM_EDIT_FORM");
	if (valInfo.isError)
		return;

	var module = $('#AIP_SYSTEM_EDIT_FORM').toJson();
	$.dataservice("spring:functionService.saveFunction", module, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

function checkUniqueCode() {
	var functionId = null;
	if (document.getElementById('id')) {
		functionId = document.getElementById('id').value;
	}
	var functionCode = document.getElementById('code').value;
	var exists = null;
	$.dataservice("spring:functionService.checkUniqueFunctionCode", {
				functionId : functionId,
				functionCode : functionCode
			}, function(response) {
				exists = response;
			}, {
				async : false
			});

	if (exists) {
		return {
			isError : true,
			errorInfo : "模块代码不能重复!"
		};
	} else {
		return {
			isError : false,
			errorInfo : ""
		};
	}
}
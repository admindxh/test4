function doSave() {
	var valInfo = $.validation.validate("#AIP_SYSTEM_FUNCTION_EDIT_FORM");
	if (valInfo.isError)
		return;

	$.dataservice("spring:functionService.saveFunction",
			$('#AIP_SYSTEM_FUNCTION_EDIT_FORM').toJson(), function(response) {
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
			errorInfo : "功能代码不能重复!"
		};
	} else {
		return {
			isError : false,
			errorInfo : ""
		};
	}
}
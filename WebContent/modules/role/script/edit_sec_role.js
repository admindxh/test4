function doSave() {
	var valInfo = $.validation.validate("#USF_ROLE_EDIT_FORM");
	if (valInfo.isError)
		return;
	var role = $('#USF_ROLE_EDIT_FORM').toJson();
	$.dataservice("spring:roleService.saveOrUpdate", role, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

function checkUniqueRoleName() {
	var roleName = document.getElementById('name').value;

	var roleId = document.getElementById('id').value;
	var exists = null;
	$.dataservice("spring:roleService.checkUniqueRoleName", {
				roleName : roleName,
				roleId : roleId
			}, function(response) {
				exists = response;
			}, {
				async : false
			});
	if (exists) {
		return {
			isError : true,
			errorInfo : "角色名称不能重复!"
		};
	} else {
		return {
			isError : false,
			errorInfo : ""
		};
	}
}
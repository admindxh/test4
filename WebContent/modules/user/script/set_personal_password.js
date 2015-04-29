function doSave() {
	var valInfo = $.validation.validate("#USF_USER_EDIT_FORM");
    if (valInfo.isError)
		return;

	var user = $('#USF_USER_EDIT_FORM').toJson();
	$.dataservice("spring:userService.updatePersonPassword", {
				userId : user.userId,
				newPassword : user.password,
				oldPassword : user.oldPassword
			}, function(response) {
				if (response) {
					alert(response);
				} else {
					$.messageBox.info({message:"密码修改成功"});
				}
			});
}
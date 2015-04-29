// 保存用户密码
function doSave() {
	var valInfo = $.validation.validate("#USER_PASSWORD_EDIT_FORM");
	if (valInfo.isError)
		return;
	var user = $('#USER_PASSWORD_EDIT_FORM').toJson();
	$.dataservice("spring:userService.updatePassword", {
				userId : user.id,
				newPassword : user.password
			}, function(response) {
				$.messageBox.info({
							message : "密码修改成功",
							callback : function() {
								$(document).dialogClose();
							}
						});
			});
}
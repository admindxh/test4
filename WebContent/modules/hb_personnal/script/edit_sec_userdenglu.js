function doSave() {
	
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();
    alert(user);
	$.dataservice("spring:hbbprobleService.dosave", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
	
}
function doSave() {
	
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:exchangehbbService.dosave", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
	
}
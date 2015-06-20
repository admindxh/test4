/**
 * 处理保存按钮动作
 */
function doSave() {
	alert(saveflag);
	if(saveflag==false){
		alert('激活码无效，不能保存');
		return;
	}
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:YHDLservice.saveOrUpdate", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}


var saveflag=true;

function check(value){
	var exists = null;
	var yhdxdh="";
	$.dataservice("spring:YHDLservice.checkJHM", {
		        userjhm : value,
		        yhdxdh : yhdxdh
			}, function(response) {
				exists = response;
			}, {
				async : false
			});
	if (exists) {
		saveflag=true;
		return {
			
			isError : false,
			errorInfo : "激活码正确"
		};
	} else {
		saveflag=false;
		return {
			
			isError : true,
			errorInfo : "激活码无效"
		};
	}
	
	
}
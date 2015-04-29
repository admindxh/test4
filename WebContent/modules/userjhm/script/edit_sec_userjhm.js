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

/**
 * 验证激活码的唯一性
 * @return
 */
function checkUniqueAccount() {
	var userjhm = document.getElementById('userjhm').value;

	var exprStr = /^[a-zA-Z0-9-]{1,38}$/;
	if (!exprStr.test(userjhm)) {
		return {
			isError : true,
			errorInfo : "登录激活码由字母、数字、分隔线组成"
		};
	}
	if(exprStr.length>18||exprStr.leng<18){
		return{
			isError : true,
			errorInfo : "登陆的字符长度不符合要求"
		};
		
	}

	var yhdxdh = document.getElementById('yhdxdh').value;
	var exists = null;
	$.dataservice("spring:YHDLservice.checkJHM", {
		        userjhm : userjhm,
		        yhdxdh : yhdxdh
			}, function(response) {
				exists = response;
			}, {
				async : false
			});
	alert(exists);
	if (exists) {
		alert('1');
		return {
			
			isError : false,
			errorInfo : "激活码有效!"
		};
	} else {
		alert('2');
		return {
			
			isError : true,
			errorInfo : "激活码无效"
		};
	}

	
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
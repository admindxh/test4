$(function() {
			// 输入框控件初始化
			$('.inputimg').input({
						type : 'class',// 样式背景渲染
						src : 'icon-search',// class 来自与 icon.css
						title : '查询组织',
						event : {
							click : function(val, input) {
								selectClz();
							}
						}
					});
		});

/**
 * 处理保存按钮动作
 */
function doSave() {
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:userService.saveOrUpdate", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

function showCheckPassword() {
	document.getElementById('checkPassTh').style.display = '';
	document.getElementById('checkPassTd').style.display = '';
	document.getElementById('hideTd').style.display = 'none';
}

function checkUniqueAccount() {
	var loginId = document.getElementById('loginId').value;

	var exprStr = /^[a-zA-Z0-9_]{1,38}$/;
	if (!exprStr.test(loginId)) {
		return {
			isError : true,
			errorInfo : "登录帐号由字母、数字、下划线组成"
		};
	}

	var userId = document.getElementById('id').value;
	var exists = null;
	$.dataservice("spring:userService.checkUniqueAccount", {
				loginId : loginId,
				userId : userId
			}, function(response) {
				exists = response;
			}, {
				async : false
			});

	if (exists) {
		return {
			isError : true,
			errorInfo : "登录账号不能重复!"
		};
	} else {
		return {
			isError : false,
			errorInfo : ""
		};
	}
}

function selectClz() {
	$.listselectdialog({
		//title:'组织机构选择',
		valueField: '#orgId',
		labelField:'#orgName',
		key:{value:'id', label:'text'},
		multi:false,
		tree:{
			title:'组织机构选择',
			method:'post',
			asyn:false,
			rootId:'root',
			rootText:'组织机构',
			CommandName:'java.tree.command',
			expandLevel: 3,
			params: {
				sqlId : 'organization.tree'
			}
		}
	});
}

function checkNewPassword() {
	var patternStr = /^[0-9]{6,40}$/;
	if (patternStr.test($F('password'))) {
		return false;
	}
	var len = $F('password').length;
	return len >= 6 && len <= 40;
}
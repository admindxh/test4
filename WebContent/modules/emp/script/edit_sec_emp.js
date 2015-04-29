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

	$.dataservice("spring:employeeService.saveOrUpdateEmployee", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 新建员工信息
 */
function doSaveEmployee() {
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	if (valInfo.isError)
		return;

	var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:employeeService.saveEmployee", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
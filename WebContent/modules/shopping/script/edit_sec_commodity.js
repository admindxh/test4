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
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	if (valInfo.isError)
		return;

	var commodity = $('#SEC_COMMODITY_FOMR').toJson();

	$.dataservice("spring:commodityService.saveOrUpdateCommodity", commodity, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 新增商品信息
 */
function doSaveCommodity() {
	var valInfo = $.validation.validate("#SEC_COMMODITY_FOMR");
	if (valInfo.isError)
		return;

	var commodity = $('#SEC_COMMODITY_FOMR').toJson();

	$.dataservice("spring:commodityService.saveOrUpdateCommodity", commodity, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}
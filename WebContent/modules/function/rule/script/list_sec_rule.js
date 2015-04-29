/** 新建 */
function registerRule(parentId, parentName) {
	$.open(	"~/modules/function/rule/edit_sec_rule.jsp?parentId=" + parentId
					+ "&parentName=" + encodeURI(parentName), 700, null, {},
			function() {
				if ($.dialogReturnValue()) {
					operator_aip_system_function_list_grid.refresh();
				}
			});
}

/** 删除 */
function deleteRule(grid, rowData, keyData) {
	$.messageBox.confirm({
				message : "您确定删除该规则吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteRule", {
									ruleId : keyData
								}, function(response) {
									grid.refresh();
								});
					}
				}
			});
}

/** 修改 */
function updateRule(grid, rowData, keyData) {
	$.open(	"~/function/editRule.do?ruleId=" + keyData + "&parentName="
					+ encodeURI(rowData["PARENT_NAME"]), 700, null, {},
			function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}
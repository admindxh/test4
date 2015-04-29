function registerFunction(parentId, parentName) {
	$.open(	"~/modules/function/function/edit_sec_function.jsp?parentId="
					+ parentId + "&parentName=" + encodeURI(parentName), 700,
			null, {}, function() {
				if ($.dialogReturnValue()) {
					parent.reloadTree();
				}
			});
}

function updateFunction(grid, rowData, keyData) {
	$.open(	"~/function/editFunction.do?functionId=" + keyData + "&parentName="
					+ encodeURI(rowData["PARENT_NAME"]), 700, null, {},
			function() {
				if ($.dialogReturnValue()) {
					parent.reloadTree();
				}
			});

}
/**
 * 
 * @param grid
 * @param rowData
 * @param keyData
 * @return
 */
function deleteFunction(grid, rowData, keyData) {
	$.messageBox.confirm({
				message : "您确定删除该功能吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteFunction",
								{
									functionId : keyData
								}, function(response) {
									parent.reloadTree();
								});
					}
				}
			});
}
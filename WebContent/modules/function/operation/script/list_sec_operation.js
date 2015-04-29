/** 新建 */
function registerOperator(parentId, parentName) {
	$.open(	"~/modules/function/operation/edit_sec_operation.jsp?parentId="
					+ parentId + "&parentName=" + encodeURI(parentName), 700,
			null, {}, function() {
				if ($.dialogReturnValue()) {
					window.parent.reloadTree();
				}
			});
}

/** 删除 */
function deleteOperation(grid, rowData, keyData) {
	$.messageBox.confirm({
				message : "您确定删除该操作吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteFunction",
								{
									functionId : keyData
								}, function(response) {
									window.parent.reloadTree();
								});
					}
				}
			});
}

/** 修改 */
function updateOperation(grid, rowData, keyData) {
	$.open(	"~/function/editOperation.do?operationId=" + keyData
					+ "&parentName=" + encodeURI(rowData["PARENT_NAME"]), 700,
			null, {}, function() {
				if ($.dialogReturnValue()) {
					window.parent.reloadTree();
				}
			});
}
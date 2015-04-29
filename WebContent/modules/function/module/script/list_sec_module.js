function registerModule(parentId, parentName) {
	$.open(	"~/modules/function/module/edit_sec_module.jsp?parentId="
					+ parentId + "&parentName=" + encodeURI(parentName), 600,
			null, {}, function() {
				if ($.dialogReturnValue()) {
					window.parent.reloadTree();
				}
			});
}

function updateModule(grid, rowData, keyData) {
	$.open(	"~/function/editModule.do?moduleId=" + keyData + "&parentId="
					+ rowData['PARENT'] + "&parentName="
					+ encodeURI(rowData['PARENT_NAME']), 600, null, {},
			function() {
				if ($.dialogReturnValue()) {
					window.parent.reloadTree();
				}
			});

}

function deleteModule(grid, rowData, keyData) {
	$.messageBox.confirm({
				message : "如果您删除该模块，则该模块下的子模块或功能都会被删除，您确定要删除吗?",
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
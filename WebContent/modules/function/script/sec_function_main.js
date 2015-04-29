var icon_new = Global.contextPath + '/statics/images/ico_add.gif';
var icon_edit = Global.contextPath + '/statics/images/ico_edit.gif';
var icon_delete = Global.contextPath + '/statics/images/ico_del.gif';
var icon_add = Global.contextPath + '/statics/images/ico_new.gif';

var treeInstance = null;
$(function() {
			// 树初始化
			treeInstance = $('#treeDiv').tree({// tree为容器ID
				asyn : true, // 异步
				rootId : 'root',
				rootText : '应用系统',
				CommandName : 'java.tree.command',
				onNodeClick : leftClick,
				onLoaded : doOnLoaded,
				params : {
					daoBeanName : 'dao',
					sqlId : 'function.tree',
					parentId : 'root'
				},
				contextMenu : function(_record) {
					// record为树查询获取的行对象，可以根据行对象返回对应的右键菜单项
					var items = [];

					var _id = _record.id;
					var parent_id = _record.parentId;
					var nodeText = _record.text;
					var parent_name = _record.parentName;
					if (_record.id == 'root') {
						items = [{
									text : '注册模块',
									action : registerModule,
									id : _id,
									icon : icon_new,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}];
					} else if (_record.type == 'Module') {// 模块
						items = [{
									text : '注册子模块',
									action : registerModule,
									id : _id,
									icon : icon_new,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '修改模块',
									action : updateModule,
									id : _id,
									icon : icon_edit,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '删除模块',
									action : deleteModule,
									id : _id,
									icon : icon_delete,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '注册功能',
									action : registerFunction,
									id : _id,
									icon : icon_add,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}];
					} else if (_record.type == 'Page') {
						items = [{
									text : '修改功能',
									action : updateFunction,
									id : _id,
									icon : icon_edit,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '删除功能',
									action : deleteFunction,
									id : _id,
									icon : icon_delete,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '注册操作',
									action : registerOperation,
									id : _id,
									icon : icon_add,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}];
					} else if (_record.type == "Element") {
						items = [{
									text : '修改操作',
									action : updateOperation,
									id : _id,
									icon : icon_edit,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}, {
									text : '删除操作',
									action : deleteOperation,
									id : _id,
									icon : icon_delete,
									nodeText : nodeText,
									parent_id : parent_id,
									parent_name : parent_name
								}];
					}
					return {
						width : 120,
						items : items
					};
				}
			});
			$('#treeDiv').tree().expandLevel(null, 3);
		});

function reloadTree(isDelete) {
	treeInstance.reload();
	treeInstance.expandLevel(null, 3);
	if (isDelete) {
		var url = Global.contextPath
				+ '/modules/function/module/list_sec_module.jsp?parentId=&parentName=应用系统';
		document.getElementById("content_frame").src = url;
	} else {
		document.getElementById("content_frame").src = document
				.getElementById("content_frame").src;
	}
}

function leftClick(id, name, record, currentNode) {
	if (id == "root") {
		loadModuleContent();
	} else {
		var type = record.type;
		if (type == 'Page') {
			loadOperatorContent(id, record);
		} else if (type == 'Module') {
			loadFunctionContent(id, record);
		} else if (type == 'Element') {
			loadOperatorRuleContent(id, record);
		}
	}
}

function doOnLoaded() {
	if (document.getElementById("content_frame").src == "") {
		var url = Global.contextPath
				+ '/modules/function/module/list_sec_module.jsp?parentId=&parentName=应用系统';
		document.getElementById("content_frame").src = url;
	}
}

function loadModuleContent() {
	document.getElementById("content_frame").src = Global.contextPath
			+ "/modules/function/module/list_sec_module.jsp";
}

function loadFunctionContent(id, record) {
	document.getElementById("content_frame").src = Global.contextPath
			+ "/modules/function/function/list_sec_function.jsp?parentId=" + id
			+ "&parentName=" + encodeURI(record.text);
}

function loadOperatorContent(id, record) {
	document.getElementById("content_frame").src = Global.contextPath
			+ '/modules/function/operation/list_sec_operation.jsp?parentId='
			+ id + '&parentName=' + encodeURI(record.text);
}

function loadOperatorRuleContent(id, record) {
	document.getElementById("content_frame").src = Global.contextPath
			+ '/modules/function/rule/list_sec_rule.jsp?parentId=' + id
			+ '&parentName=' + encodeURI(record.text);
}

function registerModule() {
	var id = this.data.id;
	if (id == "root") {
		id = '';
	}
	$.open(	"~/modules/function/module/edit_sec_module.jsp?parentId=" + id
					+ "&parentName=" + encodeURI(this.data.nodeText), 600,
			null, {}, function() {
				reloadTree();
			});
}

function updateModule() {
	var parentName = this.data.parent_name;
	if (this.data.parent_id == 'root') {
		parentName = '';
	}

	$.open(	"~/function/editModule.do?moduleId=" + this.data.id + "&parentId="
					+ this.data.id + "&parentName=" + encodeURI(parentName),
			600, null, {}, function() {
				reloadTree();
			});
}

function deleteModule() {
	var id = this.data.id;
	$.messageBox.confirm({
				message : "您确定删除该模块吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteFunction",
								{
									functionId : id
								}, function(response) {
									reloadTree(true);
								});
					}
				}
			});
}

function registerFunction() {
	$.open(	"~/modules/function/function/edit_sec_function.jsp?parentId="
					+ this.data.id + "&parentName="
					+ encodeURI(this.data.nodeText), 700, null, {}, function() {
				reloadTree();
			});

}

function updateFunction() {
	$.open(	"~/function/editFunction.do?functionId=" + this.data.id
					+ "&parentName=" + encodeURI(this.data.parent_name), 700,
			null, {}, function() {
				reloadTree();
			});
}

function deleteFunction() {
	var id = this.data.id;
	$.messageBox.confirm({
				message : "您确定删除该功能吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteFunction",
								{
									functionId : id
								}, function(response) {
									reloadTree(true);
								});
					}
				}
			});
}

function registerOperation() {
	$.open(	"~/modules/function/operation/edit_sec_operation.jsp?parentId="
					+ this.data.id + "&parentName="
					+ encodeURI(this.data.nodeText), 700, null, {}, function() {
				reloadTree();
			});
}

function updateOperation() {
	$.open(	"~/function/editOperation.do?operationId=" + this.data.id
					+ "&parentName=" + encodeURI(this.data.parent_name), 700,
			null, {}, function() {
				reloadTree();
			});
}

function deleteOperation() {
	var id = this.data.id;
	$.messageBox.confirm({
				message : "您确定删除该操作吗？",
				callback : function(result) {
					if (result) {
						$.dataservice("spring:functionService.deleteFunction",
								{
									functionId : id
								}, function(response) {
									reloadTree();
								});
					}
				}
			});
}
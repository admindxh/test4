//初始化权限树
$(function () {
    $('#treeDiv').tree({
        asyn: false, //异步
        rootId: 'root',
        rootText: '功能权限',
        CommandName: 'java.tree.command',
        onNodeClick: showDataRuleList,
        showCheck: true, //是否显示checkbox框 , 默认所有节点出现选择框
        cascadeCheck: true, //级联选择，UP向上级联 DOWN向下级联 false不级联 true向上向下级联
        onCheck: onCheckOrUnCheck,
        params: {
            sqlId: 'role.function.treeList',
            parentId: 'root',
            roleId: roleId
        },
        onLoaded: function () {
            initData();
        }
    });
});

function initData() {
    //获取已选的数据权限列表
    $.dataservice("spring:roleService.getSelectedOperationDataRulePrivilegeList", { roleId: roleId }, function (response) {
        for (var i = 0; i < response.length; i++) {
            var rule_obj = {
                operation: response[i].OPERATION,
                ruleId: response[i].RULEID
            };
            selectedOperationRuleList.push(rule_obj);
        }
    });
}

//获取指定数据实体的所有数据规则权限集合并以列表的方式展现出来
function showDataRuleList(id, name, record, currentNode) {
    if (id != undefined) {
        var nodeType = record.type;
        if (nodeType == 'Element') {
            $.dataservice("spring:roleService.getOperationDataRulePrivilegeList", { operation: id }, callback_showDataRuleList, { async: false });
            //判断当前节点是否被选中，如果没有被选中则需要进行置灰
            if (record.checkstate == '0') {
                disable();
            }
        }
    }
}

//勾中或者勾掉树节点的选择框时触发的事件
function onCheckOrUnCheck(id, name, checked, record, currentNode) {
    var nodeType = record.type;
    if (checked) {
        if (nodeType == 'Element') {
            $.dataservice("spring:roleService.getOperationDataRulePrivilegeList", { operation: id }, callback_showDataRuleList, { async: false });
        }
    } else {
        disable();
        if (nodeType == 'Element') {
            removeOperationRule(id);
        }
    }
}

//展示数据实体的数据规则列表
function callback_showDataRuleList(response) {
    //清除数据规则列表的数据
    var odiv = document.getElementById('dataEntityId');
    odiv.innerHTML = "";
    var otable = $("<table style='border: 1px solid #A9D6F6;;border-collapse: collapse;padding:3px;width:100%;'></table>").get(0);
    odiv.appendChild(otable);

    var othead = $("<thead/>").get(0);
    otable.appendChild(othead);

    var otr_title = $("<tr/>").get(0);
    othead.appendChild(otr_title);
    var otr_title_td = $("<td align='center' width='20%' style='border:1px solid #A9D6F6;background-color: #DFEAFB;height: 22px'></td>").get(0);
    otr_title.appendChild(otr_title_td);
    otr_title_td.innerHTML = "选择";

    var otr_title_td2 = $("<td align='center' width='*' style='border:1px solid #A9D6F6;background-color: #DFEAFB;height: 22px'></td>").get(0);
    otr_title.appendChild(otr_title_td2);
    otr_title_td2.innerHTML = "操作规则";

    var otbody = $("<tbody/>").get(0);
    otable.appendChild(otbody);
    for (var i = 0; i < response.length; i++) {
        var operation = response[i].OPERATION;
        var ruleId = response[i].ID;
        var ruleName = response[i].NAME;

        var row = document.createElement("tr");
        var cell = $("<td style='border:1px solid #A9D6F6' align='center'>").get(0);
        var input = null;
        
        if (getIndex(operation, ruleId) != -1) {
            input = $("<input type='radio' name='rule" + operation + "' checked='true' onclick='selectDataRule(this)'/>").get(0);
        }
        else {
            input = $("<input type='radio' name='rule" + operation + "' onclick='selectDataRule(this)'/>").get(0);
        }

        input.operation = operation;
        input.ruleId = ruleId;

        cell.appendChild(input);
        row.appendChild(cell);

        var cell2 = $("<td style='border:1px solid #A9D6F6'>").get(0);
        cell2.innerHTML = "<font size='2px'>" + ruleName + "</font>";
        row.appendChild(cell2);

        otbody.appendChild(row);
    }
}

// 保存权限信息
function savePrivilege() {
	$.block({
				upRender : false
			});
	var privilegeList = [];

	// 整理已勾选的节点的权限集合
	var selectedOperationList = $('#treeDiv').tree().getSelectNodes();

	for (var i = 0; i < selectedOperationList.length; i++) {
		var ruleId = findRuleByOperation(selectedOperationList[i].id);
		var item = selectedOperationList[i].id + ":" + ruleId;
		privilegeList.push(item);
	}

	$.dataservice("spring:roleService.savePrivilege", {
				privilegeList : privilegeList.join(","),
				roleId : roleId,
				entity : "operation"
			}, function(response) {
				$.unblock({
							upRender : false
						});
				$.messageBox.info({
							message : '保存成功!',
							timeout : 5,
							callback : function() {
								$(document).dialogClose();
							}
						});
			});
}

//展示数据实体的数据规则列表（点击待选数据规则列表前的checkbox框时触发事件对应的方法）
function selectDataRule(obj) {
    removeOperationRule(obj.operation);
    addOperationRule(obj.operation, obj.ruleId);
}

//根据规则编号在selectedRuleList数组中查找对应的位置index
function getIndex(operation, ruleId) {
    for (var i = 0; i < selectedOperationRuleList.length; i++) {
        if (selectedOperationRuleList[i].operation == operation && selectedOperationRuleList[i].ruleId == ruleId && ruleId != '' && ruleId != null) {
            return i;
        }
    }
    return -1;
}

function findRuleByOperation(operation) {
    for (var i = 0; i < selectedOperationRuleList.length; i++) {
        if (selectedOperationRuleList[i].operation == operation) {
            return selectedOperationRuleList[i].ruleId;
        }
    }
    return "";
}

//添加权限规则
function addOperationRule(operation, ruleId) {
    var exists = false;
    for (var i = 0; i < selectedOperationRuleList.length; i++) {
        if (selectedOperationRuleList[i].operation == operation && selectedOperationRuleList[i].ruleId == ruleId) {
            exists = true;
            break;
        }
    }

    if (!exists) {
        var rule = { operation: operation, ruleId: ruleId };
        selectedOperationRuleList.push(rule);
    }
}

//删除权限规则
function removeOperationRule(operation) {
    for (var i = 0; i < selectedOperationRuleList.length; i++) {
        if (selectedOperationRuleList[i].operation == operation) {
            selectedOperationRuleList.splice(i, 1);
            break;
        }
    }
}

//点击操作，但没有选中该操作则置灰该操作对应的所有规则选项
function disable() {
    var items = document.getElementsByTagName('INPUT');
    for (var i = 0; i < items.length; i++) {
        if (items[i].type == 'radio') {
            items[i].checked = false;
            items[i].disabled = true;
        }
    }
}
$(function() {
			// 树初始化
			$('#treeDiv').tree({// tree为容器ID
				asyn : false, // 异步
				rootId : 'root',
				rootText : '组织机构',
				CommandName : 'java.tree.command',
				onNodeClick : leftClick,
				expandLevel: 3,
				onLoaded: doOnLoaded,
				params : {
					daoBeanName : 'dao',
					sqlId : 'organization.tree',
					childSqlId : 'organization.tree.children',
					parentId : 'root'
				}
			});
		});

/*
 * 左击事件 节点事件的参数依次是：（节点的ID，节点名称，当前节点对象，节点对应的HTML代码） '当前节点对象'的属性由SQL语句的选择结果决定，
 * 可以以这种方式去访问：itemObj.TYPE，注意属性TYPE必须是大写的
 */
function leftClick(id, name, record, currentNode) {
	// ID不存在，点击根节点
	if (id == 'root') {
		loadUserContent();
	} else {
		loadUserListByOrgId(id, name);
	}
}

/**
 * 树加载好之后再加载Grid
 */
function doOnLoaded() {
    if (document.getElementById("content_frame").src == "") {
        var url = Global.contextPath + '/modules/user/list_sec_user.jsp';
        document.getElementById("content_frame").src = url;
    }
}

// ----------------------Tree Event--------------------------------------

// 右侧内容区加载用户列表
function loadUserContent() {
	document.getElementById("content_frame").src = Global.contextPath
			+ '/modules/user/list_sec_user.jsp';
}

// 右侧内容区根据组织ID加载用户列表
function loadUserListByOrgId(orgId, name) {
	
	document.getElementById("content_frame").src = Global.contextPath
			+ '/modules/user/list_sec_user.jsp?orgId=' + orgId + '&orgName=' + encodeURI(name);
}

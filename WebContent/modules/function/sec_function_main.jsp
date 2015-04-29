<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:tvns>
<%@include file="/common/taglibs.jsp"%>
<head>
    <title>功能管理</title>
    <%@include file="/common/meta.jsp"%>
    <ui:combine widgets="tree,layout,contextmenu,dialog,messagebox"></ui:combine>
    <ui:script src="/modules/function/script/sec_function_main.js"></ui:script>
</head>

<body class="mainarea">
	<div data-widget="layout" style="width:100%;height:100%">
		<div region="west" split="true" title="功能管理树" style="width:200px;">
            	<div id="treeDiv" oncontextmenu="return false;"></div>
		</div>
		<div region="center" title="" border="true" style="padding:1px">
			<iframe name="content_frame" id="content_frame" 
					marginwidth=0 marginheight=0 
					width=100% height='100%'
					scrolling="auto" frameborder=0></iframe> 
		</div>
	</div>
</body>
</html>
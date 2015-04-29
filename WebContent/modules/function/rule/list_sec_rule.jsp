<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>操作列表</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox"></ui:combine>
		<ui:script src="modules/function/rule/script/list_sec_rule.js"></ui:script>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>系统规则列表</h2>
			</div>	
			<div class="panel search-panel">
				<div class="panel-head">
					<div class="row-fluid">
						<div class="span6 first">
							<i class="icon-list-alt"></i>
							查询条件
						</div>
						<div class="span6"></div>
					</div>
					<a href="#" class="toggle"></a>	
				</div>
				<div class="panel-content">
					<div class="toolbar">
					<form id="queryForm" style="margin: 0px;">
						<table>
						    <!-- 
							<tr>
								<td class="btn-toggle" rowspan="5">									
									<a href="###" data-widget="btn-toggle" data-options="{rel:'.toggle-content2'}"  title="高级选项"><i class="icon-plus2"></i></a>
								</td>
							</tr>
							-->
							<tr>
							    <th>
									规则名称：
								</th>
								<td>
									<input type="text" name="name" id="name" maxlength="300" class="input-large"/>
								</td>							    
								<td class="toolbar-btns" rowspan="3">
									<button type="button" class="btn" onclick="operator_aip_system_function_list_grid.doSearch();">查询</button>
									<button type="button" class="btn" onclick="document.forms['queryForm'].reset();">重置</button>
								</td>
							</tr>
						</table>
						</form>				
					</div>	
				</div>
			</div>
		
			<!-- 列表框 -->
			<div class="panel grid-panel">
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">
								<i class="icon-list-alt"></i>
								系统规则信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<a class="btn" href="javascript:" onclick="registerRule('${param.parentId}','${param.parentName}');"><i class="icon-plus"></i>注册规则</a>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="operator_aip_system_function_list_div" id="operator_aip_system_function_list_grid">
							<dg:datasource selectSqlId="function.rule.list" fixedQueryCondition="{parentId:'${param.parentId}'}"></dg:datasource>
							<dg:operationColumn>
								<dg:action label="修改" onClick="updateRule" id="update_menu" icon="/statics/images/ico_edit.gif"></dg:action>
								<dg:action label="删除" onClick="deleteRule" id="delete_menu" icon="/statics/images/ico_del.gif"></dg:action>
							</dg:operationColumn>
							<dg:column id="ID" width="0" header="规则ID" isKey="true"></dg:column>
							<dg:column id="NAME" width="25" header="规则名称"></dg:column>
							<dg:column id="RULE" width="42" header="规则"></dg:column>
							<dg:column id="PRIORITY" width="10" header="优先级"></dg:column>
							<dg:column id="OPERATION_ID" width="0" header="操作ID"></dg:column>
							<dg:column id="PARENT_NAME" width="15" header="所属操作"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
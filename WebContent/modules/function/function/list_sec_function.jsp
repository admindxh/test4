<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<!-- header files -->
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>功能列表</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox"></ui:combine>
		<ui:script src="modules/function/function/script/list_sec_function.js"></ui:script>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>系统功能列表</h2>
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
									功能名称：
								</th>
								<td>
									<input type="text" name="name" id="name" maxlength="300" class="input-large"/>
								</td>							    
								<td class="toolbar-btns" rowspan="3">
									<button type="button" class="btn" onclick="aip_system_function_grid.doSearch();">查询</button>
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
								系统功能信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<a class="btn" href="javascript:" onclick="registerFunction('${param.parentId}','${param.parentName}');"><i class="icon-plus"></i>注册功能</a>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="aip_system_function_div" id="aip_system_function_grid">
							<dg:datasource selectSqlId="function.list" fixedQueryCondition="{type:'Page',parentId:'${param.parentId}'}"></dg:datasource>
							<dg:operationColumn>
								<dg:action label="修改" onClick="updateFunction" id="update_menu" icon="/statics/images/ico_edit.gif"></dg:action>
								<dg:action label="删除" onClick="deleteFunction" id="delete_menu" icon="/statics/images/ico_del.gif"></dg:action>
							</dg:operationColumn>
							<dg:column id="ID" width="0" header="功能ID" isKey="true"></dg:column>
							<dg:column id="NAME" width="17" header="功能名称"></dg:column>
							<dg:column id="CODE" width="20" header="功能代码"></dg:column>
							<dg:column id="PARENT_NAME" width="12" header="所属模块"></dg:column>
							<dg:column id="PARENT_ID" width="0" header="所属模块ID"></dg:column>
							<dg:column id="URL" width="43" header="访问地址"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
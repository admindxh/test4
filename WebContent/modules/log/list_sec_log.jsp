<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>操作日志查询</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox,calendar"></ui:combine>
		<ui:script src="/modules/log/script/list_sec_log.js"></ui:script>
		<ui:combine widgets="calendar"></ui:combine>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>日志列表</h2>
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
						    <tr>
								<td class="btn-toggle" rowspan="5">									
									<a href="###" data-widget="btn-toggle" data-options="{rel:'.toggle-content2'}"  title="高级选项"><i class="icon-plus2"></i></a>
								</td>
							</tr>
							<tr>
							    <th>
									日志类型：
								</th>
								<td>
									<select id="LOG_TYPE" name='LOG_TYPE' multiple="multiple" data-widget="multiselect">
										<option value=''></option>
										<option value='login'>登录日志</option>
										<option value='operation'>操作日志</option>
										<option value='auth'>授权日志</option>
									</select>
								</td>
								<th>
									操作人：
								</th>
								<td>
									<input type="text" name="USER_NAME" id="USER_NAME" class="input-large" />
								</td>
								<th>
									操作名称：
								</th>
								<td>
									<input type="text" name="OPERATION_NAME" id="OPERATION_NAME" class="input-large"/>
								</td>
								<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="secLogGrid.doSearch();">查询</button>
										<button type="button" class="btn"/ onclick="document.forms['queryForm'].reset();">重置</button>
								</td>
							</tr>
							<tr class="toggle-content2" style="display:none">
							    <th>
									开始时间：
								</th>
								<td>
									<input type="text" name="BEGIN_TIME" id="BEGIN_TIME" data-widget="calendar" data-options="{'isShowWeek':'true','dateFmt':'yyyy-MM'}" class="input-large"/>
								</td>
								<th>
									结束时间：
								</th>
								<td>
									<input type="text" name="END_TIME" id="END_TIME" data-widget="calendar" data-options="{'isShowWeek':'true','dateFmt':'yyyy-MM'}" class="input-large"/>
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
								日志信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="operat_log_div" id="secLogGrid" onRowDoubleClicked="doOnRowDoubleClicked">
							<dg:datasource selectSqlId="log.listSecLog"></dg:datasource>
							<dg:operationColumn>
								<dg:action label="详细信息" onClick="viewSecLog" id="show_menu" icon="/statics/images/ico_modify.gif"></dg:action>
							</dg:operationColumn>
							<dg:column id="ID" width="0" header="日志ID" isKey="true" visible="false" exportable="false"></dg:column>
							<dg:column id="LOG_TYPE" width="10" header="日志类型" align="left"></dg:column>
							<dg:column id="USER_NAME" width="10" header="操作人" align="left"></dg:column>
							<dg:column id="OPERATION_TIME" width="16" header="操作时间" align="left"></dg:column>
							<dg:column id="OPERATION_NAME" width="15" header="操作名称" align="left"></dg:column>
							<dg:column id="DESCRIPTION" width="44" header="日志内容" align="left"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
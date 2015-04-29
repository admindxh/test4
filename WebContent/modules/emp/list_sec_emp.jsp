<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户列表</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="modules/emp/script/list_sec_emp.js"></ui:script>
		<script type="text/javascript">
			var orgId = '${param.orgId}';
			var orgName = '${param.orgName}';
		</script>
	</head>
	
	<body class="container-body">
	    <!--搜索框 -->
		<div class="container-fluid">
			<div class="grid-page">
				<div class="page-title">
					<h2>员工信息列表</h2>
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
										员工姓名：
									</th>
									<td>
										<input type="text" maxlength="20" name="ENAME" style="width:110px" id="ENAME" class="input-large"/>
									</td> 
									<th>
										MGR：
									</th>
									<td>
										<input type="text" maxlength="20" name="MGR" style="width:110px" id="MGR" class="input-large"/>
										
									</td>
									
									<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="user_grid.doSearch();">查询</button>
										<button type="button" class="btn"/ onclick="document.forms['queryForm'].reset();">重置</button>
									</td>
								</tr>
								<!--<tr class="toggle-content2" style="display:none">
									<th>
										手机号码：
									</th>
									<td>
										<input type="text" maxlength="20" name="MOBILE" style="width:110px" id="MOBILE" class="input-large"/>
									</td>
								</tr>
							--></table>
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
								用户信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<!--<div class="pull-right">
								    <security:isAllow privilege="USER_MANAGE$CREATE_USER">
									    <a class="btn" href="javascript:void(0);" onclick="createEmp()"><i class="icon-plus"></i>新建员工信息</a>	
									</security:isAllow>
									<security:isAllow privilege="USER_MANAGE$CREATE_USER">
									    <a class="btn" href="javascript:void(0);" onclick="deleteEmp()"><i class="icon-remove"></i>删除用户信息</a>	
									</security:isAllow>
								</div>
							-->
							   <div class="pull-right">
							      
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$CREATE_ROLE")) {%>
									<a  class="btn" href="javascript:" onclick="createEmp()"><i class="icon-plus"></i>新建员工信息</a>
									
									<%}%>
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$DELETE_ROLE")) {%>
									<a class="btn" href="javascript:" onclick="deleteEmpUsers()"><i class="icon-remove"></i>删除用户信息</a>
									<%}%>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="user_div" id="user_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="emp.listEmp.sql" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								
								<security:isAllow privilege="USER_MANAGE$ENABLE_USER">
									<dg:action label="查看" onClick="selectEmp" id="enabled_user" icon="/statics/images/ico_start.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="修改" onClick="editEmp" id="modify_user" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								
			
								<security:isAllow privilege="USER_MANAGE$DELETE_USER">
									<dg:action label="删除" onClick="deleteEmpUser" id="delete_user" icon="/statics/images/ico_del.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="EMPNO" width="0" header="员工编号" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="ename" width="15" header="员工姓名" type="ro" align="center"></dg:column>
							<dg:column id="mgr" width="10" header="MGR" type="ro" align="center"></dg:column>
							<dg:column id="hiredate" width="15" header="入职时间" type="ro" align="center"></dg:column>
							<dg:column id="sal" width="14" header="薪水" type="ro" align="center"></dg:column>
							<dg:column id="comm" width="0" header="COMM" type="ro" align="center" visible="false"></dg:column>
							<dg:column id="deptno" width="12" header="部门编号" type="ro" align="center"></dg:column>
							<dg:column id="DNAME" width="12" header="部门名称" type="ro" align="center"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
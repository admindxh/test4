<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户参数列表</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="modules/csbuser/script/list_sec_csuser.js"></ui:script>
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
					<h2>用户参数列表</h2>
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
										用户级别：
									</th>
									<td>
										<input type="text" maxlength="20" name="yhjb" style="width:110px" id="yhjb" class="input-large"/>
									</td> 
									
									<th>
										状态：
									</th>
									<td>
										<select name='status' data-widget="multiselect" data-options="{oneOrMoreSelected: '*' }">
											<option value='' selected="selected"></option>
											<option value='0'>VIP</option>
											<option value='1'>普通用户</option>
										</select>
									</td>
									<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="user_grid.doSearch();">查询</button>
										<button type="button" class="btn"/ onclick="document.forms['queryForm'].reset();">重置</button>
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
								用户信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
								    <security:isAllow privilege="USER_MANAGE$CREATE_USER">
									    <a class="btn" href="javascript:void(0);" onclick="createUserXTCS()"><i class="icon-plus"></i>新建用户参数</a>	
									</security:isAllow>
									<security:isAllow privilege="USER_MANAGE$ENABLE_USER">
										<a class="btn" href="javascript:void(0);" onclick="enableUsers()"><i class="icon-play"></i>启用</a>	
									</security:isAllow>
									<security:isAllow privilege="USER_MANAGE$DISABLE_USER">
										<a class="btn" href="javascript:void(0);" onclick="disableUsers()"><i class="icon-stop"></i>停用</a>	
									</security:isAllow>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="user_div" id="user_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="user_list_key" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="修改用户参数" onClick="updateXTCS" id="modify_user" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								
								<security:isAllow privilege="USER_MANAGE$DELETE_USER">
									<dg:action label="删除用户参数" onClick="deleteXTCS" id="delete_user" icon="/statics/images/ico_del.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="yhbh" width="0" header="用户编号" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="yhjb" width="15" header="用户级别" type="ro" align="center"></dg:column>
							<dg:column id="tcbl" width="18" header="提成比例" type="ro" align="center"></dg:column>
							<dg:column id="fzrs" width="15" header="发展人数" type="ro" align="center"></dg:column>
							<dg:column id="status" width="14" header="状态" type="ro" align="center"></dg:column>
							<dg:column id="ztms" width="18" header="状态描述" type="ro" align="center"></dg:column>
							
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
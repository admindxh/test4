<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>代理商收益明细查询</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="/modules/dailiuser/script/list_sec_everyone.js"></ui:script>
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
					<h2>代理商收益明细查询</h2>
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
										用户名称：
									</th>
									<td>
										<input type="text" maxlength="20" name="username" style="width:110px" id="username" class="input-large"/>
									</td> 
									<th>
										手机号码：
									</th>
									<td>
										<input type="text" maxlength="20" name="userphnoe" style="width:110px" id="MOBILE" class="input-large"/>
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
								登录用户个人信息
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
						<dg:grid container="user_div" id="user_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="list.user.daili" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="提取收益金额" onClick="dopreeds" id="EDIT_USER" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$CREATE_USER">
									<dg:action label="用户注册" onClick="createusers" id="CREATE_USER" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="提取红包基金" onClick="tiqujijin" id="QIANG_USER" icon="/statics/images/ico_role_extend.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="yhdxdh" width="0" header="用户ID" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="username" width="15" header="用户名" type="ro" align="center"></dg:column>
							<dg:column id="crje" width="8" header="存入金额" type="ro" align="center"></dg:column>
							<dg:column id="rsy" width="8" header="日收益" type="ro" align="center"></dg:column>
							<dg:column id="hbjj" width="8" header="红包基金" type="ro" align="center"></dg:column>
							
							<dg:column id="aggreatMount" width="8" header="红包总额" type="ro" align="center"></dg:column>
							<dg:column id="Status" width="8" header="状态" type="ro" align="center"></dg:column>
							<dg:column id="yhjb" width="12" header="用户级别" type="ro" align="center"></dg:column>
							<dg:column id="qsrq" width="10" header="起始日期" type="ro" align="center"></dg:column>
							<dg:column id="jsrq" width="10" header="结束日期" type="ro" align="center"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
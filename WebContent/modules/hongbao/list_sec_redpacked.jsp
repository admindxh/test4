<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<%@ include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,messagebox"></ui:combine>
		<ui:script src="/modules/hongbao/script/list_sec_redpacked.js"></ui:script>
	</head>
	<script type="text/javascript">
			var orgId = '${param.orgId}';
			var orgName = '${param.orgName}';
 	</script>
	<body class="container-body">
		<div class="container-fluid">
		<div class="grid-page">
			<div class="page-title">
				<h2>红包池列表</h2>
			</div>
			<!--搜索框 -->
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
							                  用户名称：
								</th>
								<td>
									<input type="text" name="username" id="username" class="input-large"/>
								</td>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$EDIT_WORKFLOW_ROLE")) {%>
								<th>
									 红包类型：
								</th>
								<td>
									<select id="hbfl" name="hbfl">
										<option value=""></option>
										<option value="0">普通红包</option>
										<option value="1">群发红包</option>
									</select>
								</td>
								<%}%>
								<td class="toolbar-btns" rowspan="3">
									<button type="button" class="btn" onclick="role_grid.doSearch();">查询</button>
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
								红包池信息列表
							</div>
							<div class="span6">
								<!-- 工具栏  -->	
								<div class="pull-right">
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$CREATE_ROLE")) {%>
									<a  class="btn" href="javascript:" onclick="qunfaRedpackge()"><i class="icon-plus"></i>群发红包</a>
									<%}%>
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$DELETE_ROLE")) {%>
									<a class="btn" href="javascript:" onclick="putongRedpackge()"><i class="icon-plus"></i>普通红包</a>
									<%}%>
									<%if (SecurityContext.hasPermission("ROLE_MANAGE$DELETE_ROLE")) {%>
									<a class="btn" href="javascript:" onclick="qiangRedpackge()"><i class="icon-plus"></i>抢红包</a>
									<%}%>
								</div>
							</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="role_div" id="role_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="list.hongbaochi.guanli" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							
							<dg:column id="hbcID" width="0" header="ID" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="hbnumber" width="8" header="红包个数" type="ro" align="center"></dg:column>
					
							<dg:column id="aggreate" width="8" header="总金额" type="ro" align="center"></dg:column>
							<dg:column id="hblb" width="8" header="红包类别" type="ro" align="center"></dg:column>
							<dg:column id="notes1" width="8" header="备注" type="ro" align="center"></dg:column>
							
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
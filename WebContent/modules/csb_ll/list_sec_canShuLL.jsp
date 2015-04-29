<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>设置红包系统参数</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="modules/csb_ll/script/list_sec_canShuLL.js"></ui:script>
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
					<h2>红包系统参数列表</h2>
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
										是否启用：
									</th>
									<td>
										<select name='activate' multiple="multiple" data-widget="multiselect">
											<option value='' selected="selected"></option>
											<option value='1'>启用</option>
											<option value='0'>未启用</option>
										</select>
									</td>
								
									<th>
										利率分类：
									</th>
									<td>
									
									  <td>
										<input type="text" name="llfl" id="llfl" class="input-large"/>
									  </td>
									
									<!--<select name="commodityClassName" id="commodityClass">
									    <option value=""></option>	   	
										<option value="厨房电器">厨房电器</option>
										<option value="个人护理">个人护理</option>
										<option value="电子产品">电子产品</option>     	
									 </select>
									 
									 
									--></td>
									<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="cslb_grid.doSearch();">查询</button>
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
								红包系统参数列表
							</div><!--工具栏-->
							<div class="span6">
								<div class="pull-right"> 
								 
										
									   <security:isAllow privilege="USER_MANAGE$CREATE_USER">
										    <a class="btn" href="javascript:void(0):" onclick="createXTCANSHU()"><i class="icon-plus"></i>新增系统参数信息</a>	
										</security:isAllow>
										<security:isAllow privilege="USER_MANAGE$CREATE_USER">
										    <a class="btn" href="javascript:void(0);" onclick="deleteXTCSties()"><i class="icon-remove"></i>批量删除参数信息</a>	
										</security:isAllow>
									
									
								  </div>
								
							</div>
								  
								  
						</div>
						
								   
								   
				  </div>
				  
				  
				  
			</div>
						</div>
						<a href="#" class="toggle"></a>	
					</div>
					<div class="panel-content">
						<dg:grid container="user_div" id="cslb_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="csbll_list_key" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="修改" onClick="updateXTCS" id="modify_user" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								
								<security:isAllow privilege="USER_MANAGE$DELETE_USER">
									<dg:action label="删除" onClick="deleteXTCS" id="delete_user" icon="/statics/images/ico_del.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="llbh" width="5" header="利率编号" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="llfl" width="12" header="利率分类" type="ro" align="center"></dg:column>
							<dg:column id="szrq" width="12" header="设置日期" type="ro" align="center"></dg:column>
							<dg:column id="llbl" width="8" header="利率比例" type="ro" align="center"></dg:column>
							<dg:column id="activate" width="12" header="是否启用" type="ro" align="center"></dg:column>
							<dg:column id="usernum" width="8" header="发展人数" type="ro" align="center"></dg:column>
							<dg:column id="status" width="8" header="状态" type="ro" align="center"></dg:column>
				            <dg:column id="ztms" width="12" header="状态描述" type="ro" align="center"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
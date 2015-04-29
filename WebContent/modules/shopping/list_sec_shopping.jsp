<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>商品管理列表</title>	
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
		<ui:script src="modules/shopping/script/list_sec_shopping.js"></ui:script>
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
					<h2>商品列表</h2>
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
										商品名称：
									</th>
									<td>
										<input type="text" maxlength="20" name="commodityName" style="width:110px" id="commodityName" class="input-large"/>
									</td> 
								
									<th>
										商品种类：
									</th>
									<td>
									
									   <ui:select id="commodityClassName" 
									           name="commodityClassID" 
									           readonly="true"
									           source="sqlId:commodity.combobutton.getCommodityClass" 
									           defaultValue="11" 
									           daoName="dao" 	
									           params="{commodityClassID:'11',cmmodityClassName:'个人护理'}"								                                                      
									           emptyText="--选择--">
									     
									    </ui:select>
									
									<!--<select name="commodityClassName" id="commodityClass">
									    <option value=""></option>	   	
										<option value="厨房电器">厨房电器</option>
										<option value="个人护理">个人护理</option>
										<option value="电子产品">电子产品</option>     	
									 </select>
									 
									 
									--></td>
									<td class="toolbar-btns" rowspan="3">
										<button type="button" class="btn" onclick="shopping_grid.doSearch();">查询</button>
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
							</div><!--工具栏-->
							<div class="span6">
								<div class="pull-right"> 
								 
										
									   <!--<security:isAllow privilege="USER_MANAGE$CREATE_USER">
										<a class="btn" href="./commodity/commodityList.jsp">商品管理</a>
										</security:isAllow>
										 --><security:isAllow privilege="USER_MANAGE$CREATE_USER">
										    <a class="btn" href="javascript:void(0):" onclick="createShopping()"><i class="icon-plus"></i>新增商品信息</a>	
										</security:isAllow>
										<security:isAllow privilege="USER_MANAGE$CREATE_USER">
										    <a class="btn" href="javascript:void(0);" onclick="deleteCommodities()"><i class="icon-remove"></i>批量删除商品信息</a>	
										</security:isAllow>
										<security:isAllow privilege="USER_MANAGE$CREATE_USER">
										<a class="btn" href="./list_sec_commodityClass.jsp" >商品种类管理</a>
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
						<dg:grid container="user_div" id="shopping_grid" loadOnFirst="false" onAfterGridScriptLoad="loadData">
							<dg:datasource selectSqlId="shopping.list.sql" includePageParams="true"></dg:datasource>
							<dg:checkAllColumn></dg:checkAllColumn>
							<dg:operationColumn onBeforeMenuRender="doOnBeforeMenuRender">
								
								<security:isAllow privilege="USER_MANAGE$EDIT_USER">
									<dg:action label="修改商品信息" onClick="updateCommodity" id="modify_user" icon="/statics/images/ico_edit.gif"></dg:action>
								</security:isAllow>
								
								<security:isAllow privilege="USER_MANAGE$DELETE_USER">
									<dg:action label="删除商品" onClick="deleteCommodity" id="delete_user" icon="/statics/images/ico_del.gif"></dg:action>
								</security:isAllow>
							</dg:operationColumn>
							<dg:column id="commodityId" width="5" header="商品ID" type="ro" align="center" visible="false" isKey="true"></dg:column>
							<dg:column id="commodityName" width="12" header="商品名称" type="ro" align="center"></dg:column>
							<dg:column id="commodityClassName" width="12" header="商品分类" type="ro" align="center"></dg:column>
							<dg:column id="manufacturer" width="15" header="生产厂家" type="ro" align="center"></dg:column>
							<dg:column id="commodityPrice" width="12" header="商品价格" type="ro" align="center"></dg:column>
							<dg:column id="fcPrice" width="12" header="帆成网价格" type="ro" align="center"></dg:column>
							<dg:column id="commodityAmount" width="12" header="商品总数量" type="ro" align="center"></dg:column>
							<dg:column id="commodityLeaveNum" width="12" header="商品剩余数量" type="ro" align="center" ></dg:column>
							<dg:column id="regTime" width="12" header="商品上架时间" type="ro" align="center"></dg:column>
						</dg:grid>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
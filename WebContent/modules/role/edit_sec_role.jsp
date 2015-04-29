<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>
			<c:choose>
				<c:when test="${empty param.roleId}">
					新建角色信息
				</c:when>
				<c:otherwise>
					编辑角色信息
				</c:otherwise>
			</c:choose>
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,blockui,dialog"></ui:combine>
		<ui:script src="/modules/role/script/edit_sec_role.js"></ui:script>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.roleId}">
						新建角色信息
					</c:when>
					<c:otherwise>
						编辑角色信息
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="USF_ROLE_EDIT_FORM" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">							
								<c:choose>
									<c:when test="${empty param.roleId}">
										新建角色信息
									</c:when>
									<c:otherwise>
										编辑角色信息
									</c:otherwise>
								</c:choose>
							</div>
							<div class="span6"></div>	
						</div>
						<a href="#" class="toggle"></a>
					</div>
					<!-- panel 头部内容 end -->
					
					<!-- panel 中间内容 start -->
					<div class="panel-content">
						<!-- 数据列表样式 -->
						<table class="form-table col2-fluid" >
							<!--<caption>基本信息</caption>-->
							<tbody>
							    <input type="hidden" name="id" id="id" value="${role.id}"/>
							    <tr>
									<th>
										角色名称：
									</th>
									<td>
										<input type="text" id="name" value="${role.name}" data-validator="required,func[checkUniqueRoleName]" maxlength="50"  style="width: 98%;" class="input-large"/>
									</td>
								</tr>
								<%if (SecurityContext.hasPermission("ROLE_MANAGE$EDIT_WORKFLOW_ROLE")) {%>
								<tr>
									<th>角色类型：</th>
									<td>
										<select id="type" name="type" style="width: 98%;">
											<option <c:if test="${role.type==0}">selected="selected"</c:if> value="0">功能角色</option>
											<option <c:if test="${role.type==1}">selected="selected"</c:if> value="1">流程角色</option>
											<option <c:if test="${role.type==2}">selected="selected"</c:if> value="2">混合角色</option>
										</select>
									</td>
								</tr>
								<%}%>
								<tr>
									<th>角色描述：</th>
									<td height="100px">
										<textarea id="description" style="width: 98%;overflow: auto;" data-validator="length[0,300]" rows="6" class="input-large">${role.description}</textarea>
									</td>
								</tr>
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col2-fluid">
							<button type="button" class="btn"  onclick="doSave();return false;">保&nbsp;存</button>
							<button type="button" class="btn" onclick="$(this).dialogClose();">关&nbsp;闭</button>
						</div>
					</div>
				</div>
				<!-- panel 内容 end -->
			</form>
		</div>
	</div>
	</body>
</html>
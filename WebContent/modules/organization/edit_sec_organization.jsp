<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>
		   <c:choose>
				<c:when test="${empty param.orgId}">
					注册组织信息
				</c:when>
				<c:otherwise>
					修改组织信息
				</c:otherwise>
			</c:choose>
        </title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,blockui,dialog"></ui:combine>
		<ui:script src="/modules/organization/script/edit_sec_organization.js"></ui:script>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.orgId}">
						注册组织信息
					</c:when>
					<c:otherwise>
						修改组织信息
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="USF_ORGANIZATION_EDIT_FORM" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">							
								<c:choose>
									<c:when test="${empty param.orgId}">
										注册组织信息
									</c:when>
									<c:otherwise>
										修改组织信息
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
							    <c:choose>
									<c:when test="${empty param.orgId}">
										<input type="hidden" name="parent" id="parent" value="${param.parentId}"/>
									</c:when>
									<c:otherwise>
										<input type="hidden" id="id" name="id" value="${param.orgId}"/>
										<input type="hidden" name="parent" id="parent" value="${org.parent}"/>
									</c:otherwise>
								</c:choose>
								<tr>
									<th>上级组织：</th>
									<td colspan="3" id="parent_name">${param.parentName}</td>
								</tr>
								<tr>
									<th>
									           组织名称：
									</th>
									<td colspan="3" >
										<input type="text" id="name"  maxlength="75" data-validator="required,length[0,75]" style="width:97%;" class="input-large" value="${org.name}"/>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:tvns>
	<head>
	    	<%@include file="/common/meta.jsp"%>
			<title>
				<c:choose>
					<c:when test="${empty param.id}">
						注册操作信息
					</c:when>
					<c:otherwise>
						编辑操作信息
					</c:otherwise>
				</c:choose>
			</title>
			<ui:combine widgets="validator,inputpro,blockui,dialog"></ui:combine>
			<ui:script src="modules/function/operation/script/edit_sec_operation.js"></ui:script>
	</head>

	<body class="container-body">
		<div class="apply-page">
			<div class="page-title">
				<h2>
					<c:choose>
						<c:when test="${empty param.id}">
							注册操作信息
						</c:when>
						<c:otherwise>
							编辑操作信息
						</c:otherwise>
					</c:choose>
				</h2>
			</div>
			
			<div class="container-fluid">
		        <form id="AIP_SYSTEM_FUNCTION_EDIT_FORM" action="#" data-widget="validator" class="form-horizontal" >
		        	<input type="hidden" id="type" value="Element" />
		        	<c:choose>
						<c:when test="${empty param.id}">
							<input type="hidden" id="parent" value="${param.parentId}"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="id" value="${param.id}"/>
							<input type="hidden" id="parent" value="${operation.parent}"/>
						</c:otherwise>
					</c:choose>
					<!-- panel 内容 start -->
					<div class="panel apply-panel">
						<!-- panel 头部内容 start -->
						<div class="panel-head">
							<div class="row-fluid">
								<div class="span6 first">							
									<c:choose>
										<c:when test="${empty param.id}">
											注册操作信息
										</c:when>
										<c:otherwise>
											编辑操作信息
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
								    <tr>
										<th>
											所属功能：
										</th>
										<td>
											${param.parentName}
										</td>
									</tr>
									<tr>
										<th>
											操作名称：
										</th>
										<td>
											<input type="text" id="name" data-validator="required,length[0,150]" value="${operation.name}" maxlength="150" style="width: 98%;" class="inputTxt" />
										</td>
									</tr>
									<tr>
										<th>
											操作代码：
										</th>
										<td >
											<input type="text" id="code" data-validator="required,length[0,50],func[checkUniqueCode]" value="${operation.code}" maxlength="50" style="width: 98%;" class="inputTxt"/>
										</td>
									</tr>
									<tr>
										<th>
											操作描述：
										</th>
										<td>
											<textarea name="description" style="width: 98%;" rows="3" class="textarea" data-validator="length[0,3000]">${operation.description}</textarea>
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
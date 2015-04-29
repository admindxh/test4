<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%><html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/common/meta.jsp"%>
		<title>个人密码设置</title>
		<base target="_self"/>
		<ui:combine widgets="validator,blockui,messagebox"></ui:combine>
		<ui:script src="/modules/user/script/set_personal_password.js"></ui:script>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
				个人密码设置
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="USF_USER_EDIT_FORM" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">							
								个人密码设置
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
							    <input type="hidden" name="userId" id="userId" value="<%=SecurityContext.getCurrentUser().getId()%>" />
							    <tr>
									<th>用户名称：</th>
									<td><label><%=SecurityContext.getCurrentUser().getName() %></label></td>
								</tr>
								<tr>
									<th>
										旧密码：
									</th>
									<td colspan="1" id = 'checkPassTd'>
										<input type="password"  id="oldPassword" data-validator="required[旧密码不能为空]" maxlength="40" style="width: 150px;" class="inputTxt" />
									</td>
								</tr>
								<tr>
									<th>
										新密码：
									</th>
									<td colspan="1">
										<input type="password"  id="password" data-validator="required[密码不能为空],equalToField[confirmPassword,密码和确认密码不一致]"  maxlength="40" style="width: 150px;" class="inputTxt" />
									</td>
								</tr>
								<tr>
									<th>
										确认密码：
									</th>
									<td colspan="1" id = 'checkPassTd'>
										<input type="password"  id="confirmPassword" data-validator="required,equalToField[password,密码和确认密码不一致]" maxlength="40"  style="width: 150px;" class="inputTxt"/>
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
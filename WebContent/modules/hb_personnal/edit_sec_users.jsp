<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.yhdxdh}">
					新建用户信息
				</c:when>
				<c:otherwise>
					编辑用户信息
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/hb_personnal/script/edit_sec_users.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${hbdXuser.yhdxdh}';
		</script>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.yhdxdh}">
						新建用户信息
					</c:when>
					<c:otherwise>
						编辑用户信息
					</c:otherwise>
				</c:choose>	
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="SEC_USER_FOMR" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">							
								<c:choose>
									<c:when test="${empty param.yhdxdh}">
										新建用户信息
									</c:when>
									<c:otherwise>
										编辑用户信息
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
						<table class="form-table col4-fluid" >
							<!--<caption>基本信息</caption>-->
							<tbody>
							    <input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdxuser.yhdxdh}"/>
				               						   
								<tr>
								    <th>
										用户名称：
									</th>
									<td>
									     <input type="text" id="username" name="username" data-validator="required[用户名不能为空]" maxlength="20" style="width: 180px;" class="input-large" value="${hbdXuser.username}"/>
									</td>
									<th>
										激 活 码：
									</th>
									<td>
										 <input  type="text" onblur="check(this.value);" id="userjhm" name="userjhm" data-validator="required[激活码不能为空]" style="width: 180px;" class="input-large"	minlength="18" value="${hbdXuser.userjhm}"/>
									</td>
								</tr>
								<tr>
									<th>
										存入金额：
									</th>
									<td>
										<input type="text"  id="crje" name="crje" data-validator="required" maxlength="20" style="width: 180px;" class="input-large" value="${hbdXuser.crje}"/>
									</td>
									<th>
										手机号码：
									</th>
									<td style="text-align: left;" >
								    	<input type="text" id="userphnoe" data-validator="mobile,required"  name="userphnoe" maxlength="20"  style="width: 180px;" class="input-large" value="${hbdXuser.userphnoe}"/> </label>
									</td>
								</tr>
								<c:if test="${empty param.userId}">
									<tr>
										<th>
											登录密码：
										</th>
										<td colspan="1" >
											<input type="password"  id="password" data-validator="required[密码不能为空],equalToField[checkNewPassword,密码和确认密码不一致]"  maxlength="40" style="width: 180px;" class="input-large" />
										<th id = 'checkPassTh'>
											确认密码：
										</th>
										<td colspan="1" id = 'checkPassTd'>
											<input type="password"  id="checkPassword" data-validator="required,equalToField[password,密码和确认密码不一致]" maxlength="40"  style="width: 180px;" class="input-large"/>
										</td>
										<td colspan="2" id = "hideTd" style="display: none"></td>
									</tr>
								</c:if>
								<tr>
									<th>
									            介绍人:
									</th>
									<td>
										<input type="text" id="email" name="userphone"  value="<%=request.getAttribute("name")%>"/>
									</td>
									<th>
										 备 &nbsp;&nbsp;注：
									</th>
									<td>
										<input type="text"  id="notes1" name="notes1"  maxlength="20" style="width: 180px;" class="input-large" value="${hbdXuser.notes1}"/>
									</td>
								</tr>
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSave();return false;"><i class="icon-save"></i>保&nbsp;存</button>
							<button type="button" class="btn" onclick="$(this).dialogClose();return false;"><i class="icon-close"></i>关&nbsp;闭</button>
						</div>
					</div>
				</div>
				<!-- panel 内容 end -->
			</form>
		</div>
	</div>
	</body>
</html>
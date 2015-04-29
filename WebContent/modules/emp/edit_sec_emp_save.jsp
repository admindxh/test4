<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.empno}">
					新建用户信息
				</c:when>
				<c:otherwise>
					编辑用户信息
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/emp/script/edit_sec_emp.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${emp.empno}';
		</script>
	</head>
	
	<body class="container-body">
	   <div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.empno}">
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
									<c:when test="${empty param.empno}">
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
							    <input type="hidden" name="id" id="id" value="${emp.empno}"/>
				               								   
								<tr>
								    <th>
										员工姓名：
									</th>
									<td>
									     <input type="text"  id="ename" name="ename" data-validator="required" maxlength="20" style="width: 180px;" class="input-large" value="${employee.ename}"/>
									</td>
									<th>
										COMM：
									</th>
									<td>
										 
										 <input type="text" name="comm" id="comm" class="input-large" data-validator="required" style="cursor:pointer;width: 180px;" value="${employee.comm}" />
									</td>
								</tr>
								<tr>
									<th>
										职位：
									</th>
									<td>
										<input type="text" data-validator="required" id="job"  style="width: 180px;" class="input-large"	maxlength="38" value="${employee.job}"/>
									</td>
									<th>
										MGR：
									</th>
									<td><input type="text" id="mgr" data-validator="required" maxlength="100"  style="width: 180px;" class="input-large" value="${employee.mgr}"/></td>

								</tr>
								
									<tr>
										<th>
											部门编号：
										</th>
										<td colspan="1" >
											<input type="text"  id="deptno" data-validator="required"  maxlength="40" style="width: 180px;" class="input-large" value="${employee.deptno}"/>
										<th>
										员工编号：
									    </th>
									    <td><input type="text" id="empno" data-validator="required"  maxlength="20"  style="width: 180px;" class="input-large" value="${employee.empno}"/>
									        </td>
									   				
									</tr>
								
								<tr>
									<th>
										入职时间：
									</th>
									<td><input type="text" id="hiredate" data-validator="date" maxlength="100"  style="width: 180px;" class="input-large" value="${employee.hiredate}"/></td>
									<th>
										薪水：
									</th>
									<td><input type="text" id="sal" data-validator="required"  maxlength="20"  style="width: 180px;" class="input-large" value="${employee.sal}"/></td>
									<!--<th>
										部门编号：
									</th>
									<td><input type="text" id="mobilePhone" data-validator="mobile"  maxlength="20"  style="width: 180px;" class="input-large" value="${user.mobile_Phone}"/></td>
									<th>
										部门名称：
									</th>
									<td><input type="text" id="mobilePhone" data-validator="mobile"  maxlength="20"  style="width: 180px;" class="input-large" value="${user.mobile_Phone}"/></td>
								--></tr>
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSaveEmployee();return false;"><i class="icon-save"></i>保&nbsp;存</button>
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
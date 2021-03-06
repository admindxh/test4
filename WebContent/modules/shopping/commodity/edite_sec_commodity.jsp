<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.commodityId}">
					新建商品信息
				</c:when>
				<c:otherwise>
					编辑商品信息
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/shopping/script/edit_sec_commodity.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${commodity.commodityId}';
		</script>
	</head>
	
	<body class="container-body">
	   <div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.commodityId}">
						新建商品信息
					</c:when>
					<c:otherwise>
						编辑商品信息
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
									<c:when test="${empty param.commodityId}">
										新建商品信息
									</c:when>
									<c:otherwise>
										编辑商品信息
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
							    <input type="hidden" name="commodityId" id="commodityId" value="${commodity.commodityId}"/>
				               								   
								<tr>
								    <th>
										商品名称：
									</th>
									<td>
									     <input type="text"  id="commodityName" name="commodityName" data-validator="required" maxlength="20" style="width: 180px;" class="input-large" value="${commodity.commodityName}"/>
									</td>
									<th>
										商品分类：
									</th>
									<td>
										 
										 <input type="text" name="commodityClass" id="commodityClass" class="input-large" data-validator="required" style="cursor:pointer;width: 180px;" value="${commodity.commodityClass}" />
									</td>
								</tr>
								<tr>
									<th>
										生产厂家：
									</th>
									<td>
										<input type="text" data-validator="required" id="manufacturer"  style="width: 180px;" class="input-large"	maxlength="38" value="${commodity.manufacturer}"/>
									</td>
									<th>
										商品价格：
									</th>
									<td><input type="text" id="commodityPrice" data-validator="required" maxlength="100"  style="width: 180px;" class="input-large" value="${commodity.commodityPrice}"/></td>

								</tr>
								
									<tr>
										<th>
											网络商城价格：
										</th>
										<td colspan="1" >
											<input type="text"  id="fcPrice" data-validator="required"  maxlength="40" style="width: 180px;" class="input-large" value="${commodity.fcPrice}"/>
										<th>
										商品总数量：
									    </th>
									    <td><input type="text" id="commodityAmount" data-validator="required"  maxlength="20"  style="width: 180px;" class="input-large" value="${commodity.commodityAmount}"/>
									        </td>
									   				
									</tr>
								
								<tr>
									<th>
										剩余商品数量：
									</th>
									<td><input type="text" id="commodityLeaveNum" data-validator="required" maxlength="100"  style="width: 180px;" class="input-large" value="${commodity.commodityLeaveNum}"/></td>
									<th>
										商品上架时间：
									</th>
									<td><input type="text" id="regTime" data-validator="required"  maxlength="20"  style="width: 180px;" class="input-large" value="${commodity.regTime}"/></td>
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
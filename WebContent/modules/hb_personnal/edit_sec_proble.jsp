<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.yhdxdh}">
					常见问题分类录入
				</c:when>
				<c:otherwise>
					常见问题分类录入
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/hb_personnal/script/edit_sec_userdenglu.js"></ui:script>
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
						常见问题分类录入
					</c:when>
					<c:otherwise>
						常见问题分类录入
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
									<c:when test="${empty param.id}">
										常见问题分类录入
									</c:when>
									<c:otherwise>
										常见问题分类录入
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
							    <input type="hidden" name="id" id="id" value="${hbproble.id }"/>
				               						   
								<tr>
								    <th>
										基本介绍:
									</th>
									<TD><textarea class="input-large" id="jbjs" cols="50" rows="5" name="jbjs" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea></TD>
								</tr>
								<tr>
								    <th>
										操作方法:
									</th>
									<TD><textarea class="input-large" id="czff" name="czff" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea></TD>
									
								</tr>
								<tr>
								    <th>
										提现问题:
									</th>
									
									 <TD><textarea class="input-large" id="txwt" name="txwt" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea></TD>
									
								</tr>	
								<tr>
								    <th>
										联系方式:
									</th>
									<td>
									     <input type="text"  id="lxfs" name="lxfs" data-validator="required" maxlength="20" style="width: 180px;" class="input-large" value="${hbdXuser.userphnoe}"/>
									</td>
								</tr>	
								<tr>
								    <th>
										红包币的未来:
									</th>
									
									<TD><textarea class="input-large" id="hbbresult" name="hbbresult" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea></TD>
									
								</tr>	
								<tr>
								    <th>
										如何发红包/红包币:
									</th>
									<td>
									    <textarea class="input-large" id="notes" name="notes" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea>
									</td>
								</tr
								<tr>
								    <th>
										如何收红包/红包币:
									</th>
									<td>
									    <textarea class="input-large" id="notes1" name="notes1" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea>
									</td>
								</tr>		
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSave();return false;"><i class="icon-save"></i>录&nbsp;入</button>
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
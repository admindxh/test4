<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>操作日志详细信息</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="dialog"></ui:combine>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
				操作日志详细信息
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
								操作日志详细信息
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
							    <tr>
									<th>
										操作人：
									</th>
									<td colspan="1" style="text-align: left">
										<label id="OPERATOR_NAME">${log.userName}</label>
									</td>
									<th>
										操作时间：
									</th>
									<td colspan="1" style="text-align: left">
										<label id="OPERATION_TIME">${log.operationTime}</label>
									</td>
								</tr>
								<tr>
									<th>操作名称：</th>
									<td colspan="3" style="text-align: left">
										<label id="OPERATION_NAME">${log.operationName}</label>
									</td>
								</tr>
								<tr>
									<th>日志内容：</th>
									<td colspan="3">
										<textarea id="DESCRIPTION" style="width: 98%;" rows="3" readonly="readonly" class="input-large">${log.description}</textarea>
									</td>
								</tr>								   
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
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
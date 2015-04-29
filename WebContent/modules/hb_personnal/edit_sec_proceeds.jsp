<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.yhdxdh}">
				      提取收益金额
				</c:when>
				<c:otherwise>
				   提取红包基金
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/hb_personnal/script/edit_sec_exchange.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${hbdXuser.yhdxdh}';
		</script>
		<script type="text/javascript">
			function addsaveputong(){
					var c=document.getElementById("aggreatMount").value;
			        var n=document.getElementById("llfl").value;
			        document.getElementById("hbb").value=c*n;	
		}
		</script>
		
	</head>
	
	<body class="container-body">
	   <div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.yhdxdh}">
						 提取收益金额
					</c:when>
					<c:otherwise>
						 提取红包基金
					</c:otherwise>
				</c:choose>	
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="SEC_EXCHANGE_FOMR" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">	
										
								<c:choose>
									<c:when test="${empty param.yhdxdh}">
										 提取收益金额
									</c:when>
									<c:otherwise>
										 提取红包基金
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
				               <TR>
								     <th>红包日收益：</th>
								   <td>
								   		<input type="text" id="aggreatMount" data-validator="required" readonly="readonly" onblur="addsaveputong()" maxlength="20"   style="width: 330px;" class="input-large" value="<%=request.getAttribute("number")%>"/>
									</td>
								  </TR>
								  <TR>
								    <th>红包总收益：</th>
									<td>
										<input type="text" id="llfl" data-validator="required" readonly="readonly"  maxlength="20"  onblur="addsaveputong()" style="width: 330px;" class="input-large" value="<%=request.getAttribute("sum")%>"/>
										
									</td>
									
								  </TR>
								  <TR>
								    <th>备&nbsp;&nbsp;&nbsp; 注：</th>
								    <TD><textarea class="input-large" id="notes2" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]" ><%=request.getAttribute("titleString")%></textarea></TD>
								  </TR>
								  
								 
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doproceeds();return false;"><i class="icon-save"></i>提&nbsp;取</button>
							<button type="button" class="btn" onclick="$(this).dialogClose();return false;"><i class="icon-close"></i>取&nbsp;消</button>
						</div>
					</div>
				</div>
				<!-- panel 内容 end -->
			</form>
		</div>
	</div>
	</body>
</html>
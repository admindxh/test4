<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.yhdxdh}">
				       普通红包信息
				</c:when>
				<c:otherwise>
				    普通红包信息
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/hongbao/script/edit_sec_paihongbao.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${hbdXuser.yhdxdh}';
		</script>
		<script type="text/javascript">
			function addsaveputong(){
					var c=document.getElementById("hbgs").value;
			        var n=document.getElementById("everyoneTotal").value;
			        document.getElementById("aggreatMount").value=c*n;	
		}
		</script>
		
	</head>
	
	<body class="container-body">
	   <div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.yhdxdh}">
						普通红包信息
					</c:when>
					<c:otherwise>
						  普通红包信息
					</c:otherwise>
				</c:choose>	
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="SEC_PUTONG_FOMR" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">	
										
								<c:choose>
									<c:when test="${empty param.yhdxdh}">
										普通红包
									</c:when>
									<c:otherwise>
										普通红包
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
							   <input type="hidden" name="yhdxdh" id="id" value="${hbdXuser.yhdxdh}"/>
				               
								  <TR>
								     <th>红  包  个  数：</th>
								   <td><input type="text" id="hbgs" data-validator="required"  maxlength="20"  onblur="addsaveputong()" style="width: 330px;" class="input-large" value="${hbdXuser.hbgs}"/>
									</td>
								  </TR>
								  <TR>
								    <th>单 个 金  额：</th>
									<td>
										<input type="text" data-validator="required" id="everyoneTotal"  onblur="addsaveputong()"  style="width: 330px;" class="input-large"	maxlength="38" value="${hbdXuser.aggreatMount}"/>
									</td>
									
								  </TR>
								  <TR>
								    <th>红 包 总 额：</th>
									<td>
										<input type="text" data-validator="required" readonly="true" id="aggreatMount"  style="width: 330px;" class="input-large"	maxlength="38" value="${hbdXuser.aggreatMount} "/>
									</td>
									
								  </TR>
								  <TR>
								    <th>备                   注：</th>
								    <TD><textarea class="input-large" id="notes2" cols="50" rows="5" style="width: 330px;height=24;"  validator="length[0,300]">${hbdXuser.notes2}</textarea></TD>
								  </TR>
								  
								 
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSaveputong();return false;"><i class="icon-save"></i>保&nbsp;存</button>
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
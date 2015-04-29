<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>
		    <c:choose>
				<c:when test="${empty param.llbh}">
					设置红包系统参数
				</c:when>
				<c:otherwise>
					编辑参数信息
				</c:otherwise>
			</c:choose>	
		</title>
		<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/modules/csb_ll/script/edite_sec_canShuLL_add.js"></ui:script>
		<script type="text/javascript">
			var org_id = '${canShuLL.llbh}';
		</script>
		
		<script type="text/javascript">
		  
            function add() {
               var d = new Date();
              
               document.getElementById("szrq").value =  d.getYear()+'-'+d.getMonth()+1+'-'+d.getDate();
               
        }
  
		</script>
	</head>
	
	<body class="container-body">
	   <div class="apply-page">
		<div class="page-title">
			<h2>
				<c:choose>
					<c:when test="${empty param.llbh}">
						设置红包系统参数
					</c:when>
					<c:otherwise>
						编辑参数信息
					</c:otherwise>
				</c:choose>	
			</h2>
		</div>
		
		<div class="container-fluid">
	        <form id="SEC_COMMODITY_FOMR" action="#" data-widget="validator" class="form-horizontal" >
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">	
										
								<c:choose>
									<c:when test="${empty param.llbh}">
										设置红包系统参数
									</c:when>
									<c:otherwise>
										编辑参数信息
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
							   <input type="hidden" name="llbh" id="id" value="${canShuLL.llbh}"/>
				               								   	     
								  
								  <TR>
								   <th>利率分类：</th>
								    <td>
								     <input type="text"  id="llfl" name="llfl" data-validator="required"  onblur="add()"  maxlength="20" style="width: 180px;" class="input-large" value="${canShuLL.llfl}"/>
								       
								    </td>
								     <th>设置时间：</th>
								     <td>
										<input type="text" data-validator="required" id="szrq" name="szrq" style="width: 180px;" class="input-large"	maxlength="38" value="${canShuLL.szrq}"/>
									</td>
									
								  </TR>
								 
								  <TR>
								    <th>利率比例：</th>
								    <td>
										<input type="text" data-validator="required" id="llbl"  name="llbl" style="width: 180px;" class="input-large"	maxlength="38" value="${canShuLL.llbl}"/>
									</td>
								     <th>
										是否启用：
									</th>
									<td>
										<select name='activate' data-widget="multiselect" style="width: 180px;">
											<option value='' selected="selected"></option>
											<option value='1' selected="selected">启用</option>
											<option value='0'>未启用</option>
										</select>
									</td>
								  </TR>
								 
								
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSaveCanshu();return false;"><i class="icon-save"></i>保&nbsp;存</button>
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
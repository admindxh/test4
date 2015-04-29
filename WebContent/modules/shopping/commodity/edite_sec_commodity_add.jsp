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
		
		<script type="text/javascript">
        function OP(){
        
		 var select1=document.getElementById("regTime").value;
		
		  alert(select1);
		 
		}
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
	        <form id="SEC_COMMODITY_FOMR" action="#" data-widget="validator" class="form-horizontal" >
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
							   <input type="hidden" name="commodityId" id="id" value="${commodity.commodityId}"/>
				               								   
								 <TR>
								    <TH colSpan=2 height=24>【新增商品】</TH> 
								  </TR>
								  <TR>
								   <th>商品名称：</th>
								    <td>
								     <input type="text"  id="commodityName" name="commodityName" data-validator="required" maxlength="20" style="width: 180px;" class="input-large" value="${commodity.commodityName}"/>
								       
								    </td>
								  </TR>
								  <TR>
								     <th>商品上架时间：</th>
								     <td>
										<input type="text" data-validator="required" id="regTime"  name="regTime" style="width: 180px;" class="input-large"	maxlength="38" value="${commodity.regTime}"/>
										
										<input type="button" value="点击" onclick="return OP()">
									</td>
								  
								    
								  <!--
								    <TD class=forumrow height=24>
								    <div align="right">商品分类：</div></TD>
								    <TD class=forumrowhighlight 
								      height=24>
								      <select name="commodityClassName" id="commodityClassName">
								      	 <option id="" name=""></option>
								      	 <option id="0">5</option>
								      	 <option id="1">10</option>
								      	 <option id="2">15</option>
								      </select>
								      </TD>
								  --></TR>
								  
								  <tr>
								     <th>商品种类：</th>
								     <td>
										<ui:select id="commodityClassName" 
									           name="commodityClass" 
									           readonly="readonly"
									           source="sqlId:commodity.combobutton.getCommodityClass" 
									           defaultValue="11" 
									          
									           params="{commodityID:'commodityID',cmmodityClass:'cmmodityClass'}"
									           daoName="dao" 									                                                      
									           emptyText="--选择--">
									           
									    </ui:select>
									</td>
								  </tr>
								  <TR>
								    <th>生产厂家：</th>
								    <td>
										<input type="text" data-validator="required" id="manufacturer"  style="width: 180px;" class="input-large"	maxlength="38" value="${commodity.manufacturer}"/>
									</td>
								  </TR>
								  <!--<TR>
								    <TD class=forumrow height=24><div align="right">商品图片：</div></TD>
								    <TD class=forumrowhighlight 
								      height=24><input type="file" name="uploadImage"></TD>
								  </TR>
								  --><TR>
								    <th>商品描述：</th>
								    <TD><textarea class="input-large" id="commodityDepict" cols="50" rows="5" style="width: 180px;height=24;"  validator="length[0,300]">${commodity.commodityDepict}</textarea></TD>
								  </TR>
								  <TR>
								    <th>商品价格：</th>
								    <td><input type="text" id="commodityPrice" data-validator="required" maxlength="100"  style="width: 180px;" class="input-large" value="${commodity.commodityPrice}"/></td>

								  </TR>
								  <TR>
								    <th>网络商城价格：</th>
								   <td colspan="1" >
											<input type="text"  id="fcPrice" data-validator="required"  maxlength="40" style="width: 180px;" class="input-large" value="${commodity.fcPrice}"/>
								  </TR>
								  <TR>
								     <th>商品总数量:</th>
								   <td><input type="text" id="commodityAmount" data-validator="required"  maxlength="20"  style="width: 180px;" class="input-large" value="${commodity.commodityAmount}"/>
									</td>
								  </TR>
								  <TR>
								    <th>
										剩余商品数量：
									</th>
									<td>
										<input type="text" data-validator="required" id="commodityLeaveNum"  style="width: 180px;" class="input-large"	maxlength="38" value="${commodity.commodityLeaveNum}"/>
									</td>
								  </TR>
							</tbody>
						</table>							
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col4-fluid">
							<button type="button" class="btn" onclick="doSaveCommodity();return false;"><i class="icon-save"></i>保&nbsp;存</button>
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
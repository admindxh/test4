<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<html>
	<head>
	    <title>角色对应的权限分配</title>
	    <%@include file="/common/meta.jsp"%>
		<ui:combine widgets="tree,blockui,dialog,messagebox"></ui:combine>
		<ui:script src="/modules/role/script/assignment_privilege.js"></ui:script>
		<script>
			var roleId = '${param.roleId}';
		    var selectedOperationRuleList = []; //已选操作规则的数组
		</script>
	</head>
	
	<body class="container-body">
	<div class="apply-page">
		<div class="page-title">
			<h2>
			温馨提示：您现在是给<font color="red">&nbsp;${param.roleName}&nbsp;</font>分配权限
			</h2>
		</div>
		
		<div class="container-fluid">
				<!-- panel 内容 start -->
				<div class="panel apply-panel">
					<!-- panel 头部内容 start -->
					<div class="panel-head">
						<div class="row-fluid">
							<div class="span6 first">							
								
							</div>
							<div class="span6"></div>	
						</div>
						<a href="#" class="toggle"></a>
					</div>
					<!-- panel 头部内容 end -->
					
					<!-- panel 中间内容 start -->
					<div class="panel-content">
						<div class="row-fluid" style="padding-top:2px;padding-bottom: 2px;">
							<div class="span8">
								<div id="treeDiv" style="height:450px;padding-top:3px;overflow: auto;vertical-align:top;">
								</div>
							</div>
												
							<div class="span4">
								<div id="dataEntityId" style="padding-left: 1px;width:100%;">
									<table style='border: 1px solid #A9D6F6;;border-collapse: collapse;padding:2px;width:100%;'>
									<tr>
										<td align='center' width='20%' style='border:1px solid #A9D6F6;background-color: #DFEAFB;height: 22px'>选择</td>
										<td align='center' width='*' style='border:1px solid #A9D6F6;background-color: #DFEAFB;height: 22px'>操作规则</td>
									</tr>
									</table>
								</div>
							</div>
						</div>						
					</div>
					<!-- panel 中间内容 end -->
                    <div class="panel-foot">
						<div class="form-actions col2-fluid">
							<button type="button" class="btn"  onclick="savePrivilege();return false;">保&nbsp;存</button>
				    		<button type="button" class="btn" onclick="$(this).dialogClose();">关&nbsp;闭</button>
						</div>
					</div>
				</div>
				<!-- panel 内容 end -->
		</div>
	</div>
	</body>
</html>
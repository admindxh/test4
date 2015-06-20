<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">红包提现</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
	<ui:script src="/web/red/js/login.js"></ui:script>
	<link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
<body>
	<!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">红包提现</span>
	</div>

	<form action="#" data-widget="validator" class="form-horizontal" id="SEC_HBB_FOMR">
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }">
	<div class="container transfer-info mt20">
		<p><span>账号：${yhdxdh }</span><span style="float:right;">尾号:${test }</span></p>
	</div>
	<div class="container transfer-info">
		<p><span>姓名：${username }</span><span style="float:right;">支行:xxxxxxxxx</span></p>
	</div>
	<div class="container transfer-info" id="inputPad">
		<div class="clearfix">
			<span>余额：${txjine }元</span>
			<div class="num-cover" style="width:50%;">
				<span>提现</span>
				<input type="text" id="num" name="aggreatMount" class="num bob" >
				<span>元</span>
			</div>
		</div>
	</div>

	<div class="container mt20">
		<a href="#" class="btn red-btn1" onClick="hbtixian()">提交</a>
	</div>
	</form>
</body>
</html>
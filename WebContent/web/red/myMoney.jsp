<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">我的零钱</title>
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
<body style="padding-bottom:20px;">
	<!-- header -->
	<div class="nav index-nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">我的零钱</span>
	</div>
	<form action="#" data-widget="validator" class="form-horizontal" id="SEC_HBB_FOMR">
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }">
  	<div class="container my-money">
    	<img src="${contextPath}/web/red/res/images/my-money.png" alt="">
    	<p>我的零钱</p>
    	<p class="mtext">￥<span>${txjine }</span></p>
  	</div>

  	<div class="container mt20">
		<a href="#" class="btn green-btn" onClick="chongzhi()">充值</a>
	</div>

  	<div class="container mt20">
		<a href="#" class="btn white-btn" onClick="toRMBDH()">红包基金兑换</a>
	</div>
	</form>
</body>
</html>
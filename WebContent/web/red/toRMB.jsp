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
	
	<style>
      .to-rmb{background:#141a32;padding:15px;}
      .to-rmb p{font-size:1.6rem;color:#fff;line-height:3rem;text-align:center;}
    </style>
</head>
<body style="padding-bottom:20px;">
	<!-- header -->
	<div class="nav index-nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">红包基金兑换</span>
	</div>
	<form action="#" id="SEC_HBB_FOMR" data-widget="validator" class="form-horizontal">
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }">
  	<div class="to-rmb">
    	<p>${txjine }红包</p>
    	<p>可以兑换${txjine } 红包基金</p>
  	</div>
  	<div class="container transfer-info mt20">
		<p><span>&nbsp;&nbsp;红包总额：</span><input type="text" id="aggreatMount" name="aggreatMount" value="${txjine }"></p>
	</div>
	<div class="container transfer-info mt20">
		<p><span>&nbsp;&nbsp;兑换红包基金总额：</span><input type="text" id="everyoneTotal" name="everyoneTotal" value="${txjine }"></p>
	</div>
  	<div class="container mt20">
		<a href="#" class="btn green-btn" onClick="dosavedh()">确定</a>
	</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">红包金额记录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

	<ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
	<link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
	
</head>
<body>
	<!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">红包金额记录</span>
	</div>

	<div class="">
		<div class="rows record-tit">
			<div class="col-4 date-col">
				<span class="ico date"></span><span class="text">时间</span>
			</div>
			<div class="col-4 name-col">
				<span class="ico name"></span><span class="text">项目</span>
			</div>
			<div class="col-4">
				<span class="ico money"></span><span class="text">金额</span>
			</div>
		</div>


		<div class="rows record-item clearfix">
			<div class="col-4">${time }</div>
			<div class="col-4">${title }</div>
			<div class="col-4">${tuanduisy }元</div>
		</div>
		<div class="rows record-item clearfix">
			<div class="col-4">2015/4/9 10:57</div>
			<div class="col-4">团队收入</div>
			<div class="col-4">540元</div>
		</div>
	</div>
	
</body>
</html>
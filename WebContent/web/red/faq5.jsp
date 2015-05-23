<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<title ng-bind="title">联系方式</title>
 	<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />

	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
<body>
	 <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">联系方式</span>
	</div>

  <div class="container faq-detail">
      <p>电话号码：1825555555</p> 
      <p>地址：广东省广州市天河区</p>
      <p>QQ：4654654656</p>
      <p>微信：16565</p>
  </div>
	
</body>
</html>
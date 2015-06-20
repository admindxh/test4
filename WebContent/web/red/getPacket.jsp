<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>

<!DOCTYPE html>
<html>
<head>
<title ng-bind="title">领红包</title>
<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
    <script src="${contextPath}/web/red/js/edite_sec_redpackage.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />

    <style>
      .packet-body,.to-packet{}
    </style>
</head>
<body style="background:#fff;">
    <form action="" method="get">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">领红包</span>
	</div>
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }"/>
	<div class="packet-body">
    <div class="to-packet" style="position:static;">
  		<img src="${contextPath}/web/red/res/images/bg-getP.jpg" alt="">
      <p class="get-text">您已领到该红包！</p>
      <div class="">
        <a href="#" class="btn yellow-btn" onClick="linghb()">查看领取详情</a>
      </div>
    </div>
	</div>
	</form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%@include file="/common/meta.jsp"%>
	<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
    <title ng-bind="title">抢红包</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />

   
  </head>
  
  <body class="packet-take-body">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">抢红包</span>
	</div>

  <div class="to-packet container packet-take-con">
      <div class="btn-cover">
        <a href="#" onClick="qianghb()" class="btn yellow-btn">抢红包</a>
      </div>

      <p class="">试试手气，拿现金红包！</p>
  </div>

  </body>
</html>

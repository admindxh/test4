<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title ng-bind="title">我也要发红包</title>
<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
	
	<script type="text/javascript">
			var orgId = '${param.yhdxdh}';
			var orgName = '${param.yhdxdh}';
 	</script>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
 	<link rel="stylesheet" href="res/css/common.css" />
    <link rel="stylesheet" href="res/css/packet.css" />
</head>
<body>
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">我也要发红包</span>
	</div>

	<div class="make-bg mt20">
	</div>

	<div class="container mt20">
		<a href="#" class="btn red-btn1" onClick="qianghb()">拼手气红包</a>
	</div>

	<div class="container mt20">
		<a href="#" class="btn yellow-btn" onClick="putongRedpackge()">普通红包</a>
	</div>

	<div class="container mt20">
		<div class="rows">
			<div class="col-6"><a class="make-recieve" href="#">收到的红包</a></div>
			<div class="col-6"><a class="make-send" href="#">我发的红包</a></div>
		</div>
	</div>

</body>
</html>
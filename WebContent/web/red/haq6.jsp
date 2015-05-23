<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<title ng-bind="title">如何发红包/红包币？</title>
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
		<span class="nav-tit">如何发红包/红包币？</span>
	</div>

  <div class="container faq-detail">
      <p>${czff}</p> 
      <p>红包币的未来红包币的未来红包币的未来红包币的未来红包币的未来</p>
      <p>用户通过网站成功购买了影票，在观影后发表该影院的点评（影评），通过审核后将根据点评质量获得10-50积分；得到本站编辑推荐的影评奖额外获得1000以内积分；</p>
  </div>
	
</body>
</html>
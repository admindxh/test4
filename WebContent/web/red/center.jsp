<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">财务中心</title>
    
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    
	<link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
<body style="padding-bottom:20px;">
	 <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">财务中心</span>
	</div>
	
	<form action="" method="get">
	<input type="hidden" id="yhdxdh" name="yhdxdh" value="${hbdXuser.yhdxdh }">
  	<div class="rows center-fn clearfix">
  		<a href="#" class="col-4 center-fn-item item1" onClick="myMoney()">
  			<i class="t1"></i>
  			<span>我的零钱</span>
  		</a>
  		<a href="#" class="col-4 center-fn-item item2" onClick="record()">
  			<i class="t2"></i>
  			<span>金额记录</span>
  		</a>
  		<a href="#" class="col-4 center-fn-item item3" onClick="excRMB()">
  			<i class="t3"></i>
  			<span>基金转账</span>
  		</a>
  		<a href="#" class="col-4 center-fn-item item4" onClick="traRMBTX()">
  			<i class="t4"></i>
  			<span>红包提现</span>
  		</a>
  		<a href="#" class="col-4 center-fn-item item5" onClick="excB()">
  			<i class="t5"></i>
  			<span>红包币转账</span>
  		</a>
  		<a href="#" class="col-4 center-fn-item item6" onClick="buyB()">
  			<i class="t6"></i>
  			<span>红包币购买</span>
  		</a>
  	</div>

  	<p class="center-tit mt25">红包金额记录</p>
	<div class="rows clearfix mt15">
		<div class="col-3 center-record-item">
			<p class="tit">转红包</p>
			<p class="num">168个</p>
		</div>
		<div class="col-3 center-record-item">
			<p class="tit">收红包</p>
			<p class="num">168个</p>
		</div>
		<div class="col-3 center-record-item">
			<p class="tit">派红包</p>
			<p class="num">168个</p>
		</div>
		<div class="col-3 center-record-item">
			<p class="tit">收益</p>
			<p class="num">168个</p>
		</div>
	</div>

	<div class="center-sim rows clearfix mt25">
		<a href="#" class="col-6 sim sim1">
			<i class="s1"></i>
			<span>个人投资收益详情</span>
		</a>
		<a href="#" class="col-6 sim">
			<i class="s2"></i>
			<span>团队收益详情</span>
		</a>
	</div>
	</form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>

<%@page import="bingo.security.SecurityContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title ng-bind="title">首页</title>
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

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />

	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
  
 <body style="padding-bottom:20px;">
    <!-- header -->
	<div class="nav index-nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">首页</span>
	</div>

  <div class="index-banner">
    <img src="${contextPath}/web/red/res/images/bg-index.jpg" alt="分享到朋友圈，马上有特等收获！">
    <div class="tips">分享到朋友圈，马上有特等收获！</div>
  </div>

  <div class="rows index-info clearfix">
    <div class="col-6 info-item">
      <p class="s1">红包金额</p>
      <p class="s2">￥200</p>
    </div>
    <div class="col-6 info-item">
      <p class="s1">红包基金</p>
      <p class="s2">￥200</p>
    </div>
    <div class="col-6 info-item">
      <p class="s1">红包币现价</p>
      <p class="s2">￥20</p>
    </div>
    <div class="col-6 info-item">
      <p class="s1">直接邀请</p>
      <p class="s2">20人</p>
    </div>
  </div>

  <div class="rows sd-list clearfix mt15">
    <div class="col-4 sd-item">
      <i></i>
      <p>红包天天派</p>
    </div>
    <div class="col-4 sd-item">
      <i></i>
      <p>天天有精品</p>
    </div>
    <div class="col-4 sd-item">
      <i></i>
      <p>天天有财进</p>
    </div>
  </div>

  	<div class="clearfix mt20">
    	<div class="col-6 ac-btns-item"><a href="#" class="btn green-btn" id="btnphb" onClick="qianghh(this)">派红包</a></div>
    	<div class="col-6 ac-btns-item"><a href="#" class="btn red-btn" id="2" onClick="qianghh(this)">抢红包</a></div>
	</div>

  <div class="rows ico-info clearfix mt20">
    <a href="#" class="col-6 ico-info-item">
      <i class="ico-vip ico"></i>
      <span class="ico-vip-text s2">VIP特权</span>
    </a>
    <a href="#" class="col-6 ico-info-item" id="center" onClick="center(this)">
      <i class="ico-vip ico"></i>
      <span class="ico-vip-text">财务中心</span>
    </a>
    <a href="faq.jsp" class="col-6 ico-info-item">
      <i class="ico-faq ico"></i>
      <span class="ico-faq-text s2">常见问题</span>
    </a>
    <a href="#" class="col-6 ico-info-item">
      <i class="ico-plus ico"></i>
      <span class="ico-plus-text">邀请好友</span>
    </a>
  </div>

  <div class="rows index-count-info clearfix">
    <div class="col-4 index-count-item">
      <span>红包数量</span>
    </div>
    <div class="col-4 index-count-item">
      <span>交易平台</span>
    </div>
    <div class="col-4 index-count-item">
      <span>红包商家</span>
    </div>
  </div>
  <div class="rows index-count-info index-count-text clearfix">
    <div class="col-4 index-count-item">
      <p>5088个</p>
    </div>
    <div class="col-4 index-count-item">
      <p>5088个</p>
    </div>
    <div class="col-4 index-count-item">
      <p>5088个</p>
    </div>
  </div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title ng-bind="title">普通红包</title>
	
	<%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
		<script type="text/javascript">
			var orgId = '${hbdXuser.yhdxdh}';
			var orgName = '${param.orgName}';
		</script>
		
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
 	<link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
     <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
     <script src="/web/red/js/edit_sec_paihongbao.js"></script>
</head>
<body style="background:#ae0a12;">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">普通红包</span>
	</div>

  <div class="container">
      <div class="send-packet">
        <p class="text">红包数量：<input type="number" class="num"><span>个</span></p>
        <p class="text">单个金额：<input type="text" class="num"><span>元</span></p>
        <p class="tips">每个人抽到的金额一样的</p>
        <p class="text" style="font-size:1.4rem;">留言：</p>
        <textarea name="" class="textarea">恭喜发财</textarea>

        <p class="pay-tips">支付金额：<em class="money">0.00</em>元</p>
        <div class="mt25">
      		<a href="#" class="btn yellow-btn">塞进红包</a>
      	</div>
      </div>
  </div>

</body>
</html>
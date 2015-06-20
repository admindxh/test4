<%@ page language="java" contentType="text/html; charset=Utf-8" pageEncoding="Utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">发红包</title>
	<%@include file="/common/meta.jsp"%>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
    <script src="${contextPath}/web/red/res/js/zepto.js"></script>
    
    <script type="text/javascript">
      function sendpacket(){
    	  	var id=document.getElementById("yhdxdh").value;
    		var url='~/poral/dosendPacket.do?yhdxdh='+id;
    		window.location.href=$.utils.parseUrl(url);
      }
    </script>
</head>
<body>
	<!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">发红包</span>
	</div>
	<form action="" method="post">
	<div class="container packet-detail">
		<div class="clearfix">
			<div class="img"></div>
			<div class="text">
				<p class="s1 rtext">张三的红包</p>
				<p class="s2 rtext">财富和好运都会来的</p>
				<p class="s3 rtext">02月18日</p>
			</div>
		</div>
	</div>
	
	<div class="container packet-info mt20">
		<div class="row clearfix">
			<div class="col-6 name">李四</div>
			<div class="col-6 price rtext">2.68元</div>
		</div>

		<div class="row clearfix">
			<div class="col-6 tips">恭喜陈总羊年发大财</div>
			<div class="col-6 tips rtext">02月18日 18:25</div>
		</div>
	</div>
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }"/>
	<div class="container mt20">
		<a href="#" class="btn red-btn" onClick="sendpacket()">我也要发红包</a>
	</div>
	<div class="container mt20">
		<a href="#" class="btn white-btn" onclick="window.Close();return false;">关闭</a>
	</div>
	</form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <%@include file="/common/meta.jsp"%>
		<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
		<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
		<script type="text/javascript">
			var orgId = '${hbdXuser.yhdxdh}';
			var orgName = '${param.orgName}';
		</script>
    <title ng-bind="title">拼手气红包</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	 <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
     <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
     <script type="text/javascript">
     
     </script>
  </head>
  
  <body style="background:#ae0a12;">
  <form action="" method="post" id="SEC_QUNFA_FOMR" name="">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">拼手气红包</span>
	</div>
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }"/>
  	<div style="padding-left:15px;padding-right:15px;">
    
      <div class="send-packet">
      <input type="hidden" name="hblb" id="hblb" value="1"/>
     
        <p class="text">红包数量：<input type="text" id="hbnumber" name="hbgs" class="num" value="${hbdXuser.hbgs}"><span>个</span></p>
        <p class="text">总金额：<input type="text" class="num" name="aggreatMount" value="${hbdXuser.aggreatMount}"><span>元</span></p>
        <p class="tips">每个人抽到的金额随机</p>
        <p class="text" style="font-size:1.4rem;">留言：</p>
        <textarea name="" class="textarea">恭喜发财</textarea>

        <p class="pay-tips">支付金额：<em class="money">0.00</em>元</p>
        <div class="mt25">
      		<a href="#" class="btn yellow-btn" onclick="doSavequnfa();return false;">塞进红包</a>
      	</div>
      </div>
      
  </div>
</form>
</body>
</html>

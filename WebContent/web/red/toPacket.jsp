<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
    <title ng-bind="title">抢红包</title>
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
    
    <script type="text/javascript">
      function sdfs(){
    	  
    	  var tt=document.getElementById("hbze").innerHTML;
    	  alert(1);
    	  
      }
    </script>
</head>


<body style="background:#eb6100;">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">新年红包</span>
	</div>
	<form action="" method="post" id="SEC_RECEIVED_FOMR">
	<div class="packet-body">
    	<div class="to-packet">
  			<img src="${contextPath}/web/red/res/images/bg-packet.jpg" alt="">
    	</div>
       		<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }"/>
       		<input type="hidden" name="id" id="id" value="${Received.id }">
    		<div class="to-packet">
  			<div class="t0-packet-con" id="">
	  			<div class="em-tips">恭喜您获得￥<span>
	  			   ${hbze}<input type="hidden" name="aggreatMount" id="aggreatMount" value="${hbze}">
	  			</span>元红包
	  			</div>
  	  				<div class="btn-cover">
  						<a href="#" class="btn yellow-btn">分享到朋友圈</a>
  					</div>

  					<div class="btn-cover">
  						<a href="#" class="btn red-btn1" onClick="myredpackge()">查看我的红包</a>
  					</div>
      		</div>
			</div>
		
	</div>
	</form>
</body>
</html>
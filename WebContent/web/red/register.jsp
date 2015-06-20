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
    
    <%@include file="/common/meta.jsp"%>
	<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/login.js"></ui:script>
	<script type="text/javascript">
		var orgId = '${param.yhdxdh}';
		var orgName = '${param.yhdxdh}';
	</script>
    <title ng-bind="title">注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	
	<script src="res/js/zepto.js"></script>
	<!-- 验证手机号码是否正确 -->
	<script type="text/javascript">
	  function cardclick(card){
		  var phone=document.getElementById("userphnoe").value;
		  var iphone=/^(13[0-9]{9})|(15[89][0-9]{8})|(18[0-9]{9})$/;
		 
		  if((iphone.test(phone))){
			  return;
			  }else{
                
                alert("手机号码不对");
                return false;
				  }
		  
	  }
	  </script>  

</head>
  
  <body class="reg-bg">
	<div class="reg-con" id="regCon">
		<img src="${contextPath}/web/red/res/images/bg-reg.jpg" alt="">

		<div class="reg-cover">
			<form action="" method="post" id="SEC_USER_FOMR" name="">
				<div class="reg-form">
					<div class="reg-form-con">
					 <input id="yhdxdh" name="yhdxdh" type="hidden" value="${hbdxuser.yhdxdh }">
						<p>手机号码</p>
						<p><input type="text" class="input tel" id="userphnoe" data-validator="required,func[checkphnoe]" name="userphnoe" ></p>
						<p>密码</p>
						<p><input type="password" class="input pw" id="password" name="password" onblur="return istopuser()"></p>
						<!-- 如果有推荐人则读取推荐人 -->
						<p>推荐人：<span>${name }</span>

						<div class="mt20">
							<a href="#"  id="login" class="btn red-btn1" onClick="dosunmit()">注册</a>
						</div>
					</div>
				</div>
			</form>
		</div>
        <div>
			<img src="${contextPath}/web/red/res/images/tit-reg.jpg" class="reg-tit" alt="">
		</div>
	</div>
	
	<script class="right-down">
		$(function(){ 
			var _height = $(window).height();
			$('#regCon').height(_height);
		}) 
	</script>
</body>
</html>

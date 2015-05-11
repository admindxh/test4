<!DOCTYPE HTML >
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bingo.security.SecurityContext"%>

<%@include file="/common/taglibs.jsp"%>
<html>
  <head>
    
    <%@include file="/common/meta.jsp"%>
	<ui:combine>
	<script type="text/javascript" src="${contextPath}/web/red/js/login.js"></script>
	</ui:combine>
    <title ng-bind="title">登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	
	<script src="res/js/zepto.js"></script>
	<!-- 点击注册按钮提交事件 ajax异步请求提交注册 -->
	<!-- 验证手机号码是否正确 -->
	<script type="text/javascript">
	  function cardclick(card){
		  var phone=document.getElementById("userphnoe").value;
		  var iphone=/^(13[0-9]{9})|(15[89][0-9]{8})|(18[0-9]{9})$/;
		 
		  if((iphone.test(phone))){
			  alert("输入手机号码正确");
			  }else{
                
                alert("手机号码不对");
                return false;
				  }
		  
	  }
	  </script>  
	  
	<!-- 登陆 -->
	<script type="text/javascript">
	   function ajax(grid, rowData, keyData){
		   // var url = '~/exchangehbb/validateUser.do?userphnoe='+keyData;
		   alert(1);
		    var userphnoe=document.getElementById("userphnoe").value;
		    var password=document.getElementById("password").value;
		    var url='~/poral/doQianghb.do?userphnoe='+ userphnoe+'&password='+password;
			
		    window.location.href=$.utils.parseUrl(url);
	   }
	</script>

</head>
  <body class="reg-bg">
	<div class="reg-con" id="regCon">
		<img src="${contextPath}/web/red/res/images/bg-reg.jpg" alt="">
        <div class="login">
		<div class="reg-cover">
			<form method="post" action="/reduserlogin" target="_self">
				
				<div class="reg-form">
					<div class="reg-form-con">

					 <input type="hidden" name="returnUrl" value="<%=request.getParameter("returnUrl")%>"/>
			         <input type="hidden" name="action" value="login"/>
			         <input type="hidden" name="yhdxdh" value="yhdxdh" value="${users.yhdxdh }"/>
						<p>手机号码</p>
						<p><input type="text" class="input tel" id="userphnoe" name="userphnoe" data-validator="mobile" onblur="return cardclick()" onkeydown="if(event.keyCode == 13||event.which == 13)" value="${hbdXuser.userphnoe }"></p>
						<p>密码</p>
						<p><input type="password" class="input pw" id="password" name="password" onkeydown="if(event.keyCode == 13||event.which == 13)"></p>
						<!-- 如果有推荐人则读取推荐人 -->
						<p>推荐人：<span>${name }</span></p>

						<div class="mt20">
							<a href="#"  class="btn red-btn1" onClick="ajax()">登陆</a>
						</div>
					</div>
				</div>
			</form>
		</div>
        <div>
			<img src="${contextPath}/web/red/res/images/tit-reg.jpg" class="reg-tit" alt="">
		</div>
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

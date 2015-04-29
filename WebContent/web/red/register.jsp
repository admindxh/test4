<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <%@include file="/common/meta.jsp"%>
	<ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
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
	<!-- 点击注册按钮提交事件 ajax异步请求提交注册 -->
	
	
	<!-- 验证手机号码是否正确 -->
	<script type="text/javascript">
	  function cardclick(card){
		  var phone=document.getElementById("mobiphone").value;
		  var iphone=/^(13[0-9]{9})|(15[89][0-9]{8})|(18[0-9]{9})$/;
		 
		  if((iphone.test(phone))){
			  alert("输入手机号码正确");
			  }else{
                
                alert("手机号码不对");
                return false;
				  }
		  
	  }
	  </script>  
	  
	<!-- 注册 -->
	<script type="text/javascript">
	  function loginname(keyData) {
		//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
			
			var phone=document.getElementById("mobiphone").value;
			var password=document.getElementById("pass").value;
			
			if(phone!=null&&password!=null){
				
				alert(phone);
				
				window.location.href='~/poral/createusers.do?yhdxdh='+keyData;
			}else{
                return;
				}
	}
	</script>
<script type="text/javascript">
	
/**
 * ajax异步请求  提交登陆
 */

  function ajaxsubmit(){
	  alert(1);
	
		//function 是后台请求成功的callback函数
		 var valInfo = $.validation.validate("#SEC_USER_FOMR");
			if (valInfo.isError)
				

			var user = $('#SEC_USER_FOMR').toJson();
            
			$.dataservice("spring:exchangehbbService.dosave", user, function(response) {
						$.dialogReturnValue(true);
						$(document).dialogClose();
					});
		 
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
					 <input id="yhdxdh" name="yhdxdh" type="hidden">
						<p>手机号码</p>
						<p><input type="text" class="input tel" id="mobiphone" onblur="return cardclick()"></p>
						<p>密码</p>
						<p><input type="password" class="input pw" id="pass" onblur="return loginname()"></p>
						<!-- 如果有推荐人则读取推荐人 -->
						<p>推荐人：<input type="text" value="暂无介绍人" name="username" id="username" value="<%=request.getAttribute("name") %>" readonly="readonly"></p>

						<div class="mt20">
							<a href="#"  class="btn red-btn1" onClick="loginname()">注册</a>
						</div>
						<div class="mt20">
						   <a href="#"  onClick="ajaxsubmit()" class="btn green-btn">登陆</a>
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

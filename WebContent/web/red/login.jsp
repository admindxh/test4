<!DOCTYPE HTML >
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bingo.security.SecurityContext"%>
<%@page import="java.sql.*" %>
<%@include file="/common/taglibs.jsp"%>

<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title ng-bind="title">登陆</title>
    <ui:script src="/web/red/js/login.js"></ui:script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	
	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
	
	<ui:combine>
			<script type="text/javascript" src="${contextPath}/web/red/js/login.js"></script>
	</ui:combine>
	<!-- 点击注册按钮提交事件 ajax异步请求提交注册 -->
	<!-- 验证手机号码是否正确 -->
	<script type="text/javascript">
	  function cardclick(grid, rowData, keyData){
		  var phone=document.getElementById("userphnoe").value;
		  var iphone=/^(13[0-9]{9})|(15[89][0-9]{8})|(18[0-9]{9})$/;
		  var id=document.getElementById("id").value;
		  if((iphone.test(phone))){		      
				  var url='~/exchage/createusers.do?userphnoe='+ phone+'&id='+id;
				  window.location.href=$.utils.parseUrl(url);
				  grid.refresh();
			  }else{   
                	alert("请重新输入手机号码！");
                	return false;
				  }
		  
	  	}
	  
	  /**
	   * 红包用户验证
	   */
	  var saveflag=true;

	  function checkphnoe(value){
	  	var exists = null;
	  	var yhdxdh="";
	  	$.dataservice("spring:redbackService.checkphnoe", {
	  				userphnoe : value,
	  		        yhdxdh : yhdxdh
	  			}, function(response) {
	  				exists = response;
	  			}, {
	  				async : false
	  			});
	  	if (exists) {
	  		saveflag=true;
	  		return {
	  			
	  			isError : false,
	  			errorInfo : "电话号码正确"
	  		};
	  	} else {
	  		saveflag=false;
	  		return {
	  			
	  			isError : true,
	  			errorInfo : "电话号码无效"
	  		};
	  	}
	  }
	  
	  function ajax(grid, rowData, keyData){
		   	alert(saveflag);
			  if(saveflag==false){
				  alert('电话号码无效，不能注册');
				  return;
			  }
		   // var url = '~/exchangehbb/validateUser.do?userphnoe='+keyData;
		    var userphnoe=document.getElementById("userphnoe").value;
		    var password=document.getElementById("password").value;
		    var id=document.getElementById("id").value;
		    var url='~/poral/doQianghb.do?userphnoe='+ userphnoe+'&password='+password+'&id='+id;
			
		    window.location.href=$.utils.parseUrl(url);
	   }
	  </script>  
	  
	
	
</head>
  <body class="reg-bg">
  
	<div class="reg-con" id="regCon">
		<img src="${contextPath}/web/red/res/images/bg-reg.jpg" alt="">
        <div class="login">
		<div class="reg-cover">
			<form method="post" action="#" target="_self">
			 
				<div class="reg-form">
					<div class="reg-form-con">
			         <input type="hidden" name="returnUrl" value="<%=request.getParameter("returnUrl")%>"/>
			         <input type="hidden" name="action" value="login"/>
			         <input type="hidden" name="id" id="id" value="${id }">
			         <input type="hidden" name="yhdxdh" value="${hbdXuser.yhdxdh }"/>
						<p>手机号码</p>
						<p><input type="text" class="input tel" id="userphnoe" name="userphnoe" onblur="cardclick(this)" data-validator="mobile" onkeydown="if(event.keyCode == 13||event.which == 13)" value="${userphnoe }"></p>
						<p>密码</p>
						<p><input type="password" class="input pw" id="password" name="password" onkeydown="if(event.keyCode == 13||event.which == 13)"></p>
						<!-- 如果有推荐人则读取推荐人 -->
						<p>推荐人：${name }</p>

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

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">收到的红包</title>
	<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<script src="${contextPath}/web/red/js/edite_sec_redpackage.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
    
    <script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
<body>
	<!-- header -->
	<!-- <header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">请输入证书编号</h1>
	</header> -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">收到的红包</span>
	</div>
  <form action="" method="post" class="SEC_RECEVIE_FORM">
  <div class="">
      <ul class="my-packet-list my-packet-recieve clearfix">
       
           
            <c:forEach items="${list}" var="receiced" varStatus="vs">
            	<li class="my-packet-item clearfix">
            		
		       		<div class="left-con">
            			<p class="s1">${receiced.fromname}<span class="ico-label">群</span></p>
           	 			<p class="s2">${receiced.receivedtime }</p>
          			</div>
          			<div class="right-con">
            			<p class="s1">${receiced.monney }元</p>
          			</div>
          		</li>
            </c:forEach>
          
      </ul>
  </div>
</form>
</body>
</html>
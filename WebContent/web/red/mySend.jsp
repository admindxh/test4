<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>
<!DOCTYPE html>
<html>
<head>

	<title ng-bind="title">我发的红包</title>
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
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">我发的红包</span>
	</div>
	 <div class="">
      <ul class="my-packet-list clearfix">
       <c:if test="${not empty list}">
       		<c:forEach items="${list}" var="mysend" varStatus="vs">
       			<ul class="my-packet-list clearfix">
       				<li class="my-packet-item clearfix">
			          <div class="left-con">
			            <p class="s1">${mysend.fromname }<span class="ico-label">群</span></p>
			            <p class="s2">${mysend.lssuetime }</p>
			          </div>
			          <div class="right-con">
			            <p class="s1">${mysend.monney }元</p>
			            <span class="num-tips">1/1个</span>
			          </div>
			        </li>
       			</ul>
       		</c:forEach>
       </c:if>
        <li class="my-packet-item clearfix">
          <div class="left-con">
            <p class="s1">网易的红包<span class="ico-label">群</span></p>
            <p class="s2">2015-02-16  15: 20: 06</p>
          </div>
          <div class="right-con">
            <p class="s1">7.25元</p>
            <span class="num-tips">1/1个</span>
          </div>
        </li>
        <li class="my-packet-item clearfix">
          <div class="left-con">
            <p class="s1">网易的红包<span class="ico-label">群</span></p>
            <p class="s2">2015-02-16  15: 20: 06</p>
          </div>
          <div class="right-con">
            <p class="s1">7.25元</p>
            <span class="num-tips">1/1个</span>
          </div>
        </li>
      </ul>
  </div>
</body>
</html>
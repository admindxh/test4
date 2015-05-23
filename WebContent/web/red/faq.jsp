<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title ng-bind="title">常见问题</title>
	<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="res/css/common.css" />
    <link rel="stylesheet" href="res/css/packet.css" />

	<script src="res/js/zepto.js"></script>
	<script type="text/javascript">
	  function doCzff(){
		 
		   var url='~/hbproble/doListBy.do';
		    
			window.location.href=$.utils.parseUrl(url);
			alert(1);
	  }
	</script>
</head>
<body>
	<!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">常见问题</span>
	</div>

  <div class="rows faq-title-list clearfix">
    <div class="col-12 tit-item"><a href="faq3.jsp">基本介绍</a></div>
    <div class="col-12 tit-item"><a href="#" onClick="doCzff()">操作方法</a></div>
    <div class="col-12 tit-item"><a href="faq4.jsp">提现问题</a></div>
    <div class="col-12 tit-item"><a href="faq5.jsp">联系方式</a></div>
  </div>

  <div class="rows faq-title-list clearfix mt20">
    <a href="faq1.html" class="col-12 tit-item">红包币的未来</a>
    <a href="haq6.jsp" class="col-12 tit-item">如何发红包/红包币？</a>
    <a href="haq7.jsp" class="col-12 tit-item">如何收红包/红包币？</a>
  </div>
	
</body>
</html>
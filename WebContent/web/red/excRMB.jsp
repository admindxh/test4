<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">红包基金转账</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	<ui:script src="/web/red/js/edite_sec_redpackage.js"></ui:script>
	<link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
	<script src="${contextPath}/web/red/res/js/zepto.js"></script>
</head>
<body>
	<!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">红包基金转账</span>
	</div>

	<form action="#" data-widget="validator" class="form-horizontal" id="SEC_HBB_FOMR">
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }">
	<div class="container transfer-info mt20">
		<p><span>&nbsp;&nbsp;接收账号：</span><input type="text" class="" name="userphnoe" value="1234567"></p>
	</div>
	<div class="container transfer-info" id="inputPad">
		<div class="clearfix">
			<span>&nbsp;&nbsp;金&nbsp;&nbsp;&nbsp;&nbsp;额（元）：</span>
			<input type="text" class="hbjj" id="hbjj" value="1234">
		</div>
	</div>

	<div class="container mt20">
		<a href="#" class="btn green-btn" onClick="hbjjdelete()">确认</a>
	</div>
	
	<script>
	var $inputPad = $('#inputPad'),$num = $('#num');
	$inputPad.on('click','.aCut',function(){ 
		var _value = $num.val(),_num=Number(_value) -1;
		if(_value<1){ 
			_num = 1;
		}

		$num.val(_num);
	})
	.on('click','.aAdd',function(){ 
		var _value = $num.val(),_num=Number(_value) + 1;

		$num.val(_num);
	})
	;
	</script>
</body>
</html>
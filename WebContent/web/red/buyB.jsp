<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/meta.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">红包币购买</title>
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
		<span class="nav-tit">红包币购买</span>
	</div>
	<form action="#" id="SEC_HBB_FOMR" data-widget="validator" class="form-horizontal">
	<input type="hidden" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }">
	<div class="container transfer-info mt20">
		<p><span>&nbsp;&nbsp;接收账号：</span><input type="text" id="userjhm" name="userjhm" onblur="checks(this.value);" value="${hbdXuser.userjhm }"></p>
	</div>
	<div class="container transfer-info" id="inputPad">
		<div class="clearfix">
			<span>&nbsp;&nbsp;数&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
			<div class="num-cover">
				<em class="action action-cut aCut"></em>
					<input type="text" id="hbb" class="num" name="hbb">
				<em class="action action-add aAdd"></em>
			</div>
		</div>
	</div>

	<div class="container mt20">
		<a href="#" class="btn green-btn" onClick="byhbb()">确认</a>
	</div>
	</form>
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
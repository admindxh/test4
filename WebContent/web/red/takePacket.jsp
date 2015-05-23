<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@page import="bingo.security.SecurityContext"%>
<!DOCTYPE html>
<html>
<head>
	<title ng-bind="title">抢红包</title>
	<%@include file="/common/meta.jsp"%>
    <ui:combine widgets="dhtmlxgrid,dialog,multiselect,messagebox"></ui:combine>
    <ui:combine widgets="validator,inputpro,listselectdialog,dialog,blockui"></ui:combine>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />

    <link rel="stylesheet" href="${contextPath}/web/red/res/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/web/red/res/css/packet.css" />
    
    <script type="text/javascript">
    function qianghb(grid, rowData, keyData) {
    	
    	var id=document.getElementById("yhdxdh").value;
    	var url='~/poral/dosendPacket.do?yhdxdh='+id;
    	
    	window.location.href=$.utils.parseUrl(url);
    	
    }
    </script>
</head>
<body class="packet-take-body">
    <form action="" method="get">
    <!-- header -->
	<div class="nav">
		<i class="ico-arr"></i>
		<span class="nav-tit">抢红包</span>
	</div>
		<input type="text" name="yhdxdh" id="yhdxdh" value="${hbdXuser.yhdxdh }"/>
  		<div class="to-packet container packet-take-con">
      		<div class="btn-cover">
        		<a href="#" class="btn yellow-btn" onClick="qianghb()">抢红包</a>
      		</div>

      		<p class="">试试手气，拿现金红包！</p>
  		</div>
	</form>
	</body>
</html>
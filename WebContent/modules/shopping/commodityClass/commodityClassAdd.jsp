<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>��ӭ����ϵͳ��̨</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY><BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
<form action="addCommodityClass.action" method="post">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TH colSpan=2 height=24>��������Ʒ���ࡿ</TH> 
  </TR>
  <TR>
    <TD class=forumrow width="30%" height=24><div align="right">��Ʒ�������ƣ�</div></TD>
  <TD class=forumrowhighlight width="70%" 
      height=24><input type="text" name="commodityClassName"></TD></TR>
  <TR>
    <TD class=forumrow height=24><div align="right"></div></TD>
    <TD class=forumrowhighlight 
      height=24><span class="forumrow">
      <input type="submit" value="�ύ">
      <input type="reset" value="����">
    </span></TD>
  </TR>
  </TBODY></TABLE>
</form>  
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
</BODY></HTML>

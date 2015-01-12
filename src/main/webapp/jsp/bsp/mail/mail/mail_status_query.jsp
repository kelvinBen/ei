<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_RESOURCE.INBOXMAIL_TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<% 
	String usedSize = "0";
	String totalSize = "0";
	String percent = "0";
	String percent1 = "0";

	usedSize = ""+ request.getAttribute("usedSize");
	totalSize = ""+ request.getAttribute("totalSize");
	percent = ""+ request.getAttribute("percent");
	percent1 = "" + ( 100-Float.parseFloat(percent) );

	usedSize = "" + (Math.round(Float.parseFloat( usedSize )*100.0f)/100.0f);
	percent = "" + (Math.round(Float.parseFloat( percent )*100.0f)/100.0f);
%>
<html:form name="frmList" action="">
<div class="btnareaCss">
<table width="100%">
	<tr><td height="25"><span id="message"><html:messages/></span></td></tr>
</table>
</div>
<!-- 142 -->
<flex:flexgrid name="grid" height="159" action="" isSubmit="false">
	<flex:flexCol caption='文件夹' canSort="false" width="100" property="mailType" style="text-decoration:underline;cursor:hand" onclick="forQueryList()" sortName="PUB_MAIL_RESOURCE.mailType"></flex:flexCol>
	<flex:flexCol caption='邮件数' type="double" format="0#;" width="100" property="totalNum" sortName="PUB_MAIL_RESOURCE.totalNum" isSum="true" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='新邮件数' type="double" format="0#;"  width="100" property="unReadNum"  sortName="PUB_MAIL_RESOURCE.unReadNum" isSum="true" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='邮箱大小' width="100" property="totalSize" sortName="PUB_MAIL_RESOURCE.totalSize" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='空间百分比' width="100" property="percent" sortName="PUB_MAIL_RESOURCE.percent" canSort="false" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="" pageSize="10">
</flex:pagePolit>
<br>
<div class="btnareaCss">
<table width="100%" border="0" cellspacing="0" cellpadding="3"  align="center">
  <tr>
	<td height="25">
	  &nbsp;您的邮箱容量为：<font color="#EF485C"><b><%=totalSize%></b></font> 已使用空间：<font color="#EF485C"><b><%=usedSize%>K</b></font> 占总容量：<font color="#EF485C"><b><%=percent%>%</b></font>
	</td>
  </tr>
  <tr>
  <td>
	<table width="98%" border="0" cellspacing="0" cellpadding="0"  style="border:1 solid #56C004" align="center">
	  <tr align="center">
		<td width="<%=percent%>%" bgcolor="#FFC003"><br></td>
		<td height="18" width="<%=percent1%>%" bgcolor="<%if( Float.parseFloat(percent) < 90.0f ){%>#FFFFFF<%}else{%>#FF0000<%}%>" nowrap><br></td>
	  </tr>
	</table>
	  <table width="98%" border="0" cellspacing="0" cellpadding="0" height="30" align="center">
		<tr>
		  <td width="10">0</td>
		  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		  <td width="10">100%</td>
		</tr>
	  </table>
	</td>
   </tr>
</table>
</div>
</html:form>
</body>
</html>
<script language="javascript">
grid.show();
var usedSize = parseNumber('<%=usedSize%>');

grid.setSumValue(4,usedSize+"K");
grid.setSumValue(5,"<%=percent%>%");

function parseNumber( num )
{
	if( num == null || num == "" )
		return "0.00";
	var numArr = num.split( "." );
	var length = numArr.length;
	if( length == 1 )//没有小数点
	{
		return num + ".00";
	}
	else
	{
		var num2 = numArr[ 1 ];
		if( num2.length == 1 )
			return num + "0";
	}
	return num;
}
function forQueryList()
{
	var rowIndex=grid.getCurrentLine();
	if( rowIndex == '1' )
	{	
		window.location.href="inboxmailquery.cmd?mailType=0&serverType=1";
	}
	else if( rowIndex == '2' )
	{
		window.location.href="sendmailquery.cmd?mailType=1&serverType=1";
	}
	else if( rowIndex == '3' )
	{
		window.location.href="alreadysendmailquery.cmd?mailType=2";
	}
	else if( rowIndex == '4' )
	{
		window.location.href="draftmailquery.cmd?mailType=3&serverType=1";
	}
	else if( rowIndex == '5' )
	{
		window.location.href="garbagemailquery.cmd?mailType=4&serverType=1";
	}
}
</script>
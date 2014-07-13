<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="net.mast.bsp.permit.context.BspInfo" %>
<%@ page import="net.mast.bsp.permit.context.BspInfoKey" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<html>
<%
	SimpleDateFormat bartDateFormat=new SimpleDateFormat("yyyy-MM-dd-EEEE HH:mm");
	Date date=new Date();
	
	BspInfo bspInfo=(BspInfo)request.getSession().getAttribute(BspInfoKey.BSPINFOKEY);
	String user=bspInfo.getUserName();
	String userid=bspInfo.getUserId();
	String compony=bspInfo.getLoginCorporation().getOrgan().getOrganName();
	String servername=request.getServerName();
	String app=request.getContextPath();
%>
<%

	String message="你好: "+user+"，欢迎光临演示系统";
	String corporation=(String)session.getAttribute("CORPORATIONNAME");
	message=message+"                   >>>>>>>>>>当前机构: "+corporation;
%>
<html>
<head>
<style>
td{font-size:9pt; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" src="<mast:ui js='main.js'/>"></script>
<title>conTop.jsp</title>
</head>
<script language="javascript">
function ShowHideTop(){//隐藏顶部banner和菜单
		if (top.fraTop.rows!="0,26,*,0"){
			top.fraTop.rows="0,26,*,0";
			icon_top.src="<mast:ui img='open_top.gif'/>";
		}else{
			top.fraTop.rows="76,26,*";
			icon_top.src="<mast:ui img='close_top.gif'/>";
		}
	}
function showPop()
{
	var ocols=top.content.document.all("frazuoyou").cols;
	var arrcol=ocols.split(',');
		if(arrcol[2]>10)
	{
		top.content.document.all("frazuoyou").cols='0,*,0';
		top.content.document.all("frazuoyou").frameSpacing='0';
		top.content.document.all("msg").style.borderLeftWidth=0;
	}
	else
	{
		top.content.document.all("frazuoyou").cols='0,*,240';
		top.content.document.all("frazuoyou").frameSpacing='5';
		top.content.document.all("msg").style.borderLeftWidth=1;
	}
}
      <%
   	int days=net.mast.waf.mvc.LicenseCheck.remainderDay(pageContext.getServletContext());
   	if(days>0&&days<=30){
      %>
      alert("离License失效还有"+<%=days%>+"天");
      <%
   	}
      %>

</script>
<body onselectstart="return false;">
<table border="0" height="100%" width="100%" cellspacing="0" cellpadding="0" style="border:1 solid gray;">
    <tr>
    <!--<td width="29" valign=top align=center background="<mast:ui img='m-bj.jpg'/>"><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
 WIDTH="28" HEIGHT="24" id="tt" ALIGN="">
 <PARAM NAME=movie VALUE="<%=SkinUtils.getImagePath(request)%>/topmsg.swf"> <PARAM NAME=quality VALUE=high><PARAM NAME=wmode VALUE=transparent> <PARAM NAME=bgcolor VALUE=#E7E7F7> <EMBED src="<%=SkinUtils.getImagePath(request)%>/topmsg.swf" quality=high bgcolor=#E7E7F7  WIDTH="28" HEIGHT="24" NAME="topmsg" ALIGN=""
 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
</OBJECT></td>-->
     
      <td width="70%" bgcolor="#e5e5e5" align="center" background="<mast:ui img='info_bg.gif'/>"  nowrap>
        <p align="left">&nbsp;&nbsp;<font color="#39475F"><%=message%></font></td>
      <td width="" bgcolor="#e5e5e5" align="center" background="<mast:ui img='info_bg.gif'/>" ><div onclick="ShowHideTop()" style="cursor:hand">
        <img id="icon_top" title="隐藏或者展开" border="0" src="<mast:ui img='close_top.gif'/>" align="right" ></div></td>
    </tr>
   </table>
</body>
</html>
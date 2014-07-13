<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="net.mast.bsp.lc.skin.BspSkin"%>
<HTML>
<HEAD>
<TITLE>√≈ªß</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skinportal.css'/>">

</HEAD>
<style>
BODY
{
padding:0;
margin:0;
background-color:#ffffff;

scrollbar-face-color: #CEE0EE;
scrollbar-highlight-color: #FFFFFF;
scrollbar-shadow-color: #CFE0F0;
scrollbar-3dlight-color: #8DB1D3;
scrollbar-arrow-color:  #006699;
scrollbar-track-color: #AEC4DC;
scrollbar-darkshadow-color: #8DB1D3;
}
td
{
font-size:9pt;
}

</style>
<BODY style="margin-right:0px;">
<%
String DESTOP_SHOW= (String)session.getAttribute(BspSkin.DESTOP_SHOW);

out.print(DESTOP_SHOW);
System.out.print(DESTOP_SHOW);
%>
</BODY>
</HTML>

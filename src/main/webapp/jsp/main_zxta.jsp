<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="net.mast.bsp.lc.skin.BspSkin" %>
<%@ page import="net.mast.waf.ComponentFactory"%>
<%@ page import="net.mast.bsp.lc.service.ICommonSingleParmsService"%>
<%@ page import="net.mast.bsp.lc.view.CommonSingleParmsView"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>

<HTML>
<HEAD><TITLE></TITLE>
<META http-equiv="Content-Type" content="text/html;charset=gb2312">
</HEAD>
<SCRIPT LANGUAGE="JavaScript">
var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
function startRequest(url) {
    createXMLHttpRequest();
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
}   
</SCRIPT>
<script for="window" event="onbeforeunload">  
 
      if(document.body.clientWidth-event.clientX< 170&&event.clientY< 0||event.altKey){ 	   	 
		 	startRequest("logout.cmd?method=logout");
      }
</script>
<%
//换肤功能
/*
ICommonSingleParmsService sps=(ICommonSingleParmsService)ComponentFactory.getBean("commonSingleParmsService");
String organId = GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganId();
CommonSingleParmsView view = (CommonSingleParmsView) sps.getCommonSingleParmsView(organId); 

if (view.getSingelStyle() != null && !view.getSingelStyle().equals(""))
{
	BspSkin skin=new BspSkin(request,view.getSingelStyle());	 
	session.setAttribute("Key.Skin",skin);
}
*/
%>
<frameset rows="85,*" id="fraTop"    frameSpacing="0" frameBorder="0">
	<FRAME id="banner" name="banner" src="top_zxta.jsp" noResize scrolling="no" target="contents">
  <FRAMESET id="fraContent" cols="8,148,0,*,8" framespacing="3" frameBorder="0" title="调整间距">
    <frame src="leftLine.html" name="leftLine" scrolling="No" noresize="noresize" id="leftLine" title="leftLine"  /> 
	<FRAME id="contents" name="contents"   src="left.jsp"   scrolling="no" target="main" TOPMARGIN="0" LEFTMARGIN="0" FRAMEBORDER="no" style="border-right:1 solid gray;">
    <FRAME  name="_tree" scrolling="auto" border="0" id="_tree" title="树" TOPMARGIN="0" LEFTMARGIN="0" FRAMEBORDER="no"  /> 

	<FRAME id="main" name="main" border="0" marginWidth="0" marginHeight="0" src="contentframe.jsp" frameBorder="0"  target="_self" TOPMARGIN="0" LEFTMARGIN="0"  bordercolor="#C2DBF1" style="border-left:1 solid gray;">
  <frame src="rightLine.html" name="rightLine" scrolling="No" noresize="noresize" id="rightLine" title="rightLine" /> 
  </FRAMESET>
   <noframes>
  <body>

  <p>此网页使用了框架，但您的浏览器不支持框架。</p>

  </body>
  </noframes>
</frameset>
</HTML>
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
ICommonSingleParmsService sps=(ICommonSingleParmsService)ComponentFactory.getBean("commonSingleParmsService");
String organId = GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganId();
CommonSingleParmsView view = (CommonSingleParmsView) sps.getCommonSingleParmsView(organId); 

if (view.getSingelStyle() != null && !view.getSingelStyle().equals(""))
{
	BspSkin skin=new BspSkin(request,view.getSingelStyle());	 
	session.setAttribute("Key.Skin",skin);
}
%>
<frameset rows="76,26,*" id="fraTop"    frameSpacing="0" frameBorder="0">
	<FRAME id="banner" name="banner" src="jsp/top.jsp" noResize scrolling="no" target="contents">
	<FRAME id="fraConTop" name="fraConTop" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none" border="0" marginWidth="0" marginHeight="0" src="jsp/conTop.jsp" frameBorder="0" noResize scrolling="no" TOPMARGIN="0" LEFTMARGIN="0">
  <FRAMESET id="fraContent" cols="148,*" framespacing="3" frameBorder="0" title="调整间距">
	<FRAME id="contents" name="contents"   src="jsp/left.jsp"   scrolling="no" target="main" TOPMARGIN="0" LEFTMARGIN="0" FRAMEBORDER="no" style="border-right:1 solid gray;">
	<FRAME id="main" name="main" border="0" marginWidth="0" marginHeight="0" src="jsp/contentframe.jsp" frameBorder="0"  target="_self" TOPMARGIN="0" LEFTMARGIN="0"  bordercolor="#C2DBF1" style="border-left:1 solid gray;">
  </FRAMESET>
  
  <noframes>
  <body>

  <p>此网页使用了框架，但您的浏览器不支持框架。</p>

  </body>
  </noframes>
</frameset>
</HTML>
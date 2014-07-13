<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css"
	href="<%=SkinUtils.getCSS(request, "leftmenu.css")%>">
<style type="text/css">
</style>
<TITLE></TITLE>
</HEAD>
<%	
String app=request.getContextPath();
%>

<script language="javascript" src='<%=SkinUtils.getJS(request,"XmlTreeMenu.js")%>'></script>
<BODY style="padding:0px;margin:0px;" scroll=no unselectable=on onresize="" >
<div id="menudiv" style="background-color: #eaf4fd" ></div>
<script language="javascript">
	function createMenuById(cell,isportal)
	{
	//alert(cell+","+isportal);
		document.all("menudiv").innerHTML='';
		menu.show("<%=app%>/menuxml.cmd",cell,isportal);
	}
	
try {
	var menu=new XmlTreeMenu("menu","<%=app%>","<%=SkinUtils.getImagePath(request)%>/menu/");
	menu.show("<%=app%>/menuxml.cmd",0,"0");
} catch (e) {
}

</script>

</BODY>
</HTML>

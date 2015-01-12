<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<html>
<head>
<LINK href="skin.css" rel=stylesheet type=text/css>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<title>明细</title>
<base target="_self">
</head>
<%
	String categoryId = "" + request.getAttribute( "categoryId" );
	if( categoryId == null )
		categoryId = "0";//默认为根节点
%>
<body style="padding:0;margin:0" scroll=no>
<html:messages />
<table border="0" width="300" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" valign="top">
<img src="<mast:ui img='xtgl.jpg'/>"></td>
  </tr>
</table>
</body>

</html>
<script language="javascript">
init();
function init()
{
//刷新根节点,根节点生成时默认nodeId=0
top.contents.new_date.refreshTreeNodeById('<%=categoryId%>');
}

</script>

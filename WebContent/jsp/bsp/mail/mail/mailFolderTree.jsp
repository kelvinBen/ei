<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</HEAD>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<%
	String serverType = (String)request.getAttribute("serverType");
%>
<BODY  topmargin="2" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form name="form1" action="">
<table width=100%>
     <tr>
     <td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href" hasRoot="true" rootText='ÎÄ¼þ¼Ð' style="width:100%;height:100%;white-space:nowrap;" isDataAsync="false">
	    <tree:selNode title="title" nodeId="nodeId" nodeValue="nodeValue" collection="tree" perImgSrc="perImgSrc" nodeXmlSrc="nodeXmlSrc"  caption="title">
	    </tree:selNode>
	</tree:selTree>
    </td>
    </tr>
</table>
</html:form>
<iframe style="display:none"  id="hideframe"></iframe>
<html:messages/>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node){
	var nodeId = node.NodeId;
	var serverType = node.NodeValue;
	if(nodeId==10031){
	getMainFrame().location.href="inboxmailquery.cmd?mailType=0&serverType="+serverType;
		seltree.xmlsrc="inboxmailquery.cmd?mailType=0&serverType="+serverType;
	}
	if(nodeId==10033){
	getMainFrame().location.href="sendmailquery.cmd?mailType=1&serverType="+serverType;
		seltree.xmlsrc="sendmailquery.cmd?mailType=1&serverType="+serverType;
	}
	if(nodeId==10034){
	getMainFrame().location.href="draftmailquery.cmd?mailType=3&serverType="+serverType;
		seltree.xmlsrc="draftmailquery.cmd?mailType=3&serverType="+serverType;
	}
	if(nodeId==10035){
	getMainFrame().location.href="garbagemailquery.cmd?mailType=4&serverType="+serverType;
		seltree.xmlsrc="garbagemailquery.cmd?mailType=4&serverType="+serverType;
	}
	if(nodeId==10036){
	getMainFrame().location.href="alreadysendmailquery.cmd?mailType=2&serverType="+serverType;
		seltree.xmlsrc="alreadysendmailquery.cmd?mailType=2&serverType="+serverType;
	}
}
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var serverType = node.NodeValue;
	if(nodeId==10031){
		getMainFrame().location.href="inboxmailquery.cmd?mailType=0&serverType="+serverType;
		seltree.xmlsrc="inboxmailquery.cmd?mailType=0&serverType="+serverType;
	}
	if(nodeId==10033){
		getMainFrame().location.href="sendmailquery.cmd?mailType=1&serverType="+serverType;
		seltree.xmlsrc="sendmailquery.cmd?mailType=1&serverType="+serverType;
	}
	if(nodeId==10034){
		getMainFrame().location.href="draftmailquery.cmd?mailType=3&serverType="+serverType;	
		seltree.xmlsrc="draftmailquery.cmd?mailType=3&serverType="+serverType;
	}
	if(nodeId==10035){
		getMainFrame().location.href="garbagemailquery.cmd?mailType=4&serverType="+serverType;	
		seltree.xmlsrc="garbagemailquery.cmd?mailType=4&serverType="+serverType;
	}
	if(nodeId==10036){
		getMainFrame().location.href="alreadysendmailquery.cmd?mailType=2&serverType="+serverType;	
		seltree.xmlsrc="alreadysendmailquery.cmd?mailType=2&serverType="+serverType;
	}
	
}
init();
function init()
{
	getMainFrame().location.href = "jsp/content.jsp";
	seltree.openNodeById("0");
}
</SCRIPT>

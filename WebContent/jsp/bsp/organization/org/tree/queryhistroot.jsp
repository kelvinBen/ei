<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
    String version=request.getParameter("version");
    String struId = (String)request.getAttribute("struId");
    if(struId==null || struId==""){
    	struId="1";
    }
%>
<html>
<head>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<SCRIPT LANGUAGE="JavaScript">
function init()
{
        getMainFrame().location.href = "jsp/content.jsp";
}
init();
</SCRIPT>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</SCRIPT>
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
        seltree.xmlsrc="stru.cmd?method=getHistNode&parentId="+node.NodeValue+"&version=<%=version%>";        
        getMainFrame().location.href="stru.cmd?method=versionDetail&primaryKey="+node.NodeValue+"&version=<%=version%>";
}
   //树展开到第二级  徐正礼  2006-02-09
   var struId = "<%=struId%>";
   seltree.refreshNodeByIdOnce(struId);
</SCRIPT>
</html>
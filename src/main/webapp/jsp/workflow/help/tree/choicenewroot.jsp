<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;
    String organType=(String)request.getAttribute("organType");
    String isCheckBox=(String)request.getAttribute("isCheckBox");
     String isIncludeSubCorporation=(String)request.getAttribute("isIncludeSubCorporation");
     String isIncludeStruPath = (String)request.getAttribute("isIncludeStruPath");
     String isExact = (String)request.getParameter("isExact");
     String showOrganType = (String)request.getParameter("showOrganType");
%> 
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY scroll=no  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<widgets:container title="选择目标成员" >
<table width="100%" height="80%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:384;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" radioData="RadioData"  caption="organName" perImgSrc="perImgSrc" >
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr>
    <td>
   <p align="center">
	<html:button name="confirmBtn" value="确定" onclick="showcheckdata()"></html:button>
    <html:button name="cancelBtn" value="取消" onclick="forCancel()"></html:button>
    <html:button name="clearBtn" value="清除" onclick="doCancel()"></html:button>
 </p>
    </td>
    </tr>
    </table>
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
       seltree.xmlsrc="wf_struhelp.cmd?method=getHelpTreeNode&rootId="+node.NodeId+"&organType=<%=organType%>&isCheckBox=<%=isCheckBox%>&isIncludeSubCorporation=<%=isIncludeSubCorporation%>&isIncludeStruPath=<%=isIncludeStruPath%>&isExact=<%=isExact%>&showOrganType=<%=showOrganType%>";        
}

function showcheckdata(){
	 var result = new Array();
	 var val=new Array();
	 val["primary-value"]=seltree.GetAllCheckData();
	 val["display-str"]=seltree.GetAllCheckText();
	 val["display-url"]='<%=MatrixHref.getUrl("Organ")%>'+seltree.GetAllCheckData();
	 result[0]=val;	 
	 
	
	window.returnValue=result;
	
	parent.close();
	
}
function forCancel(){
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
</SCRIPT>
</html>
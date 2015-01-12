<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%	 
	 String button_position=Constants.buttonPosition;
     String parentId = (String)request.getAttribute("parentId");
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form action="">
<widgets:container title="ѡ��Ŀ���Ա" >
<%
	if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="ȷ��"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="�ر�"></widgets:containbutton> 

<%}%>
<table width="100%" height="400">
	<tr><td>
		<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
		<tree:selNode title="objectName" nodeId="objectId" nodeValue="nodeValue" collection="functree" nodeXmlSrc="isTreeLeaf" radioData="RadioData" isChecked="isChecked" caption="" perImgSrc="perImgSrc">
		</tree:selNode>
		</tree:selTree>
	</td></tr>
	<tr>
	<%
		if("BottomCenter".equalsIgnoreCase(button_position)){
	%>
	<td><p align="center">
	 <html:button name="btn.add" value="ȷ��" onclick="showcheckdata()"></html:button>
	 <html:button name="btn.close" value="�ر�" onclick="forClose()"></html:button>
	</p>
	</td>
	<%}%>  
 </tr>
    </table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{  
	var parentId=node.NodeId;
    seltree.xmlsrc="function.cmd?method=getFunctionNodeHelp&parentId="+parentId;
}

function showcheckdata(){
	var returnV=new Array(3);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText();
	returnV[2]=seltree.GetAllCheckNodeId();
 	if(returnV[2]==""){
           alert("��ѡ��һ����¼��");
           return ;
    }
	window.returnValue=returnV;
	parent.close();
          
}
function forClose(){	
	parent.close();
}
</SCRIPT>

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%	String button_position=Constants.buttonPosition;
    String type=(String)request.getAttribute("type");
	String country = (String)request.getParameter("country");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY scroll=no topmargin="0" leftmargin="25" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<widgets:container title="选择目标成员" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="清 除"></widgets:containbutton>
<%}%>
<table width="100%" height="100%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false"   hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="cantName" nodeId="cantCode" nodeValue="cantCode"  collection="cant_tree" nodeXmlSrc="isLeaf" checkData="cantCode"  caption="">
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr>
     
    
<%
    if("BottomCenter".equalsIgnoreCase(button_position)){
%>
	       <td>
	        <p align="center">
			<jsp:include page="../../help_button.jsp" flush="true"/>
	        </p>
	       </td>
<%}%>   
 	
 
    </tr>
    </table>
</widgets:container>
</BODY>


<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
       seltree.xmlsrc="cant.cmd?method=getCheckNode&supercode="+node.NodeId;
}

function showcheckdata(){
	var returnV=new Array(3);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText();
	returnV[2]=seltree.GetAllCheckNodeId();
	if(returnV[0]==""){
           alert("请选择一条记录！");
           return ;
        }
	window.returnValue=returnV;
	parent.close();
}
function forCancel(){
    var returnV=new Array(3);
	returnV[0]="";
	returnV[1]="";
	returnV[2]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}
seltree.refreshNodeByIdOnce("<%=country%>");
</SCRIPT>
</html>
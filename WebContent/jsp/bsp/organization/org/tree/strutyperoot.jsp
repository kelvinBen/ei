
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY  scroll=no  >
<widgets:container title="选择目标成员" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton> 

<%}%>
<table width="100%" height="100%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" collection="functree" nodeXmlSrc="isLeaf"  radioData="RadioData"  caption="" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr>
<%
    if("BottomCenter".equalsIgnoreCase(button_position)){
%>
<td><p align="center">
 <html:button name="btn.add" value="确定" onclick="showcheckdata()"></html:button>
 <html:button name="btn.close" value="关闭" onclick="forClose()"></html:button>
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
        seltree.xmlsrc="stru.cmd?method=getStruTypeNode&nevervote=1&parentId="+node.NodeId;        
}
function showcheckdata(){
	var returnV=new Array(2);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText();
	if(returnV[2]==""){
       alert("请选择一条记录！");
       return false ;
    }
	window.returnValue=returnV;
	parent.close();
	//window.location.href ="stru.cmd?method=add&parentId=<%=request.getAttribute("parentId")%>&primaryKey="+seltree.GetAllCheckData();
}
function forCancel(){
var returnV=new Array(1);
    returnV[0]="";
    window.returnValue=returnV;
 parent.close();
}
function forClose(){
 parent.close();
}
</SCRIPT>
</html>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%
	String button_position=Constants.buttonPosition;
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
</head>
<BODY  scroll=no  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000">


<html:form name="form1" action="">
<widgets:container title="选择模块" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton> 

<%}%>
	<table width="100%" height="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="objectName" nodeId="objectId" nodeValue="isLeaf" radioData="radioData" collection="moduletree" nodeXmlSrc="isTreeLeaf" caption="" perImgSrc="perImgSrc">
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
</html:form>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{     

  var arr = split(node.NodeId);
  if(arr == "error"){
  	return;
  }
  seltree.xmlsrc="module.cmd?method=getModuleNode&objectId="+node.NodeId;   
}

function split(node){
  var nodeId=node;
  if(nodeId==null || nodeId == ""){
  	return "error";//错误NodeId标识
  }
  var arr = new Array(2);
  var i=nodeId.indexOf(',');
  var l=nodeId.length;
  if(i==-1) {
    arr[0]="-1";
    arr[1]="-1";
    return arr;
  }
  else{
    arr[0]=nodeId.substring(0,i);
    arr[1]=nodeId.substring(i+1,l);
    return arr;
  }
}
function showcheckdata(){
   var returnV=new Array(3);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText(); 
	returnV[2]=seltree.GetAllCheckNodeId();
	if(returnV[2]==""){
		alert("请选择一条记录！");
		return ;
	}
    window.returnValue=returnV;
    parent.close();
    
}
function forClose(){
    var returnV=new Array(3);
	returnV[0]="";
	returnV[1]="";
	returnV[2]="";
	window.returnValue=returnV;
	parent.close();
}
seltree.refreshNodeByIdOnce("root");
</SCRIPT>

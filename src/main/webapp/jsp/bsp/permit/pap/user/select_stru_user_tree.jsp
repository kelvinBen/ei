<%@ taglib uri="/WEB-INF/tlds/web-seltree.tld" prefix="tree"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%
	String button_position=Constants.buttonPosition;
    String corporationId = (String)request.getAttribute("corporationId"); 
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
<% 
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<%}%>
<table width="100%" height="80%">
   <tr>
   <td>
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="radio" hasRoot="false" rootText="用户列表"  style="width:100%;height:400;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="OBJECTNAME" nodeId="OBJECTID" nodeValue="TYPE" collection="user_tree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" radioData="RadioData" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>	
	</tr>
       <tr align="center"> 
		<%
		    if("BottomCenter".equalsIgnoreCase(button_position)){
		%>
		<td align="center">
		 <html:button name="btn.add" value="确定" onclick="showcheckdata()"></html:button>
		 <html:button name="btn.close" value="关闭" onclick="forClose()"></html:button>
		</td>
		<%}%> 
       </tr>	
</table>
</widgets:container>
 
</BODY>
<SCRIPT LANGUAGE="JavaScript">
function showcheckdata(){
	var returnV=new Array(5); 
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText();
	returnV[2]=seltree.GetAllCheckNodeId();
	if(returnV[2]==""){
           alert("请选择一条记录！");
           return ;
    }
	var arr = seltree.GetAllCheckNodeValue();
        var s = arr.split("$");
        var organCode = s[0];
        var note = s[1];
        returnV[3] = organCode;
        returnV[4] = note;
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
    parent.close();
}
function split(node){
  var nodeId=node;
  if(nodeId == null || nodeId == ""){
  	return "error";//用来标识nodeId未取到
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

seltree.clickImg=function(node)
{
 if(node.title!=null){
  var nodeId=node.NodeId; 
  var arr=split(nodeId);
  if(arr == "error"){
  	return;
  }
  if(arr[1]=="S")
  { 
  	seltree.xmlsrc="userhelp.cmd?method=getStruUserNode&OBJECTID="+arr[0];    
  }
	  else if(arr[1]=="N"){ 
	     return;
  }
 } 
}
seltree.clickText=function(node)
{
 if(node.title!=null){
  var nodeId=node.NodeId;
  var arr=split(nodeId);
  if(arr[1]=="S")
  {
  seltree.xmlsrc="userhelp.cmd?method=getStruUserNode&OBJECTID="+arr[0];
  }   
 } 
}
var corporationId = "<%=corporationId%>";
corporationId=corporationId+",S";
seltree.refreshNodeByIdOnce(corporationId);
</SCRIPT>
</html>
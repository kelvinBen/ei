<%@ taglib uri="/WEB-INF/tlds/web-seltree.tld" prefix="tree"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="java.util.*"%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">

<html>
<head>  
<title></title>
</head>
<%
     String corporationId = (String)request.getAttribute("corporationId");
     String corporationName = (String)request.getAttribute("corporationName");
%>

<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<table width="100%">
   <tr>
   <td>
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="href" hasRoot="false" rootText="用户列表" isDataAsync="false" rootId="0" style="width:100%;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="OBJECTNAME" nodeId="OBJECTID" nodeValue="TYPE" collection="user_tree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
	</tr>
</table>
<iframe style="display:none"  id="hidframe"></iframe>
</BODY>
<SCRIPT LANGUAGE="JavaScript">

function split(node){
  var nodeId=node;
  if(nodeId == null || nodeId == ""){
  	return "error";
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
  		seltree.xmlsrc="strumenudefine.cmd?method=getStruUserNode&OBJECTID="+arr[0];    
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
	  getMainFrame().location.href = "jsp/content.jsp";
	  seltree.xmlsrc="strumenudefine.cmd?method=getStruUserNode&OBJECTID="+arr[0];  
  }   
  else if(arr[1]=="N"){
     return;
  }else
  {
	  getMainFrame().location.href="newMenu.cmd?method=forChangeStruMenu&userId="+arr[0];
  }
 } 
}

function refreshTree()
{
         
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         getTreeFrame().seltree.refreshNodeById(parentId);
}
function refreshTree(){
	getTreeFrame().location.href="user.cmd?method=getStruUserRoot";
}
 
  
 
var corporationId = "<%=corporationId%>";
corporationId=corporationId+",S";
seltree.refreshNodeByIdOnce(corporationId);
//也可以采用下面的方式进行刷新,这样的方法不需要出入Id,具有更加灵活的特点
//seltree.openRootNode();
</SCRIPT>
</html>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
     String struId=(String)request.getAttribute("struId");
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

</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" onload="init();" >
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
  

seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("定义个性化菜单","删除个性化菜单","导入"),new Array("defineMenu();","delMenu();","importMenu();"),new Array("定义个性化菜单","删除个性化菜单","导入"));
		seltree.insertNodeMenu(new Array("定义个性化菜单","删除个性化菜单","导入"),new Array("defineMenu();","delMenu();","importMenu();"),new Array("定义个性化菜单","删除个性化菜单","导入"));
		seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
function importMenu(){
	getMainFrame().location.href = "strumenudefine.cmd?method=forImportMenu"; 
}
seltree.clickImg=function(node)
{
        seltree.xmlsrc="strumenudefine.cmd?method=getnode&parentId="+node.NodeId;        
}
seltree.clickText=function(node)
{
    seltree.xmlsrc="strumenudefine.cmd?method=getnode&parentId="+node.NodeId;   
} 
//定义个性化菜单
function defineMenu(){
	var struId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var parentId = "-1";
	if(seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode)!=null)
	   parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId; 
	var uri="strumenudefine.cmd?method=getMenuStruRoot&struId="+struId;  
	startRequest(uri);	
	getMainFrame().location.href=uri;
	//getTreeFrame().seltree.refreshNodeById(parentId);        
}
var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}    
function startRequest(url) {
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
}   
function handleStateChange() {
	if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           self.seltree.refreshNodeById(parentId);
        }
    }
}
function delMenu(){
	var struId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="jsp/content.jsp";
	
	var url = "strumenudefine.cmd?method=delMenuStru&struId="+struId;
    var rtnValue = startRequest(url);	
    if(rtnValue.trim()=="OK"){
       return;
    }else{
    	alert(rtnValue);
    }  
}

var struId="<%=struId%>";
seltree.refreshNodeByIdOnce(struId);
function openNode(id){
	seltree.openNodeById(id);
}
</SCRIPT>
</html>
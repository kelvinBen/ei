<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-html" prefix="html" %>
<web:js src="bsp.js"/>
<web:js src="XMLSelTree.js"/>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<html>
<head>
<title></title>
</head>
<BODY bgcolor="#EAF4FD">
<table width=100%  height=100%>
   <tr>
   <td>
	<tree:selTree treeName="seltree" isShowElseBranch="true" rootId="root" containId="SrcDiv" type="radio" hasRoot="false"leafImg="column_img.gif" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organAlias" nodeValue="organType" toolTip="organId" nodeId="organId" collection="treeCollection" perImgSrc="nodeImgSrc"  toolTip="organId"  nodeXmlSrc="isLeaf"  caption="organId">
	    </tree:selNode>
	</tree:selTree>
	</td>
	</tr>
</table>
</BODY>

<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node){
	seltree.xmlsrc="organstru.cmd?method=getChildren&nodeId="+node.NodeId;
} 
seltree.clickText=function(node){
	var nodeId=node.NodeId;
	seltree.xmlsrc="organstru.cmd?method=getChildren&nodeId="+node.NodeId;
 	if(nodeId!='root'){		
 			getMainFrame().location.href="organstru.cmd?method=detail&primaryKey="+node.NodeId;
 	}
}
function update(){
		var nodeId=seltree.getValue("NodeId");
		getMainFrame().location.href="organstru.cmd?method=forupdate&primaryKey="+nodeId;
}
function detail(){
	var nodeId=seltree.getValue("NodeId");
	getMainFrame().location.href="organstru.cmd?method=detail&primaryKey="+nodeId;
}
function insert(){
	var nodeId=seltree.getValue("NodeId");
	getMainFrame().location.href="organstru.cmd?method=forinsert&primaryKey="+nodeId;
}
function delete1(){
	var nodeId=seltree.getValue("NodeId");
	if(!confirm('<%=ResourcesFactory.getString("TREE_NODE.DELETE_CONFIRM")%>')) return;
	getMainFrame().location.href="jsp/content.jsp";
	startRequest("organstru.cmd?method=delete&primaryKey="+nodeId);

}
function forOrder(){
    var nodeId=seltree.getValue("NodeId");
	var uri ="organstru.cmd?method=getChangeOrderRoot&primaryKey="+nodeId;          
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	  if (win == null) {  
	  	return;
	  }else{
	   getMainFrame().location.href=win[0];
	 }
}
seltree.loadRightMouseMenu()
{
	seltree.insertMenuByNodeValue("root",new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDUNIT")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'),new Array("insert();","forOrder();"),new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'));
	seltree.insertNodeMenu(new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'),new Array("insert();","update();","detail();","delete1();","forOrder();"),new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'));
	seltree.insertLeafMenu(new Array('<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>'),new Array("update();","detail();","delete1();"),new Array('<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>'));
	seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
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
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}    
function handleStateChange() {
	if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
           // alert("The server replied with: " + xmlHttp.responseText);
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           self.seltree.refreshNodeById(parentId);
        }
    }
}
//seltree.refreshNodeByIdOnce("root");
seltree.openRootNode("root");
</SCRIPT>

</html>

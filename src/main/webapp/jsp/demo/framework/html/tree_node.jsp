<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-html" prefix="html" %>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<web:js src="bsp.js"/>
<web:js src="XMLSelTree.js"/>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<html>
<head>
<title></title>
</head>
<BODY bgcolor="#EAF4FD">
<html:submit name="submit" value="Test JS function"onclick="test()"></html:submit>
<table width=100%  height=100%>
   <tr>
   <td>
	<tree:selTree treeName="seltree" isShowElseBranch="true" rootId="01" containId="SrcDiv" type="checkbox" hasRoot="false"leafImg="column_img.gif" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	    <tree:selNode title="organAlias" nodeValue="organType" nodeId="organId" collection="treeCollection" type="sorted" toolTip="organAlias"  nodeXmlSrc="isLeaf"  caption="organAlias">
	    </tree:selNode>
	</tree:selTree>
	</td>
	</tr>
</table>
</BODY>

<SCRIPT LANGUAGE="JavaScript">
//alert(document.body.innerHTML);
function test(){
  //alert(seltree.GetAllCheckData());
  //alert(seltree.GetAllCheckText());
  //alert(seltree.GetAllCheckNodeId());
  //alert(seltree.getValue("title"));
  alert(seltree.getValue("caption"));
  //alert(seltree.getValue("title"));
  alert(seltree.GetNodeById("010102").innerHTML); 
  //seltree.refreshNodeByIdOnce("010101");
  //seltree.openNodeById("01,0101,010101");
  //seltree.hidNodeById("010101");

}
seltree.clickImg=function(node){
var nodeId=node.NodeId;	
	//var arr=seltree.getSortedChildrenNodes(nodeId);
	//alert(arr[0].nodeId);
 	getMainFrame().location.href="lsemployee.cmd?method=detail&primaryKey="+node.NodeId;
}
seltree.clickText=function(node){
	var nodeId=node.NodeId;	
	//var arr=seltree.getSortedChildrenNodes(nodeId);
	//alert(arr[0].nodeId);
 	getMainFrame().location.href="lsemployee.cmd?method=detail&primaryKey="+node.NodeId;
}
function update(){
		var nodeId=seltree.getValue("NodeId");
		getMainFrame().location.href="lsemployee.cmd?method=forupdate&primaryKey="+nodeId;
}
function detail(){
	var nodeId=seltree.getValue("NodeId");
	getMainFrame().location.href="lsemployee.cmd?method=detail&primaryKey="+nodeId;
}
function insert(){
	var nodeId=seltree.getValue("NodeId");
	getMainFrame().location.href="lsemployee.cmd?method=forinsert&primaryKey="+nodeId;
}
function delete1(){
	var nodeId=seltree.getValue("NodeId");
	if(!confirm('<%=ResourcesFactory.getString("TREE_NODE.DELETE_CONFIRM")%>')) return;
	getMainFrame().location.href="jsp/content.jsp";
	startRequest("lsemployee.cmd?method=delete&primaryKey="+nodeId);

}
function forOrder(){
    var nodeId=seltree.getValue("NodeId");
}
function query(){
    var organOrder= window.prompt('<%=ResourcesFactory.getString("TREE_NODE.INPUTTREECODE")%>');
    seltree.openNodeById(organOrder,"\\");
 
}
seltree.loadRightMouseMenu()
{
	seltree.insertMenuByNode("01",new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDUNIT")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>','<%=ResourcesFactory.getString("COMMON.SEARCH")%>'),new Array("insert();","forOrder();","query();"),new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT)%>','<%=ResourcesFactory.getString("COMMON.SEARCH")%>'));
	seltree.insertNodeMenu(new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'),new Array("insert();","update();","detail();","delete1();","forOrder();"),new Array('<%=ResourcesFactory.getString("TREE_NODE.ADDSUB")%>','<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>','<%=ResourcesFactory.getString("TREE_NODE.SORT")%>'));
	seltree.insertLeafMenu(new Array('<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>'),new Array("update();","detail();","delete1();"),new Array('<%=ResourcesFactory.getString("COMMON.MODIFY")%>','<%=ResourcesFactory.getString("COMMON.DETAIL")%>','<%=ResourcesFactory.getString("COMMON.DELETE")%>'));
	seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
</SCRIPT>
</html>

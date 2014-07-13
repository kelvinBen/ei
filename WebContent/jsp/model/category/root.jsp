<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<sotower:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<sotower:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" class=”treePageCss” text="#000000" >  
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="desc" nodeId="categoryId" nodeValue="parent" collection="treedata" nodeXmlSrc="isLeaf" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
    seltree.xmlsrc="soacategory.cmd?method=getModel&parentid="+node.NodeId+"&rtnpath=node"; 
    getMainFrame().location.href = "jsp/content.jsp";
    getMainFrame().location.href ="soacategory.cmd?method=detail&primaryKey="+node.NodeId;        
}
seltree.loadRightMouseMenu()
{
	var name = new Array("增加模块","删除","修改","明细");
	var method = new Array("forInsert();","forDelete();","forUpdate();","forDetail();");
	seltree.insertNodeMenu(name,method,name);
	seltree.insertLeafMenu(name,method,name);
} 
function forDelete(){
  if(!getDelete()) return;
  getMainFrame().location.href ="soacategory.cmd?method=delete";    	
}
function getDelete(){
  var path = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
  
  if(path=="-1"){
  	alert("根节点不允许删除");
  	return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
  }  
  return true;
}
function forInsert(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacategory.cmd?method=forinsert&parentId="+currentId;    	
}
function forUpdate(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacategory.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetail(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacategory.cmd?method=detail&primaryKey="+currentId;    	
}
function forDelete(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="soacategory.cmd?method=delete&primaryKey="+currentId ;
  getMainFrame().location.href="jsp/content.jsp";
  var rtnValue =startRequest(url);	//采用HTTP同步的方式刷新树形节点 
  if(rtnValue.trim() == "OK"){
  	return;
  }else{
	alert(rtnValue);
  }   	
}
//下面的都是实现新的删除节点刷新方式的脚本方法，由web组件提供的
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
           // alert("The server replied with: " + xmlHttp.responseText);
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           self.seltree.refreshNodeById(parentId);
        }
    }
}

</SCRIPT>


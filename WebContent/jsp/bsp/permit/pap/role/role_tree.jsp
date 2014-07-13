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
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<table width=100%>
   <tr>
   <td>
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="href" hasRoot="false" rootText="角色列表" style="width:100%;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="roleAlias" nodeId="roleId" nodeValue="roleId" collection="role_tree" nodeXmlSrc="isLeaf"  caption="">
	    </tree:selNode>
	</tree:selTree>
   </td>
   </tr>
</table>
	
<iframe style="display:none"  id="hidframe"></iframe>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickText=function(node)
{       if(node.NodeId=="00"){   
           getMainFrame().location.href = "jsp/content.jsp";
           seltree.xmlsrc="role.cmd?method=getnode";
        } 
        else{
           getMainFrame().location.href="role.cmd?method=detail&roleId="+node.NodeId+"&refreshId=00";
           }
}
//徐正礼  2006-02-08  点击角色树的加号符号使角色树能够正常展开，而不是点击后变成减号但是树为空的现象
seltree.clickImg=function(node)
{     
  var arr = split(node.NodeId);
  seltree.xmlsrc="role.cmd?method=getnode"; 
  if(node.parentElement.type=="leaf")
  getMainFrame().location.href="role.cmd?method=detail&roleId="+node.NodeId+"&refreshId=00";
      
}
function split(node){
  var nodeId=node;
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


seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("增加","修改","删除","批量授权"),new Array("add();","update();","del();","forExportForOneRole();"),new Array("增加","修改","删除","批量授权"));
	//	seltree.insertNodeMenu(new Array("增加角色","导出角色","导入角色"),new Array("addRole();","forExport();","forImport();"),new Array("增加角色","导出角色","导入角色"));
}
function forExport(){
    if(!getExport()) return; 
	getMainFrame().location.href = "role.cmd?method=forExportRole";   
}
// 批量授权
function forExportForOneRole(node){
   // if(!getExport()) return;
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
	getMainFrame().location.href = "role.cmd?method=forbatchGrant&roleId="+currentId;  
	 
}
function getExport(){
  if (!confirm("确认导出该法人下的角色吗?")) {
	return false;
  }  
  return true;
}
function forImport(){ 
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="role.cmd?method=forImportRole&refreshId="+currentId;
}
function addRole(){
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         getMainFrame().location.href="role.cmd?method=forinsert&roleId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&refreshId="+currentId;
}
function add()
{        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         getMainFrame().location.href="role.cmd?method=forinsert&roleId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&refreshId="+parentId;
	
}
function update()
{        
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         getMainFrame().location.href="role.cmd?method=forupdate&roleId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&refreshId="+parentId;
	
}

function refreshTree()
{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
}

function del()
{        if(!confirm("删除操作具有不可恢复性，您确定要删除当前角色吗？")) return; 
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         //getTreeFrame().hidframe.location.href="role.cmd?method=delete&roleId="+currentId;
         //下面的两句是改动之前的删除节点的刷新方法
	     //getMainFrame().location.href="role.cmd?method=delete&roleId="+currentId;
	     //setTimeout(refreshTree,200);
	     //下面是使用同步方式进行删除节点的刷新方式，徐正礼---2006-02-05
	     getMainFrame().location.href="jsp/content.jsp";
	     var rtnValue = startRequest("role.cmd?method=delete&roleId="+currentId);	
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
seltree.openRootNode();
</SCRIPT>
</html>
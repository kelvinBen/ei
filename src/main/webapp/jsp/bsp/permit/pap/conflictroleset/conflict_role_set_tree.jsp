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

	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="href" hasRoot="false" rootText="不相容角色集列表" style="width:180;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="setName" nodeId="setId" nodeValue="setId" collection="conflict_role_set_tree"  nodeXmlSrc="isLeaf" caption="">
	    </tree:selNode>
	</tree:selTree>	
<iframe style="display:none"  id="hidframe"></iframe>

</BODY>
<SCRIPT LANGUAGE="JavaScript">

seltree.clickText=function(node)
{       if(node.NodeId=="00"){   
           getMainFrame().location.href = "jsp/content.jsp";
           seltree.xmlsrc="conflictRoleSet.cmd?method=getNode";
        } 
        else
        {
           getMainFrame().location.href="conflictRoleSet.cmd?method=detail&setId="+node.NodeId;
        }
}
//徐正礼  2006-02-08  点击不相容角色树的加号符号使不相容角色树能够正常展开，而不是点击后变成减号但是树为空的现象
seltree.clickImg=function(node)
{     
  var arr = split(node.NodeId);
  seltree.xmlsrc="conflictRoleSet.cmd?method=getNode"; 
  if(node.parentElement.type=="leaf")
  getMainFrame().location.href="conflictRoleSet.cmd?method=detail&setId="+node.NodeId;
      
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
		seltree.insertLeafMenu(new Array("增加","修改","删除"),new Array("add();","update();","del();"),new Array("增加","修改","删除"));
		seltree.insertNodeMenu(new Array("增加不相容角色集"), new Array("addConfRoleSet();"),new Array("增加不相容角色集"));
}

function add()
{     
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getMainFrame().location.href="conflictRoleSet.cmd?method=forinsert&refreshId="+parentId;
}

function addConfRoleSet()
{
        var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
        getMainFrame().location.href="conflictRoleSet.cmd?method=forinsert&setId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&refreshId="+currentId;
}

function update()
{  
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
    	getMainFrame().location.href="conflictRoleSet.cmd?method=forupdate&setId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&refreshId="+parentId;
}
//2005年10月27日加上的add by xuzhl，为了解决不相容角色树删除的时候不能即时刷新的问题
function refreshTree()
{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
}
function del()
{     
  	    if(!confirm("删除操作具有不可恢复性，您确定要删除当前不相容角色集吗？")) return; 
        var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        //getTreeFrame().hidframe.location.href="conflictRoleSet.cmd?method=delete&setId="+currentId;
	    //getMainFrame().location.href="conflictRoleSet.cmd?method=delete&setId="+currentId;
	    //getTreeFrame().seltree.refreshNodeById(parentId);以前的刷新方案
	    //setTimeout(refreshTree,150);	
	    
	   //下面是使用同步方式进行删除节点的刷新方式，徐正礼---2006-02-05
	   getMainFrame().location.href="jsp/content.jsp";
	   var rtnValue = startRequest("conflictRoleSet.cmd?method=delete&setId="+currentId);	
	   //增加异常提示 － zhb 20060324   
	     if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }      	    
}
//下面的都是实现新的删除节点刷新方式的脚本方法，由web组件提供的  徐正礼 2006-02-05
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
seltree.refreshNodeByIdOnce(00);
</SCRIPT>
</html>
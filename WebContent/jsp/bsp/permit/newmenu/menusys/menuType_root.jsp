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
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="href" hasRoot="false" rootText="系统菜单" style="width:100%;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="typeName" nodeId="typeId" nodeValue="typeId" collection="menuType_tree" nodeXmlSrc=""  caption="">
	    </tree:selNode>
	</tree:selTree>
   </td>
   </tr>
</table>
	
<iframe style="display:none"  id="hidframe"></iframe>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickText=function(node)
{       
		getMainFrame().location.href="menusys.cmd?method=getMenuSysRoot&menuTypeId="+node.NodeId+"&refreshId="+node.NodeId;
		if(node.NodeId=="00"){   
           getMainFrame().location.href = "jsp/content.jsp";
           seltree.xmlsrc="menusys.cmd?method=getMenuTypeNode";
        } 
}

seltree.clickImg=function(node)
{     
 if(node.NodeId=="00"){   
           getMainFrame().location.href = "jsp/content.jsp";
           seltree.xmlsrc="menusys.cmd?method=getMenuTypeNode";
        }    
}
seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("增加菜单","设为默认菜单","重命名","删除"),new Array("addMenu();","setCurrent();","forupdatemenutype();","delMenu();"),new Array("增加菜单","设为默认菜单","重命名","删除"));
		//seltree.insertNodeMenu(new Array("增加菜单","导入菜单"),new Array("addMenu();","importMenu();"),new Array("增加菜单","导入菜单"));
		//去掉系统菜单根节点的导入右键菜单
		seltree.insertNodeMenu(new Array("增加菜单"),new Array("addMenu();"),new Array("增加菜单"));
}
//导入
//function importMenu(){
//	getMainFrame().location.href = "menusys.cmd?method=forImportMenu"; 
//}

function forupdatemenutype(){
	var id= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="menusys.cmd?method=forUpdateMenuType&typeId="+id;
}

function addMenu(){
	getMainFrame().location.href="menusys.cmd?method=forAddMenuType";
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
	if (!confirm("真的要删除该类型的系统菜单吗？此操作不能恢复！")) {
	 	return false;
	} 
	var id= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href = "jsp/content.jsp";
	
	var url = "menusys.cmd?method=delMenuType&typeId="+id;
    var rtnValue = startRequest(url);
    if(rtnValue.trim()=="OK"){
       return;
    }else{
    	alert(rtnValue);
    }
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);	
	seltree.refreshNodeById(pid);
	
}
function setCurrent(){
	var menuTypeId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var result=sendxmlhttp("menusys.cmd?method=setCurrent&menuTypeId="+menuTypeId+"&refreshId="+menuTypeId);
	if(result.length<50){
		alert(result);
		if(getTreeFrame().seltree!=null){
			getTreeFrame().seltree.refreshNodeById("00"); 
		}
	}else{
		alert("设置失败！");
	}
}

function sendxmlhttp(url){
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
	        conn.send();
	        return conn.responseText;
	}

seltree.openRootNode();
</SCRIPT>
</html>
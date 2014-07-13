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
//如果是机构则列出下级  右边变成空白窗口
//如果是用户则显示用户明细
//alert("1");
//alert(node.title);
//alert(node.outerHTML);
 if(node.title!=null){
  var nodeId=node.NodeId;
  //alert(nodeId);
  var arr=split(nodeId);
  if(arr == "error"){
  	return;
  }
  if(arr[1]=="S")
  {//点中的是部门
  seltree.xmlsrc="user.cmd?method=getStruUserNode&OBJECTID="+arr[0];    
  }
  else if(arr[1]=="N"){
  //alert("ok2");
     return;
  }
 // else{
  //alert("ok3");
  //return;
  //var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
  //getMainFrame().location.href="user.cmd?method=detail&userId="+arr[0];
  //}
 } 
}

seltree.clickText=function(node)
{
//如果是机构则列出下级  右边变成空白窗口
//如果是用户则显示用户明细
 //alert(node.outerHTML);
 if(node.title!=null){
  var nodeId=node.NodeId;
  var arr=split(nodeId);
  if(arr[1]=="S")
  {
  //getMainFrame().location.href = "jsp/content.jsp";
    queryUser(node);//改成查询当前部门
  seltree.xmlsrc="user.cmd?method=getStruUserNode&OBJECTID="+arr[0];  
  }   
  else if(arr[1]=="N"){
     return;
  }else
  {
  var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
  getMainFrame().location.href="user.cmd?method=detail&userId="+arr[0];
  }
 } 
}

seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("增加","修改","删除"),new Array("add();","update();","del();"),new Array("增加","修改","删除"));
		seltree.insertNodeMenu(new Array("增加用户","查询用户"),new Array("addUser();","queryUser()"),new Array("增加用户","查询用户"));
		seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
seltree.loadRightMouseMenuByNode=function()
{
	seltree.insertMenuByNodeValue("stru",new Array("增加用户","查询用户","导出用户","导入用户"),new Array("addUser();","queryUser()","forExport();","forImportUser();"),new Array("增加用户","查询用户","导出用户","导入用户"));
	seltree.insertMenuByNodeValue("user",new Array("增加","修改","复制数据权限","变更所属部门","删除","导出用户"),new Array("add();","update();","copy();","changeDepartment();","del();","forExportForUser();"),new Array("增加","修改","复制数据权限","变更所属部门","删除","导出用户"));
	
}
function forExport()
{
    if(!getExport()) return; 
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
    var arr = split(currentId);
	getMainFrame().location.href = "user.cmd?method=forExportUser&struId="+arr[0];
}
function forExportForUser()
{
    if(!getExport()) return; 
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
    var arr = split(currentId);
	getMainFrame().location.href = "user.cmd?method=forExportOneUser&struId="+arr[0];
}
function getExport(){
  if (!confirm("确认导出该用户吗?")) {
	return false;
  }  
  return true;
}
function forImportUser(){ 
//	var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
    var arr = split(currentId);
    var struId=arr[0];
    var url="user.cmd?method=forImportUser&refreshId="+corporationId+"&struId="+struId;
    //alert(url);
	getMainFrame().location.href=url;
}
function addUser(){
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
         var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
         var arr = split(currentId);
         if(arr[0]=="<%=corporationId%>") {
             currentName ="<%=corporationName%>";
         }
         if(arr[1]=="N"){
             alert("受权限约束，登录用户不能创建该机构的用户！");
             return;
         }
         getMainFrame().location.href="user.cmd?method=forinsert&departmentId="+arr[0]+"&departmentName="+currentName+"&refreshId="+currentId;
}

function queryUser(node){
		var currentId ="";
		 if(node){
		 	currentId=node.NodeId;
		 }else{
         	var currentId = seltree.TreeConfig.TreeCurrentNode.children[2].NodeId;
         	var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
         }
         var arr = split(currentId);
         if(arr[1]=="N"){
             alert("受权限约束，登录用户不能查询该机构的用户！");
             return;
         }else{
         	
         }
         var url="userQuery.cmd?method=query&isFirstQuery=1&struId="+arr[0];
         getMainFrame().location.href=url;
         
}

function add()
{       
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
         var parentName=seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
         var arr =split(parentId);
         
         if(arr[0]=="<%=corporationId%>") {
             currentName ="<%=corporationName%>";
         }    
         getMainFrame().location.href="user.cmd?method=forinsert&departmentId="+arr[0]+"&departmentName="+parentName+"&refreshId="+parentId;
}
function update()
{        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var arr = split(currentId);  
         getMainFrame().location.href="user.cmd?method=forupdate&userId="+arr[0]+"&refreshId="+parentId;
}
//function refreshTree()
//{
         
  //       var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
  //       getTreeFrame().seltree.refreshNodeById(parentId);
//}

function refreshTree(){
	getTreeFrame().location.href="user.cmd?method=getStruUserRoot";
}
//变更所属部门 2006-05-08
function changeDepartment(){
	var url ="user.cmd?method=getStruUserRoot&isSelect=1";      
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");  
	if (win == null) {  
		return;
	}else{
		
		var departmentId = win[2].split(",");
	    var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	 	var arr = split(currentId); 	 
		getMainFrame().location.href="user.cmd?method=changeDepartment&userId="+arr[0]+"&departmentId="+departmentId[0]+"&departmentName="+win[1];
		refreshTree();
		}
}
function del()
{        
         if(!confirm("删除操作具有不可恢复性，您确定要删除当前用户吗？")) return; 
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var arr = split(currentId);
        // getMainFrame().location.href="user.cmd?method=delete&userId="+arr[0];
        //setTimeout(refreshTree,200);  
        //下面是采用新的刷新树的方法进行的  徐正礼  2006-02-05
        getMainFrame().location.href="jsp/content.jsp";
	    var rtnValue = startRequest("user.cmd?method=delete&userId="+arr[0]); 
	    //增加异常提示 － zhb 20060324  
	    if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }       
}
//复制用户数据权限 -郑斌 2006-03-09
function copy(){
		if(!confirm("复制数据权限会先删除用户当前的数据权限，你确定要复制其他用户的数据权限吗？")) return; 
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var oPid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
		var url ="jsp/help.jsp?url=user.cmd&method=getFromRoot&toId="+id;
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
		if(win==null){
			return;
		}
		var arr = split(id);
		//sendxmlhttp("newmenu.cmd?method=moveDown&ID="+id);
		getMainFrame().location.href="user.cmd?method=detail&userId="+arr[0]+"&fromId="+win[0]+"&flag=copyData";
		//seltree.refreshNodeById(win[0]);
		//seltree.refreshNodeById(oPid);
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
           // alert("The server replied with: " + xmlHttp.responseText);
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           self.seltree.refreshNodeById(parentId);
        }
    }
}
var corporationId = "<%=corporationId%>";
corporationId=corporationId+",S";
seltree.refreshNodeByIdOnce(corporationId);
//也可以采用下面的方式进行刷新,这样的方法不需要出入Id,具有更加灵活的特点
//seltree.openRootNode();
</SCRIPT>
</html>
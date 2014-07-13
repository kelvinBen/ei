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
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="href" hasRoot="false" rootText="�û��б�" isDataAsync="false" rootId="0" style="width:100%;height:100%;overflow:auto;white-space:nowrap;">
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
  	return "error";//������ʶnodeIdδȡ��
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
//����ǻ������г��¼�  �ұ߱�ɿհ״���
//������û�����ʾ�û���ϸ
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
  {//���е��ǲ���
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
//����ǻ������г��¼�  �ұ߱�ɿհ״���
//������û�����ʾ�û���ϸ
 //alert(node.outerHTML);
 if(node.title!=null){
  var nodeId=node.NodeId;
  var arr=split(nodeId);
  if(arr[1]=="S")
  {
  //getMainFrame().location.href = "jsp/content.jsp";
    queryUser(node);//�ĳɲ�ѯ��ǰ����
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
		seltree.insertLeafMenu(new Array("����","�޸�","ɾ��"),new Array("add();","update();","del();"),new Array("����","�޸�","ɾ��"));
		seltree.insertNodeMenu(new Array("�����û�","��ѯ�û�"),new Array("addUser();","queryUser()"),new Array("�����û�","��ѯ�û�"));
		seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
seltree.loadRightMouseMenuByNode=function()
{
	seltree.insertMenuByNodeValue("stru",new Array("�����û�","��ѯ�û�","�����û�","�����û�"),new Array("addUser();","queryUser()","forExport();","forImportUser();"),new Array("�����û�","��ѯ�û�","�����û�","�����û�"));
	seltree.insertMenuByNodeValue("user",new Array("����","�޸�","��������Ȩ��","�����������","ɾ��","�����û�"),new Array("add();","update();","copy();","changeDepartment();","del();","forExportForUser();"),new Array("����","�޸�","��������Ȩ��","�����������","ɾ��","�����û�"));
	
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
  if (!confirm("ȷ�ϵ������û���?")) {
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
             alert("��Ȩ��Լ������¼�û����ܴ����û������û���");
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
             alert("��Ȩ��Լ������¼�û����ܲ�ѯ�û������û���");
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
//����������� 2006-05-08
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
         if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰ�û���")) return; 
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var arr = split(currentId);
        // getMainFrame().location.href="user.cmd?method=delete&userId="+arr[0];
        //setTimeout(refreshTree,200);  
        //�����ǲ����µ�ˢ�����ķ������е�  ������  2006-02-05
        getMainFrame().location.href="jsp/content.jsp";
	    var rtnValue = startRequest("user.cmd?method=delete&userId="+arr[0]); 
	    //�����쳣��ʾ �� zhb 20060324  
	    if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }       
}
//�����û�����Ȩ�� -֣�� 2006-03-09
function copy(){
		if(!confirm("��������Ȩ�޻���ɾ���û���ǰ������Ȩ�ޣ���ȷ��Ҫ���������û�������Ȩ����")) return; 
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
//Ҳ���Բ�������ķ�ʽ����ˢ��,�����ķ�������Ҫ����Id,���и��������ص�
//seltree.openRootNode();
</SCRIPT>
</html>
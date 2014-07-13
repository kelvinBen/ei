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

	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="href" hasRoot="false" rootText="授权模板" style="width:180;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="templateName" nodeId="templateId" nodeValue="templateName" collection="template_tree" nodeXmlSrc="isLeaf"  caption="">
	    </tree:selNode>
	</tree:selTree> 
	
<iframe style="display:none"  id="hidframe"></iframe>

</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{ 
      
  if(node.parentElement.type=="leaf")
	{ 
    getMainFrame().location.href="trolesquerypage.cmd?templateId="+node.NodeId; }
  else 
    seltree.xmlsrc="templates.cmd?method=getNode"; 
      
}
seltree.clickText=function(node)
{
  if(node.parentElement.type=="leaf")
	{
    getMainFrame().location.href="trolesquerypage.cmd?templateId="+node.NodeId; }
  else 
    seltree.xmlsrc="templates.cmd?method=getNode"; 
}


seltree.loadRightMouseMenu()
{
        seltree.insertNodeMenu(new Array("增加模板","导入模板"),new Array("addM();","importTemplate();"),new Array("增加模板","导入模板"));
		seltree.insertLeafMenu(new Array("增加模板","修改","删除","应用模板","按组织类型应用模板","增加角色","导出模板"),new Array("add();","update();","del();","applyTemplate();","applyTemplateByOrganType();","addRole();","exportTemplate()"),new Array("增加模板","修改","删除","应用模板","按组织类型应用模板","增加角色","导出模板"));
		
}
function exportTemplate(){
    if(!getExport()) return;
	var templateId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;  
	getMainFrame().location.href = "templates.cmd?method=forExportTemplate&templateId="+templateId;   
}
function getExport(){
  if (!confirm("确认导出该角色模板吗?")) {
    return false;
  }  
  return true;
}
function importTemplate(){ 
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="templates.cmd?method=forImportTemplate&refreshId="+currentId;
}
function addM(){
    var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var url ="templates.cmd?method=forinsert_info&refreshId="+currentId;       
    getMainFrame().location.href=url;
}
 
function add()
{             
    
    var url ="templates.cmd?method=forinsert_info";      
  
   getMainFrame().location.href=url;
    

}
function update()
{   
    var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[1].NodeValue; 
    var url ="templates.cmd?method=forupdate_info&templateId="+currentId+"&templateName="+currentName;      
	getMainFrame().location.href=url;     
}
function del()
{       var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        if (confirm("您确认要删除吗？")) {
          //getTreeFrame().hidframe.location.href="templates.cmd?method=delete&templateId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
          getMainFrame().location.href="jsp/content.jsp";
          //getTreeFrame().seltree.refreshNodeById(parentId); 
		 //setTimeout(refreshTree,200);
		 //下面是使用同步方式进行删除节点的刷新方式，徐正礼---2006-02-05
	     var rtnValue = startRequest("templates.cmd?method=delete&templateId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId);			 
	     //增加异常提示 － zhb 20060324   
	     if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }  
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

//刷新方法
function refreshTree()
{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
}

function define()
{      
         getMainFrame().location.href="trolesquerypage.cmd?templateId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
 
}

function applyTemplate(){
         var templateId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         getMainFrame().location.href="templates.cmd?method=applyTemplate&templateId="+templateId;      
}

function applyTemplateByOrganType(){
         var templateId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         getMainFrame().location.href="templates.cmd?method=applyTemplateByOrganType&templateId="+templateId;      
}   

function addRole(){
		 var tempId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         getMainFrame().location.href="troles.cmd?method=forinsert&tempId="+tempId;      
}			

function getUrl()
{
getTreeFrame().location.href="templates.cmd?method=getroot";

}
seltree.refreshNodeByIdOnce("root");
</SCRIPT>
</html>
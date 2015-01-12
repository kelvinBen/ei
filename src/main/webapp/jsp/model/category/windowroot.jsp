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
<BODY topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" class=��treePageCss�� text="#000000" > 
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="href" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="desc" nodeId="categoryId" nodeValue="type" collection="treedata" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" caption="">
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
	var bb = node.NodeValue;
	if(bb=="0"){
		//��ģ���ϰ������	
    	seltree.xmlsrc="soacategory.cmd?method=getModel&parentid="+node.NodeId+"&rtnpath=windownode&modelType=2"; 
    } else if(bb=="2"){
    	//��window�ϰ������
    	seltree.xmlsrc="soatab.cmd?method=getTabNode&parentid="+node.NodeId+"&rtnpath=node"; 
    } else if(bb=="4"){
    	//��tab�ϰ������
    	seltree.xmlsrc="soafield.cmd?method=getFieldNode&parentid="+node.NodeId+"&rtnpath=fieldnode";
    } else {
    	seltree.xmlsrc="";
    };
    getMainFrame().location.href = "jsp/content.jsp";
    if(bb=="2"){
    	//�����ά��
    	getMainFrame().location.href ="soawindow.cmd?method=detail&primaryKey="+node.NodeId;  
    } else if (bb=="4"){
    	//�����ά��
    	getMainFrame().location.href ="soatab.cmd?method=detail&primaryKey="+node.NodeId;  
    } else if (bb=="6") {
    	getMainFrame().location.href ="soafield.cmd?method=detail&primaryKey="+node.NodeId;  
    }   
     
}
seltree.loadRightMouseMenu()
{
	var name = new Array("���Ӵ���");
	var method = new Array("forInsert();");
	seltree.insertNodeMenu(name,method,name);
	seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
seltree.loadRightMouseMenuByNode=function()
{
	seltree.insertMenuByNodeValue("0",new Array("���Ӵ���"),new Array("forInsert();"),new Array("���Ӵ���"));
	seltree.insertMenuByNodeValue("2",new Array("���ɴ���","����tab","ɾ������","�޸Ĵ���","��ϸ����"),new Array("generator()","forInsertTab()","forDelete();","forUpdate();","forDetail();"),new Array("���ɴ���","����tab","ɾ������","�޸Ĵ���","��ϸ����"));
	seltree.insertMenuByNodeValue("4",new Array("������","ɾ��tab","�޸�tab","��ϸtab"),new Array("forInsertField()","forDeleteTab();","forUpdateTab();","forDetailTab();"),new Array("������","ɾ��tab","�޸�tab","��ϸtab"));
	seltree.insertMenuByNodeValue("6",new Array("ɾ����","�޸���","��ϸ��"),new Array("forDeleteField();","forUpdateField();","forDetailField();"),new Array("ɾ����","�޸���","��ϸ��"));
}
function generator(){ 	
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var rtn = startRequest("soawindow.cmd?method=generatorModel&primaryKey="+currentId);
  alert(rtn);   
}
function forInsertField(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soafield.cmd?method=forinsert&parentId="+currentId;    
}
function forDeleteField(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="soafield.cmd?method=delete&primaryKey="+currentId 
  getMainFrame().location.href="jsp/content.jsp";
  var rtnValue =startRequest(url);	//����HTTPͬ���ķ�ʽˢ�����νڵ� 
  if(rtnValue.trim() == "OK"){
  	return;
  }else{
	alert(rtnValue);
  }   	 
}
function forUpdateField(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soafield.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetailField(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soafield.cmd?method=detail&primaryKey="+currentId;    
}
function forDeleteTab(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="soatab.cmd?method=delete&primaryKey="+currentId;
  alert(url);
  getMainFrame().location.href="jsp/content.jsp";
  var rtnValue =startRequest(url);	//����HTTPͬ���ķ�ʽˢ�����νڵ�  
  alert(rtnValue);
}
function forUpdateTab(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soatab.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetailTab(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soatab.cmd?method=detail&primaryKey="+currentId;    	
}
function forInsertTab(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soatab.cmd?method=forinsert&parentId="+currentId;    	
}
function getDelete(){
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
  }  
  return true;
}
function forInsert(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soawindow.cmd?method=forinsert&parentId="+currentId;    	
}
function forUpdate(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soawindow.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetail(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soawindow.cmd?method=detail&primaryKey="+currentId;    	
}
function forDelete(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="soawindow.cmd?method=delete&primaryKey="+currentId 
  getMainFrame().location.href="jsp/content.jsp";
  var rtnValue =startRequest(url);	//����HTTPͬ���ķ�ʽˢ�����νڵ� 
  if(rtnValue.trim() == "OK"){
  	return;
  }else{
	alert(rtnValue);
  }   	
}
//����Ķ���ʵ���µ�ɾ���ڵ�ˢ�·�ʽ�Ľű���������web����ṩ��
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
seltree.refreshNodeByIdOnce("md0001");
</SCRIPT>


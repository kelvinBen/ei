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
    	seltree.xmlsrc="soacategory.cmd?method=getModel&parentid="+node.NodeId+"&rtnpath=permanencenode&modelType=1"; 
    } else if(bb=="1"){
    	//��table�ϰ������
    	seltree.xmlsrc="soacolumn.cmd?method=getColumnNode&parentid="+node.NodeId; 
    } else {
    	seltree.xmlsrc="";
    }
    getMainFrame().location.href = "jsp/content.jsp";
    if(bb=="1"){
    //�����ά��
    	getMainFrame().location.href ="permanence.cmd?method=detail&primaryKey="+node.NodeId;  
    }else if (bb=="3"){
    //�����ά��
    	getMainFrame().location.href ="soacolumn.cmd?method=detail&primaryKey="+node.NodeId;  
    }     
}
seltree.loadRightMouseMenu()
{
	var name = new Array("���Ӷ���");
	var method = new Array("forInsert();");
	var name1 = new Array("ɾ����","�޸���","��ϸ��");
	var method1 = new Array("forDeleteAttribute();","forUpdateAttribute();","forDetailAttribute();");
	seltree.insertNodeMenu(name,method,name);
	seltree.insertLeafMenu(name1,method1,name1);
	seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
}
seltree.loadRightMouseMenuByNode=function()
{
	seltree.insertMenuByNodeValue("0",new Array("���Ӷ���"),new Array("forInsert();"),new Array("���Ӷ���"));
	seltree.insertMenuByNodeValue("1",new Array("���ɴ���","������","ɾ������","�޸Ķ���","��ϸ����"),new Array("generator()","forInsertColumn()","forDelete();","forUpdate();","forDetail();"),new Array("���ɴ���","������","ɾ������","�޸Ķ���","��ϸ����"));
}
function forDelete(){
  if(!getDelete()) return;
  getMainFrame().location.href ="permanence.cmd?method=delete";    	
}
function generator(){ 	
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var rtn = startRequest("permanence.cmd?method=generatorModel&primaryKey="+currentId);
  alert(rtn);   
}
function forDeleteAttribute(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="soacolumn.cmd?method=delete&primaryKey="+currentId 
  getMainFrame().location.href="jsp/content.jsp";
  var rtnValue =startRequest(url);	//����HTTPͬ���ķ�ʽˢ�����νڵ� 
  if(rtnValue.trim() == "OK"){
  	return;
  }else{
	alert(rtnValue);
  }  
}
function forUpdateAttribute(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacolumn.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetailAttribute(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacolumn.cmd?method=detail&primaryKey="+currentId;    	
}
function getDelete(){
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
  }  
  return true;
}
function forInsert(){
var parentnode = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode);
//alert(parentnode.lastChild.previousSibling.caption);
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  parentnode.lastChild.previousSibling.caption
  getMainFrame().location.href ="permanence.cmd?method=forinsert&parentId="+currentId;    	
}
function forInsertColumn(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="soacolumn.cmd?method=forinsert&parentId="+currentId;    	
}
function forUpdate(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="permanence.cmd?method=forupdate&primaryKey="+currentId;    
}
function forDetail(){
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  getMainFrame().location.href ="permanence.cmd?method=detail&primaryKey="+currentId;    	
}
function forDelete(){
  if(!getDelete()) return;
  var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
  var url ="permanence.cmd?method=delete&primaryKey="+currentId 
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


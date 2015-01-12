<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>



<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >

<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form name="form1" action="">
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="objectName" nodeId="objectId" nodeValue="isLeaf" collection="functree" nodeXmlSrc="isTreeLeaf" caption="" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
    </html:form>
 <iframe style="display:none"  id="hidframe"></iframe>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{     

  var arr = split(node.NodeId);
  if(arr == "error"){
  	return;
  }
  seltree.xmlsrc="function.cmd?method=getNode&objectId="+node.NodeId; 
  /*
  //if(node.parentElement.type=="leaf")
  var nodeId =  node.NodeId;
  var strLength = nodeId.length;
  var nodeType = nodeId.substr(strLength-1,1);
 // var parentId = seltree.GetParentElement(seltree.GetNodeById(arr[0])).NodeId;
 // alert("nodeId=" + nodeId + ",nodeType=" + nodeType);
  if(nodeType=="F")
  getMainFrame().location.href="function.cmd?method=detail&objectId="+arr[0];
  if(nodeType=="M")
  getMainFrame().location.href="module.cmd?method=detail&objectId="+arr[0];   
  if(nodeType=="R")
  getMainFrame().location.href="resources.cmd?method=detail&objectId="+arr[0];    
  */
}
seltree.clickText=function(node)
{
  getMainFrame().location.href="jsp/content.jsp";
  var arr = split(node.NodeId);
  seltree.xmlsrc="function.cmd?method=getNode&objectId="+node.NodeId; 
  //if(node.parentElement.type=="leaf")
  var nodeId = node.NodeId;
  var strLength = nodeId.length;
  var nodeType = nodeId.substr(strLength-1,1);
  //alert("nodeId=" + nodeId + ",nodeType=" + nodeType);
  if(nodeType=="F")
  getMainFrame().location.href="function.cmd?method=detail&objectId="+arr[0];
  if(nodeType=="M")
  getMainFrame().location.href="module.cmd?method=detail&objectId="+arr[0];  
  if(nodeType=="R")
  getMainFrame().location.href="resources.cmd?method=detail&objectId="+arr[0];    
}


function split(node){
  var nodeId=node;
  if(nodeId==null || nodeId == ""){
  	return "error";//����NodeId��ʶ
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


seltree.loadRightMouseMenuByNode=function()
{
	seltree.insertMenuByNodeValue("0",new Array("�޸�ģ��","����ģ��","����ģ��","����ģ��","ת��ģ��","ɾ��ģ��","���ݵ���" ),new Array("updateM();","addM();","moveupM();","movedownM();","transferM();","delM();","forExport();"),new Array("�޸�ģ��","����ģ��","����ģ��","����ģ��","ת��ģ��","ɾ��ģ��","���ݵ���" ));
	seltree.insertMenuByNodeValue("1",new Array("�޸�ģ��","���ӹ���","����ģ��","����ģ��","ת��ģ��","ɾ��ģ��","���ݵ���" ),new Array("updateM();","addMF();","moveupM();","movedownM();","transferM();","delM();","forExport();"),new Array("�޸�ģ��","���ӹ���","����ģ��","����ģ��","ת��ģ��","ɾ��ģ��","���ݵ���" ));
    seltree.insertMenuByNodeValue("function",new Array("�޸Ĺ���","������Դ","���ƹ���","���ƹ���","ת�ƹ���","ɾ������","���ݵ���"),new Array("updateF();","addR();","moveupF();","movedownF();","transferF();","delF();","forExport();"),new Array("�޸Ĺ���","������Դ","���ƹ���","���ƹ���","ת�ƹ���","ɾ������","���ݵ���" ));
    seltree.insertMenuByNodeValue("resource",new Array("�޸���Դ","������Դ","������Դ","ת����Դ","ɾ����Դ","���ݵ���" ),new Array("updateR();","moveupR();","movedownR();","transferR();","delR();","forExport();"),new Array("�޸���Դ","������Դ","������Դ","ת����Դ","ɾ����Դ","���ݵ���" ));
    seltree.insertMenuByNodeValue("root",new Array("����ģ��","���ݵ���" ,"���ݵ���"),new Array("addM();","forExport();","forImport();"),new Array("����ģ��","���ݵ���" ,"���ݵ���"));
    seltree.initContextMenu("<div style='display:none;position:absolute;'></div>",3);
}

function forExport()
{
	//��ǰ�ڵ��id 
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="resources.cmd?method=forExport&objectId="+currentId;
    
}

function forImport()
{
    //��ǰ�ڵ��id 
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href="expAndImp.cmd?method=forImport&refreshId="+currentId;
}

function sendxmlhttp(url){
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
	        conn.send();
	        return conn.responseText;
	}

function addM()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var isLeaf = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
           if(isLeaf=="1"){
              alert("ĩ��ģ�鲻�������¼�ģ�飡");
              return ;
           }
           var arr =split(currentId);
           if(arr[1]=="-1") 
               getMainFrame().location.href="module.cmd?method=forinsert&parentModuleId="+""+"&parentModuleName="+""+"&refreshId="+currentId;
	   else{
	       getMainFrame().location.href="module.cmd?method=forinsert&parentModuleId="+arr[0]+"&parentModuleName="+currentName+"&refreshId="+currentId;
           }
}  
function addMF()
{          
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var isLeaf = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
           if(isLeaf=="0"){
              alert("��ĩ��ģ�鲻�����ӹ��ܣ�");
              return ;
           }
           var arr =split(currentId);
           getMainFrame().location.href="function.cmd?method=forinsertFunction&moduleId="+arr[0]+"&refreshId="+currentId;
           
}  
function updateM()
{     
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
         var arr = split(currentId);
         if(arr[1]=="-1"){ 
             alert("���ڵ㲻���޸ģ����ڵ�ֻ�������¼�ģ�������");
             return ;
         }   
         else{
             var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
             var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
             var arr2 = split(parentId);
             if(arr2[1]=="-1")
                 getMainFrame().location.href="module.cmd?method=forupdate&objectId="+arr[0]+"&parentModuleName="+currentName+"&refreshId="+parentId;
	     else
	         getMainFrame().location.href="module.cmd?method=forupdate&objectId="+arr[0]+"&parentModuleName="+parentName+"&refreshId="+parentId;
         }
}
function moveupM(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("module.cmd?method=moveUp&moduleId="+arr1[0]);
		refreshTree1();
}

function movedownM(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("module.cmd?method=moveDown&moduleId="+arr1[0]);
		refreshTree1();
}

function transferM()
{     
     var uri ="module.cmd?method=getTransferRoot&moduleId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	 
	 if (win == null) {  
	  	return;
	 }else{
	  	getMainFrame().location.href=win[0];
	 }
	
}

function delM()
{        
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var arr = split(currentId);
         if(arr[1]=="-1"){ 
             alert("���ڵ㲻��ɾ�������ڵ�ֻ�������¼�ģ�������");
             return ;
         }  
         if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰģ����")) return;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         var arr =split(currentId);
         //getMainFrame().location.href="module.cmd?method=delete&objectId="+arr[0];
         //getTreeFrame().seltree.refreshNodeById(parentId);
         // setTimeout(refreshTree1,150);
         //�Ľ����ˢ�����ķ�ʽ
         getMainFrame().location.href="jsp/content.jsp";
	     var rtnValue = startRequest("module.cmd?method=delete&objectId="+arr[0]);  
	     //�����쳣��ʾ �� zhb 20060324
	     if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }  
}

function refreshTree1()
{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
}

function addF()
{      
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           var arr =split(parentId);
           getMainFrame().location.href="function.cmd?method=forinsertFunction&moduleId="+arr[0]+"&refreshId="+parentId;
	
}

function addR()
{          var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           var arr0 =split(parentId);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var arr =split(currentId);    
           getMainFrame().location.href="resources.cmd?method=forinsert&functionId="+arr[0]+"&refreshId="+currentId;
}  
function updateF()
{     
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         var arr1 =split(currentId);
         var arr2 =split(parentId);
         getMainFrame().location.href="function.cmd?method=forupdate&objectId="+arr1[0]+"&moduleId="+arr2[0]+"&refreshId="+parentId;
	
}
function moveupF(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("function.cmd?method=moveUp&functionId="+arr1[0]);
		refreshTree1();
}

function movedownF(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("function.cmd?method=moveDown&functionId="+arr1[0]);
		refreshTree1();
}
function transferF()
{     
     var uri ="function.cmd?method=getTransferRoot&functionId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	 
	 if (win == null) {  
	  	return;
	 }else{
	  	getMainFrame().location.href=win[0];
	 }
	
}
function define(){  
        var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
        var arr=split(currentId);
	getMainFrame().location.href="resourcequery.cmd?method=query&functionId="+arr[0];
}
function delF()
{        if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰ������")) return; 
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
         var arr = split(currentId);
         // getTreeFrame().hidframe.location.href="function.cmd?method=delete&objectId="+arr[0];
         //getMainFrame().location.href = "jsp/content.jsp";
         //getTreeFrame().seltree.refreshNodeById(parentId); 
         // getMainFrame().location.href="function.cmd?method=delete&objectId="+arr[0];
         //getTreeFrame().seltree.refreshNodeById(parentId); 
         //setTimeout(refreshTree,150);    
         //�����µķ�ʽ��������ˢ��
         getMainFrame().location.href="jsp/content.jsp";
	     var rtnValue = startRequest("function.cmd?method=delete&objectId="+arr[0]);   
	     //�����쳣��ʾ �� zhb 20060324   
	     if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }  
	 
}

function updateR()
{        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
         var arr1 =split(currentId);
         var arr2 =split(parentId);
         getMainFrame().location.href="resources.cmd?method=forupdate&objectId="+arr1[0]+"&refreshId="+parentId;
}
function moveupR(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("resources.cmd?method=moveUp&resourceId="+arr1[0]);
		refreshTree1();
}

function movedownR(){
		var	currentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var arr1 =split(currentId);
		sendxmlhttp("resources.cmd?method=moveDown&resourceId="+arr1[0]);
		refreshTree1();
}
function transferR()
{     
     var uri ="resources.cmd?method=getTransferRoot&resourceId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	 
	 if (win == null) {  
	  	return;
	 }else{
	  	getMainFrame().location.href=win[0];
	 }
	
}
function delR()
{        if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰ������")) return; 
         var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var arr = split(currentId);
         sendxmlhttp("jsp/content.jsp");
	     var rtnValue = sendxmlhttp("resources.cmd?method=delete&objectId="+arr[0]);   
	 refreshTree1();
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


function refreshTree()
{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
}
seltree.refreshNodeByIdOnce("root");
</SCRIPT>

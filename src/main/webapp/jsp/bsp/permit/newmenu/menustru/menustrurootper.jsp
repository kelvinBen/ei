<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%
     String struId=(String)request.getAttribute("struId");
     if(struId==null || struId==""){
	    struId="1";
     }
     String rootMenuStruId=(String)request.getAttribute("rootMenuStruId");
     if(rootMenuStruId==null || rootMenuStruId==""){
	    rootMenuStruId="0";
     }
     String typeId=(String)request.getAttribute("typeId");
     typeId="P"+typeId;
%>
<html>
<head>
<title>���Ի��˵�</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>

</head>
<body topmargin="10px" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<form> 
<widgets:container title="���Ի��˵�" >

<widgets:containbutton onclick="clone()" text="��¡"/>
<widgets:containbutton onclick="doOK()" text="ˢ�»���"/>
<widgets:containbutton onclick="delMenu()" text="ɾ�����Ի��˵�"/>

<table width="100%" height="400">
    <tr>
      <td width="50%">
			<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
			  	<tree:selNode title="menuAlias" nodeId="menuStruId" nodeValue="menuStruId" collection="functree" nodeXmlSrc="isLeaf">
				</tree:selNode>
			</tree:selTree>
      </td>
      <td>
	  <div id="MENU_DETAIL" style="width:100%;height:100%">
      </div>
      </td>
   </tr>
</table>
</widgets:container>
</form>
</body>
</html>
<script lanuage="javascript">
seltree.clickImg=function(node){ 
    seltree.xmlsrc="permenudefine.cmd?method=getMenuStruNode&menuStruId="+node.NodeId+"&struId=<%=struId%>";  
}

//����ı�
seltree.clickText=function(node){ 
    seltree.xmlsrc="permenudefine.cmd?method=getMenuStruNode&menuStruId="+node.NodeId+"&struId=<%=struId%>";   
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=detail&menuStruId="+node.NodeId);
}

//�����Ҽ��˵�
seltree.loadRightMouseMenu=function(){
	seltree.insertNodeMenu(new Array("�����¼��ڵ�","ѡ���¼��ڵ�","ɾ��","����","����","�Ƶ�","����","����"),new Array("doNew();","doSelect()","doDelete();","doUp();","doDown();","doMoveTo();","exportMenu();","importMenu();"),new Array("","","","","","",""));
	seltree.insertLeafMenu(new Array("�����¼��ڵ�","ѡ���¼��ڵ�","ɾ��","����","����","�Ƶ�","����","����"),new Array("doNew();","doSelect()","doDelete();","doUp();","doDown();","doMoveTo();","exportMenu();","importMenu();"),new Array("","","","","","",""));//Ҷ�ڵ���кͷ�Ҷ�ڵ�һ���Ĳ˵�
}	
seltree.loadRightMouseMenu();
//����
function exportMenu(){
    if(!getExport()) return;
	var menuStruId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href = "strumenudefine.cmd?method=forExportMenu&menuStruId="+menuStruId+"&struId=<%=struId%>";  
}
function getExport(){
  if (!confirm("ȷ�ϵ�����ѡ�ڵ��µĲ˵���?")) {
   	     return false;
  }  
  return true;
}
//����
function importMenu(){
	getMainFrame().location.href = "permenudefine.cmd?method=forImportMenuPer"; 
}
//����
function doUp(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//���ڵ�
		alert("���ڵ㲻������!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=moveUp&menuStruId="+id);
	seltree.refreshNodeById(pid);
}

//����
function doDown(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//���ڵ�
		alert("���ڵ㲻������!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=moveDown&menuStruId="+id);
	seltree.refreshNodeById(pid);
}	
//ɾ��
function doDelete(){
	if (!confirm("���Ҫɾ��ѡ�еĲ˵��𣿴˲������ָܻ���")) {
	     return false;
	}
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//���ڵ�
		alert("���ڵ㲻��ɾ��!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=delete&menuStruId="+id);
	//ˢ���ϼ��ڵ�
	seltree.refreshNodeById(pid);
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+pid); 
}
	
//���浽���ݿ�
function doOK(){
	var r=sendxmlhttp("refresh.cmd?typeId=<%=typeId%>");
	if(r.length>50){
		r="ˢ�²˵�����";
	}
	alert(r);
}
function sendxmlhttp(url){
	var conn = new ActiveXObject("Microsoft.XMLHTTP"); 
	conn.open("POST", url, false);
	conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
    conn.send();
    return conn.responseText;
}
	
//����
function doNew(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+id);
}
	
function doSave(){	
	document.forms[0].menuAlias.value = trim(document.forms[0].menuAlias.value);
	if(document.forms[0].menuAlias.value==""){
		alert("������˵�����!");
		document.forms[0].menuAlias.focus();
		return;
	}	
	if ( __isQuoteIn(document.forms[0].menuAlias.value) )
	  {
	    alert("�˵����Ʋ��ܺ��������ַ���");
	    document.forms[0].menuAlias.select();
	    document.forms[0].menuAlias.focus();
	    return;
	  }		
	
	document.forms[0].text.value = trim(document.forms[0].text.value);
	if(document.forms[0].text.value==""){
		document.forms[0].text.value = document.forms[0].menuAlias.value;
	}	
	if ( __isQuoteIn(document.forms[0].text.value) )
	  {
	    alert("�˵������Ʋ��ܺ��������ַ���");
	    document.forms[0].text.select();
	    document.forms[0].text.focus();
	    return;
	  }		
	
	document.forms[0].isSys.value = trim(document.forms[0].isSys.value);
	if(document.forms[0].isSys.value==""){
		document.forms[0].isSys.value = "P";
	}
	var url="newmenusave.cmd";
	var names=new Array("menuStruId","seq","parentId","parentMenuAlias","menuId","struTypeId","isSys","menuAlias","text","title","type","value","target","options","functionId");
	var values=new Array(document.forms[0].menuStruId.value,document.forms[0].seq.value,document.forms[0].parentId.value,document.forms[0].parentMenuAlias.value,document.forms[0].menuId.value,document.forms[0].struTypeId.value,document.forms[0].isSys.value,document.forms[0].menuAlias.value,document.forms[0].text.value,document.forms[0].title.value,document.forms[0].type.value,document.forms[0].value.value,document.forms[0].target.value,document.forms[0].options.value,document.forms[0].functionId.value);
	var r=sendxmlhttp2(url,names,values);
	if(r.length>50){
		r="����˵�����";
	}
	alert(r);
	seltree.refreshNodeById(document.forms[0].parentId.value);
	if(document.forms[0].menuStruId.value=="-1"){//����	
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+id);
	}else{//�༭
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=detail&menuStruId="+document.forms[0].menuStruId.value);
	}
}
function sendxmlhttp2(url,names,values){
	if(names.length!=values.length){
		return "�������ƺͲ���ֵ��������һ��!";
	}
	var params="";
	var declare="<?xml version='1.0\' encoding='UTF-8'?>";
	var start="<xmlhttp>"
	var end="</xmlhttp>";
	for(var i=0;i<names.length;i++){
		params+="<param name='"+names[i]+"' value='"+values[i]+"'/>";
	}
	var data=declare+start+params+end;
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("POST", url, false);
	conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
    conn.send(data);
    return conn.responseText;
}
//ɾ�����Ի��˵�
function delMenu(){
	location.href="jsp/content.jsp";
	var url = "permenudefine.cmd?method=delMenuStru&struId=<%=struId%>";
    var rtnValue = startRequest(url);	
    if(rtnValue.trim()=="OK"){
       return;
    }else{
    	alert(rtnValue);
    }

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
    //xmlHttp.onreadystatechange = handleStateChange;
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
//��¡
function clone(){
	if (!confirm("���Ҫ��¡��ѡ�еĲ˵���?��¡�˵������������ԭ�в˵�!")) {
	     return false;
	}
	var cmdUrl="newMenu.cmd&method=forCloneMenu&struId=<%=struId%>";
	var url ="jsp/help.jsp?url="+cmdUrl;     
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
	if (win == null) {  
		return;
	}else{  	
		var typeId=win[2]+win[0];
		sendxmlhttp("newMenu.cmd?method=cloneMenu&typeId="+typeId+"&struId=<%=struId%>");
		seltree.refreshNodeById("<%=rootMenuStruId%>");									
	}
}
//ѡ��
function doSelect(){
  var url ="jsp/help.jsp?url=menusys.cmd&method=forInsertMenuType"; 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:450px;dialogHeight:300px");
  if (win == null) {  
  	return;
  }else{  	
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	sendxmlhttp("permenudefine.cmd?method=select&menuId="+win+"&struId=<%=struId%>&parentId="+id);
	seltree.refreshNodeById(id);									
  }
}	
//�Ƶ�
function doMoveTo(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//���ڵ�
		return false;
	}
	var url = "jsp/help.jsp?url=permenudefine.cmd&method=getMenuStruRootHelp&struId=<%=struId%>&except="+id;
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null){
		return;
	}
	sendxmlhttp("permenudefine.cmd?method=moveTo&menuStruId="+id+"&parentId="+win[0]);
	seltree.refreshNodeById("<%=rootMenuStruId%>");	
}

function selectFunctionId(){
  var url ="jsp/help.jsp?url=function.cmd&method=getFunctionRootHelp";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	  return;
  }else{		
  		document.forms[0].functionId.value =win[0]; 
  }
}

function selectAppId(){

  var url ="jsp/help.jsp?url=pubapp.cmd&method=query";     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	  return;
  }else{
  		document.forms[0].appId.value =win[0]; 
  		document.forms[0].appName.value =win[1];
  }
}

</script>

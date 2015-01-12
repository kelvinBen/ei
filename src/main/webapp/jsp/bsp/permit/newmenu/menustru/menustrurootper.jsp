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
<title>个性化菜单</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>

</head>
<body topmargin="10px" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<form> 
<widgets:container title="个性化菜单" >

<widgets:containbutton onclick="clone()" text="克隆"/>
<widgets:containbutton onclick="doOK()" text="刷新缓存"/>
<widgets:containbutton onclick="delMenu()" text="删除个性化菜单"/>

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

//点击文本
seltree.clickText=function(node){ 
    seltree.xmlsrc="permenudefine.cmd?method=getMenuStruNode&menuStruId="+node.NodeId+"&struId=<%=struId%>";   
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=detail&menuStruId="+node.NodeId);
}

//加载右键菜单
seltree.loadRightMouseMenu=function(){
	seltree.insertNodeMenu(new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"),new Array("doNew();","doSelect()","doDelete();","doUp();","doDown();","doMoveTo();","exportMenu();","importMenu();"),new Array("","","","","","",""));
	seltree.insertLeafMenu(new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"),new Array("doNew();","doSelect()","doDelete();","doUp();","doDown();","doMoveTo();","exportMenu();","importMenu();"),new Array("","","","","","",""));//叶节点具有和非叶节点一样的菜单
}	
seltree.loadRightMouseMenu();
//导出
function exportMenu(){
    if(!getExport()) return;
	var menuStruId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href = "strumenudefine.cmd?method=forExportMenu&menuStruId="+menuStruId+"&struId=<%=struId%>";  
}
function getExport(){
  if (!confirm("确认导出所选节点下的菜单吗?")) {
   	     return false;
  }  
  return true;
}
//导入
function importMenu(){
	getMainFrame().location.href = "permenudefine.cmd?method=forImportMenuPer"; 
}
//上移
function doUp(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//根节点
		alert("根节点不能上移!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=moveUp&menuStruId="+id);
	seltree.refreshNodeById(pid);
}

//下移
function doDown(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//根节点
		alert("根节点不能下移!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=moveDown&menuStruId="+id);
	seltree.refreshNodeById(pid);
}	
//删除
function doDelete(){
	if (!confirm("真的要删除选中的菜单吗？此操作不能恢复！")) {
	     return false;
	}
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//根节点
		alert("根节点不能删除!");
		return false;
	}
	var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
	sendxmlhttp("permenudefine.cmd?method=delete&menuStruId="+id);
	//刷新上级节点
	seltree.refreshNodeById(pid);
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+pid); 
}
	
//保存到数据库
function doOK(){
	var r=sendxmlhttp("refresh.cmd?typeId=<%=typeId%>");
	if(r.length>50){
		r="刷新菜单出错！";
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
	
//新增
function doNew(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+id);
}
	
function doSave(){	
	document.forms[0].menuAlias.value = trim(document.forms[0].menuAlias.value);
	if(document.forms[0].menuAlias.value==""){
		alert("请输入菜单名称!");
		document.forms[0].menuAlias.focus();
		return;
	}	
	if ( __isQuoteIn(document.forms[0].menuAlias.value) )
	  {
	    alert("菜单名称不能含有特殊字符！");
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
	    alert("菜单项名称不能含有特殊字符！");
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
		r="保存菜单出错！";
	}
	alert(r);
	seltree.refreshNodeById(document.forms[0].parentId.value);
	if(document.forms[0].menuStruId.value=="-1"){//新增	
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=newmenu&menuStruId="+id);
	}else{//编辑
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("permenudefine.cmd?method=detail&menuStruId="+document.forms[0].menuStruId.value);
	}
}
function sendxmlhttp2(url,names,values){
	if(names.length!=values.length){
		return "参数名称和参数值的数量不一致!";
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
//删除个性化菜单
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
//克隆
function clone(){
	if (!confirm("真的要克隆您选中的菜单吗?克隆菜单操作将清除您原有菜单!")) {
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
//选择
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
//移到
function doMoveTo(){
	var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var rootId="<%=rootMenuStruId%>";
	if(rootId==id){//根节点
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

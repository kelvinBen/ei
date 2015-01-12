<%@ taglib uri="/WEB-INF/tlds/web-seltree.tld" prefix="tree"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<% 
String menuTypeId = (String)request.getAttribute("menuTypeId");
%>
<html>
<head>
<title></title>
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
 <form>
 <widgets:container title="系统菜单维护" >
 <widgets:containbutton onclick="doOK()" text="刷新缓存"/>
<table width="100%" height="400">
   <tr>
   <td width="50%">
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="href" hasRoot="false" rootText="主菜单" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="menuAlias" nodeId="menuSysId" nodeValue="menuSysId" collection="menuSys_tree" nodeXmlSrc="isLeaf"  caption="">
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
<iframe style="display:none"  id="hidframe"></iframe>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickText=function(node)
{    
seltree.xmlsrc="menusys.cmd?method=getMenuSysNode&menuSysId="+node.NodeId; 
document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("menusys.cmd?method=detail&menuSysId="+node.NodeId);  
}

seltree.clickImg=function(node)
{     
seltree.xmlsrc="menusys.cmd?method=getMenuSysNode&menuSysId="+node.NodeId; 
document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("menusys.cmd?method=detail&menuSysId="+node.NodeId); 
}

seltree.loadRightMouseMenu()
{
		seltree.insertNodeMenu(new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"),new Array("forAdd();","forSelect();","forDelete()","moveUp()","moveDown()","moveTo()","exportMenu()","importMenu();"),new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"));
		seltree.insertLeafMenu(new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"),new Array("forAdd();","forSelect();","forDelete()","moveUp()","moveDown()","moveTo()","exportMenu()","importMenu();"),new Array("增加下级节点","选择下级节点","删除","上移","下移","移到","导出","导入"));
}
function exportMenu(){
    if(!getExport()) return;
	var parentMenuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href = "menusys.cmd?method=forExportMenu&parentMenuSysId="+parentMenuSysId; 
}
function getExport(){
  if (!confirm("确认导出所选节点下的菜单吗?")) {
   	     return false;
  }  
  return true;
}
function forAdd(){
	var	parentMenuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("menusys.cmd?method=forinsert&parentMenuSysId="+parentMenuSysId);
}
//导入
function importMenu(){
	getMainFrame().location.href = "menusys.cmd?method=forImportMenu"; 
}
//保存菜单
function doSave(){
		var	parentMenuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		if(document.forms[0].menuAlias.value==""){
			alert("请输入<%=ResourcesFactory.getString("PUB_MENU_SYS.MENU_ALIAS")%>");
			document.forms[0].menuAlias.focus();
			return;
		}
	  
	  if ( __isQuoteIn(document.forms[0].menuAlias.value) )
	  {
	    alert("菜单名称不能含有特殊字符！");
	    document.forms[0].menuAlias.select();
	    document.forms[0].menuAlias.focus();
	    return false;
	  }	
	  
	  if ( __isQuoteIn(document.forms[0].text.value) )
	  {
	    alert("菜单项名称不能含有特殊字符！");
	    document.forms[0].text.select();
	    document.forms[0].text.focus();
	    return false;
	  }			
	  			
		if(document.forms[0].text.value==""){
			document.forms[0].text.value=document.forms[0].menuAlias.value;
		}
		
		var url="menusyssave.cmd?menuTypeId="+"<%=menuTypeId%>";
		var names=new Array("menuAlias","seq","title","text","type","value","target","options","parentId","menuSysId","menuId","functionId","appId");
		
		var re=/&/g;
	    var str=document.forms[0].value.value.replace(re,"&amp;");
		var values=new Array(document.forms[0].menuAlias.value,document.forms[0].seq.value,document.forms[0].title.value,document.forms[0].text.value,document.forms[0].type.value,str,document.forms[0].target.value,document.forms[0].options.value,document.forms[0].parentId.value,document.forms[0].menuSysId.value,document.forms[0].menuId.value,document.forms[0].functionId.value,document.forms[0].appId.value);
		//alert(url);
		var r=sendxmlhttp2(url,names,values);
		if(r.length>50){
			r="保存菜单出错！";
		}
		alert(r);
		
		if(document.forms[0].menuSysId.value=="-1"){//如果是新增，刷新上级节点
			seltree.refreshNodeById(document.forms[0].parentId.value);
		}
		
		if(document.forms[0].menuSysId.value=="-1"){//新增
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("menusys.cmd?method=forinsert&parentMenuSysId="+parentMenuSysId);
		}else{//编辑
	document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("menusys.cmd?method=detail&menuSysId="+document.forms[0].menuSysId.value);  
		}
	}



function forSelect(){
		var url ="jsp/help.jsp?url=menusys.cmd&method=forInsertMenuType";
  		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:420px;dialogHeight:180px"); 
		if(win==null){
			return;
		}
     	var	parentId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
     	var url="menusys.cmd?method=select&menuSysIds="+win+"&menuTypeId=<%=menuTypeId%>&parentId="+parentId;
		//alert(url);
		sendxmlhttp(url);
		seltree.refreshNodeById(parentId);
}

function forDelete(){
		if (!confirm("真的要删除选中的菜单吗？此操作不能恢复！")) {
		     return false;
		} 
		var	menuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var parent = seltree.GetParentElement(seltree.GetNodeById(menuSysId));
		if(parent==null){//根节点
			return;
		}
		var oPid=parent.children[0].NodeId;
		sendxmlhttp("menusys.cmd?method=delete&menuSysId="+menuSysId+"&menuTypeId="+"<%=menuTypeId%>");
		//刷新上级节点
		seltree.refreshNodeById(oPid);		
}

function moveUp(){
		var	menuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var parent = seltree.GetParentElement(seltree.GetNodeById(menuSysId));
		if(parent==null){//根节点
			return;
		}
		var oPid=parent.children[0].NodeId;
		sendxmlhttp("menusys.cmd?method=moveUp&menuSysId="+menuSysId);
		seltree.refreshNodeById(oPid);
}

function moveDown(){
		var	menuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var parent = seltree.GetParentElement(seltree.GetNodeById(menuSysId));
		if(parent==null){//根节点
			return;
		}
		var oPid=parent.children[0].NodeId;
		sendxmlhttp("menusys.cmd?method=moveDown&menuSysId="+menuSysId);
		seltree.refreshNodeById(oPid);
}

function moveTo(){
		var	menuSysId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var parent = seltree.GetParentElement(seltree.GetNodeById(menuSysId));
		if(parent==null){//根节点
			return;
		}
		var oPid=parent.children[0].NodeId;
		var url ="jsp/help.jsp?url=menusys.cmd&method=getRoot&exceptId="+menuSysId;
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
		if(win==null){
			return;
		}
		sendxmlhttp("menusys.cmd?method=moveTo&menuSysId="+menuSysId+"&newParentMenuSysId="+win[0]);
		seltree.refreshNodeById(win[0]);
		seltree.refreshNodeById(oPid);
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
	
function sendxmlhttp(url){
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
	        conn.send();
	        return conn.responseText;
	}
	
		//保存到数据库
function doOK(){
		var r=sendxmlhttp("refresh.cmd?typeId="+"S"+"<%=menuTypeId%>");
		if(r.length>50){
			r="菜单生效出错！";
		}else{
			r="菜单生效成功!";
		}
		alert(r);
		//top.location.reload();
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
//gaochuanji添加，用于应用的通用帮助。
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

</SCRIPT>
</html>
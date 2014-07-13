<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
    String struId = (String)request.getAttribute("struId");
    if(struId==null || struId==""){
    	struId="1";
    }
%>

<html>
<head>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<SCRIPT LANGUAGE="JavaScript">
var state=1;
function init()
{

        getMainFrame().location.href = "jsp/content.jsp";
}
init();
//
</SCRIPT>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" onload="init();" >
<table width="100%" height="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="true">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("显示机构信息","增加下级","选择下级","下级排序","修改","撤销","导出","导入"),new Array("forDetail();","forInsert();","forSelect();","forOrder();","forUpdate();","forDelete();","forExport();","forImport();"),new Array("显示机构信息","增加下级","选择下级","下级排序","修改","撤销","导出","导入"));
		seltree.insertNodeMenu(new Array("显示机构信息","增加下级","选择下级","下级排序","修改","撤销","导出","导入"),new Array("forDetail();","forInsert();","forSelect();","forOrder();","forUpdate();","forDelete();","forExport();","forImport();"),new Array("显示机构信息","增加下级","选择下级","下级排序","修改","撤销","导出","导入"));
		
}
//导出
function forExport(){
    if(!getExport()) return;
	var struId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
 
	getMainFrame().location.href = "stru.cmd?method=forExport&struId="+struId;
}
function getExport(){
  if (!confirm("确认导出所选节点下的菜单吗?")) {
   	return false;
  }  
  return true;
}
//导入
function forImport(){
	getMainFrame().location.href = "stru.cmd?method=forImport";
}

seltree.clickImg=function(node)
{
        seltree.xmlsrc="stru.cmd?method=getnode&nevervote=1&parentId="+node.NodeValue;        
}

seltree.clickText=function(node)
{
	getMainFrame().location.href = "jsp/content.jsp";
        seltree.xmlsrc="stru.cmd?method=getnode&nevervote=1&parentId="+node.NodeValue;  
        if(state==1)      {
        	getMainFrame().location.href="stru.cmd?method=detailProxy&primaryKey="+node.NodeValue;
        }
}

function forSetState(){
 	 state=1;
}
function forUnSetState(){
	 state=0;
}



function forDetail(){
	//var uri="stru.cmd?method=detail&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var uri="stru.cmd?method=detailProxy&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href =uri;  
}


function forInsert(){
	//var uri="stru.cmd?method=forinsert&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	//getMainFrame().location.href =uri;  	
	var uri ="stru.cmd?method=forInsertOrganType&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;   
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:300px;dialogHeight:200px"); 
	  if (win == null) {  
	  	return;
	  }else{
	  getMainFrame().location.href=win[0];
	 }
}


function forSelect(){
	 var uri ="stru.cmd?method=getAddMemberRoot&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;   
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	  if (win == null) {  
	  	return;
	  }else{
	  getMainFrame().location.href=win[0];
	 }
}




function forUpdate(){
	//var uri="stru.cmd?method=forupdate&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;    
	var uri="stru.cmd?method=forUpdateProxy&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;    
	getMainFrame().location.href=uri;
}



function forDelete(){
 	var uri ="stru.cmd?method=forDelete&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:300px"); 	 
	  if (win == null) {  
	  	return;
	  }else{
	  var hrEventType=win[0];
	  var hrEventMemo=win[1];	  
	   var uri="stru.cmd?method=delete&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&hrEventType="+hrEventType+"&hrEventMemo="+hrEventMemo;    
	  getMainFrame().location.href=uri;
	 }
}


function forOrder(){
	var uri ="stru.cmd?method=getChangeOrderRoot&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;          
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	  if (win == null) {  
	  	return;
	  }else{
	   getMainFrame().location.href=win[0];
	 }
}
     //树展开到第二级
      var struId = "<%=struId%>";
      seltree.refreshNodeByIdOnce(struId);


</SCRIPT>
</html>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ComponentFactory"%>
<%@ page import="net.mast.bsp.permit.pap.domain.IGlobal"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
	String roleId=(String)request.getAttribute("roleId");
	String isSuperadmin = (String)request.getAttribute("isSuperadmin");
	String update=(String)request.getAttribute("update");
	String userId=GetBspInfo.getBspInfo().getUserId();
	String superadminRole=(String)(((IGlobal)ComponentFactory.getBean("globalDomain")).getGlobal().getSuperadminRole());
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<html:form name="form1" action="">
<html:hidden name="roleId" value="<%=roleId%>"/>
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="objectName" nodeId="objectId" nodeValue="isLeaf" collection="functree" nodeXmlSrc="isLeaf" caption="" perImgSrc="perImgSrc">
	        </tree:selNode>
	</tree:selTree>
    </td></tr>
</table>
<iframe style="display:none" name="dataFrame0"></iframe>
</html:form>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{ 
	var roleId=document.all("roleId").value;
	seltree.xmlsrc="tRoleopts.cmd?method=getNode&objectId="+node.NodeId+"&roleId="+roleId;
}

seltree.clickText=function(node)
{
	var roleId=document.all("roleId").value;
	seltree.xmlsrc="tRoleopts.cmd?method=getNode&objectId="+node.NodeId+"&roleId="+roleId;
}

seltree.loadRightMouseMenu()
{	
	var update="<%=update%>";
	if(update=="true"){	
		seltree.insertNodeMenu(new Array("按模块增加","按功能增加","按资源增加","删除"),new Array("add0();","add1();","add2()","del();"),new Array("按模块增加","按功能增加","按资源增加","删除"));
		seltree.insertLeafMenu(new Array("删除"),new Array("del();"),new Array("删除"));
	}
}

function add0()
{          
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var currentValue = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
	var roleId = document.forms[0].all("roleId").value;
	var arr = split(currentId);
	if((arr[1]=="F")||(arr[1]=="R")||currentValue=="1"){ 
		alert("请选择非末级模块增加！");
		return ;
	}
	if("<%=isSuperadmin%>"=="1"){//如果登陆用户含有“SUPERADMIN”或"SYSADMIN"角色 -zhb 20060313
		var cmdUrl = "function.cmd&method=getContextRoot&parentId="+currentId+"&roleId="+roleId+"&isModule=1&isTRoles=1";
	}else{
		var cmdUrl = "function.cmd&method=getContextRoot1&parentId="+currentId+"&roleId="+roleId+"&isModule=1&isTRoles=1&userId="+"<%=userId%>";
	}	
	var url = "jsp/help.jsp?url="+cmdUrl; 
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 

}

function add1()
{          
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var roleId = document.forms[0].all("roleId").value;
	var arr = split(currentId);
	if((arr[1]=="F")||(arr[1]=="R")){ 
		alert("请选择模块增加！");
		return ;
	}
	if("<%=isSuperadmin%>"=="1"){//如果登陆用户含有“SUPERADMIN”或"SYSADMIN"角色 -zhb 20060313
		var cmdUrl = "function.cmd&method=getContextRoot&parentId="+currentId+"&roleId="+roleId+"&hasResource=0&isTRoles=1";
	}else{
		var cmdUrl = "function.cmd&method=getContextRoot1&parentId="+currentId+"&roleId="+roleId+"&hasResource=0&isTRoles=1&userId="+"<%=userId%>";
	}	
	var url = "jsp/help.jsp?url="+cmdUrl; 
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 

}
function add2()
{          
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var roleId = document.forms[0].all("roleId").value;
	var arr = split(currentId);
	if(arr[1]=="R"){ 
		alert("请选择模块或功能增加！");
		return ;
	}
	if("<%=isSuperadmin%>"=="1"){//如果登陆用户含有“SUPERADMIN”或"SYSADMIN"角色 -zhb 20060313
		var cmdUrl = "function.cmd&method=getContextRoot&parentId="+currentId+"&roleId="+roleId+"&hasResource=1&isTRoles=1";      
	}else{
		var cmdUrl = "function.cmd&method=getContextRoot1&parentId="+currentId+"&roleId="+roleId+"&hasResource=1&isTRoles=1&userId="+"<%=userId%>";
	}	
	
	var url = "jsp/help.jsp?url="+cmdUrl; 
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 

}

function del()
{        
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var roleId = document.forms[0].all("roleId").value;
         var arr = split(currentId);
         if(arr[1]=="-1"){ 
             alert("根节点不能删除，根节点只有增加操作！");
             return ;
         }  
         if (roleId=="<%=superadminRole%>"){
         	alert("超级管理员的所有操作都不能撤销！");
         	return;
         }
         if(!confirm("删除操作具有不可恢复性，您确定要删除吗？")) return;
         var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
		//  alert("parentId="+parentId);
         document.forms[0].action="troles.cmd?method=revokePermission&roleId="+roleId+"&objectId="+currentId+"&parentId="+parentId;
         document.forms[0].target="dataFrame0";
         document.forms[0].submit();
		  //setTimeout(refreshTree,200);
}

function refreshTree(parentId)
{		// alert("parentId?////////="+parentId);
         seltree.refreshNodeById(parentId);
}

function split(nodeId){
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
</SCRIPT>
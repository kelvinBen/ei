<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position = Constants.buttonPosition;
			String parentId = (String) request.getAttribute("parentId");
			String roleId = (String) request.getAttribute("roleId");
			String userId = (String) request.getAttribute("userId");
			String hasResource = (String) request.getAttribute("hasResource");
			String isModule = (String) request.getAttribute("isModule");
			String isTRoles = (String) request.getAttribute("isTRoles");

			%>

<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form action="">
	<widgets:container title="选择目标成员">
		<%if ("TopRight".equalsIgnoreCase(button_position)
					|| button_position == null || "".equals(button_position)) {
%>
		<widgets:containbutton onclick="showcheckdata()" text="确定"></widgets:containbutton>
		<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>

		<%}%>
		<input type="hidden" name="parentId" value="<%=parentId%>">
		<input type="hidden" name="roleId" value="<%=roleId%>">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="hasResource" value="<%=hasResource%>">
		<input type="hidden" name=isModule value="<%=isModule%>">
		<input type="hidden" name="isTRoles" value="<%=isTRoles%>">
		<table width="100%" height="400">
			<tr>
				<td><tree:selTree treeName="seltree" containId="SrcDiv"
					isShowElseBranch="true" type="checkbox" hasRoot="false"
					style="width:100%;height:400;overflow:auto;white-space:nowrap;"
					isDataAsync="false">
					<tree:selNode title="objectName" nodeId="objectId"
						nodeValue="nodeValue" collection="functree"
						nodeXmlSrc="isTreeLeaf" checkData="CheckData"
						isChecked="isChecked" caption="" perImgSrc="perImgSrc">
					</tree:selNode>
				</tree:selTree></td>
			</tr>
			<tr>
				<%if ("BottomCenter".equalsIgnoreCase(button_position)) {

			%>
				<td>
				<p align="center"><html:button name="btn.add" value="确定"
					onclick="showcheckdata()"></html:button> <html:button
					name="btn.close" value="关闭" onclick="forClose()"></html:button></p>
				</td>
				<%}%>
			</tr>
		</table>
	</widgets:container>
	<iframe style="display:none" name="dataFrame0"></iframe>
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{  
	var parentId=node.NodeId;
	var hasResource=document.forms[0].all("hasResource").value;
	var isModule=document.forms[0].all("isModule").value;
	var userId=document.forms[0].all("userId").value;
	var roleId=document.forms[0].all("roleId").value;
	if (node.NodeId=="root"){
		parentId=document.all("parentId").value;
	}
    seltree.xmlsrc="function.cmd?method=getContextNode1&parentId="+parentId+"&hasResource="+hasResource+"&userId="+userId+"&isModule="+isModule+"&roleId="+roleId;
}

function showcheckdata(){
        var allCheckNodeId=seltree.GetAllCheckNodeId();
        var parentId=document.forms[0].all("parentId").value;
        var hasResource=document.forms[0].all("hasResource").value;
        var isModule=document.forms[0].all("isModule").value;
		var isTRoles=document.forms[0].all("isTRoles").value;
        if(allCheckNodeId==""){
            alert("请选择一条记录！");
            return ;
        }
        if(isModule==1){
        if(isTRoles=="1")//为角色添加所选模块下用户具有的资源
			document.forms[0].action="troles.cmd?method=grantPermissionByUserModule&module="+allCheckNodeId+"&refreshId="+parentId+"&isModule="+isModule;
			else
			document.forms[0].action="role.cmd?method=grantPermissionByUserModule&module="+allCheckNodeId+"&refreshId="+parentId+"&isModule="+isModule;
        }else{
             if (hasResource=="0"){
        	//修改调用的方法－（使为角色添加权限的时候只添加登录用户具有的资源权限）2006-03-13 郑斌
			if(isTRoles=="1")
			document.forms[0].action="troles.cmd?method=grantPermission2&functions="+allCheckNodeId+"&refreshId="+parentId;
			else
			document.forms[0].action="role.cmd?method=grantPermission2&functions="+allCheckNodeId+"&refreshId="+parentId;
	}else{
			if(isTRoles=="1")
			document.forms[0].action="troles.cmd?method=grantPermission1&resources1="+allCheckNodeId+"&refreshId="+parentId;
			else
			document.forms[0].action="role.cmd?method=grantPermission1&resources1="+allCheckNodeId+"&refreshId="+parentId;
	}
        }

	document.forms[0].target="dataFrame0";
	document.forms[0].submit();
}
function forClose(){	
	parent.close();
}
</SCRIPT>

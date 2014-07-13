<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.bsp.util.Constants"%>

<%
	String button_position = Constants.buttonPosition;
	String tempId = (String)request.getAttribute("templateId");
	if(tempId == null){
		tempId = "";
	}
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
	<widgets:container title="ѡ��Ŀ���Ա">
		<%if ("TopRight".equalsIgnoreCase(button_position)
					|| button_position == null || "".equals(button_position)) {
%>
		<widgets:containbutton onclick="showcheckdata()" text="ȷ��"></widgets:containbutton>
		<widgets:containbutton onclick="forClose()" text="�ر�"></widgets:containbutton>

		<%}%>
		<input type="hidden" name="templateId" value="<%=tempId%>">
		<table width="100%" height="400">
			<tr>
				<td><tree:selTree treeName="seltree" containId="SrcDiv"
					isShowElseBranch="true" type="checkbox" hasRoot="false"
					style="width:100%;height:400;overflow:auto;white-space:nowrap;"
					isDataAsync="false">
					<tree:selNode title="roleAlias" nodeId="roleId"
						nodeValue="roleId" collection="sel_role_tree"
						nodeXmlSrc="isLeaf" checkData="CheckData"
						isChecked="isChecked" caption="" >
					</tree:selNode>
				</tree:selTree></td>
			</tr>
			<tr>
				<%if ("BottomCenter".equalsIgnoreCase(button_position)) {

			%>
				<td>
				<p align="center"><html:button name="btn.add" value="ȷ��"
					onclick="showcheckdata()"></html:button> <html:button
					name="btn.close" value="�ر�" onclick="forClose()"></html:button></p>
				</td>
				<%}%>
			</tr>
		</table>
	</widgets:container>
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{  
	seltree.xmlsrc="troles.cmd?method=getSelRoleNode"; 
}

function showcheckdata(){
        var allCheckNodeId=seltree.GetAllCheckNodeId();
        var tempId=document.forms[0].all("templateId").value;
        if(allCheckNodeId==""){
            alert("��ѡ��һ����¼��");
            return ;
        }
        window.returnValue=allCheckNodeId;
        parent.close();
}
function forClose(){	
	parent.close();
}
</SCRIPT>

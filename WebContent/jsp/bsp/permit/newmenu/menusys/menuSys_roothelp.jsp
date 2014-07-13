<%@ taglib uri="/WEB-INF/tlds/web-seltree.tld" prefix="tree"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
	String button_position=Constants.buttonPosition;
%>
<html>
<head>
<title></title>
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<form>
<widgets:container title="选择系统菜单项" >
<%
	if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="清 除"></widgets:containbutton>
<%}%> 
<table width="100%" height="400">
   <tr>
   <td width="50%" height="100%">
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="radio" hasRoot="false" rootText="主菜单" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="menuAlias" nodeId="menuSysId" nodeValue="menuSysId" collection="menuSys_tree" nodeXmlSrc="isLeaf" caption="">
	    </tree:selNode>
	</tree:selTree>
   </td>
   </tr>
   	<tr>
<%
    if("BottomCenter".equalsIgnoreCase(button_position)){
%>
		<td>
		<p align="center">
			<jsp:include page="../../../help_button.jsp" flush="true"/>
		</p>
		</td>
<%}%>   
    </tr>   
</table>
</widgets:container>
</form>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickText=function(node)
{    
	seltree.xmlsrc="menusys.cmd?method=getMenuSysNodeHelp&menuSysId="+node.NodeId+"&isCheckBox=0";   
}

seltree.clickImg=function(node)
{
	seltree.xmlsrc="menusys.cmd?method=getMenuSysNodeHelp&menuSysId="+node.NodeId+"&isCheckBox=0"; 
}
function showcheckdata(){
	var result=new Array(2);
	result[0]=seltree.GetAllCheckData();
	result[1]=seltree.GetAllCheckText();
	if(result[0]==''){
		return;
	}
	parent.returnValue=result;
	parent.close();
}
function forClose(){
	parent.returnValue = null;
	parent.close();
}
function forCancel(){
	var result=new Array(2);
	result[0]="";
	result[1]="";
	parent.returnValue=result;
	parent.close();
}
</SCRIPT>
</html>
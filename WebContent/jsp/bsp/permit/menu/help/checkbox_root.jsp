<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;%>
<html>
<%
String except=request.getParameter("except");
if(except==null){
	except="";
}

%>
<head>
<title>选择菜单</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</head>

<BODY scroll=no  topmargin="0" leftmargin="0" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
<html:form action="">
<widgets:container title="选择菜单" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton> 
<widgets:containbutton onclick="forCancel()" text="清除"></widgets:containbutton> 

<%}%>
<table width="100%" height="400">
    <tr>
      <td width="65%">
		<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" type="checkbox" style="width:300;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  		<tree:selNode title="text" nodeId="id" collection="tree"  nodeXmlSrc="isTreeLeaf" checkData="id" perImgSrc="perImgSrc"/>
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
</html:form>
</body>

</html>

<script lanuage="javascript">
var except="<%=except%>";
	seltree.clickImg=function(node){
		seltree.xmlsrc="menuhelp.cmd?method=children&ID="+node.NodeId+"&multiply=yes"+"&except="+except;
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
</script>

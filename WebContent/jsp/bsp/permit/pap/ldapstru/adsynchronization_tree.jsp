<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%
	String button_position=Constants.buttonPosition;
    String corporation = (String)session.getAttribute("CORPORATIONNAME");
    String corporationId = (String)session.getAttribute("CORPORATIONID");
%> 
<HTML>
<HEAD>
<TITLE>组织机构同步</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY  scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form action="">
<widgets:container title="同步组织机构" >
<table id="tblSearch">
	<tr>
    <td>当前机构：</td><td><%=corporation%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<input type="hidden" name="nowCrop" value="<%=corporationId%>">
	</tr>
</table>
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="synchronizedata(this)" text="同步"></widgets:containbutton>
<%}%>
<table width="100%" height="80%" border="2" bordercolor="#B0C4DE">
    <tr>
      <td>
		<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="radio" hasRoot="false" rootText="用户列表" style="width:100%;height:400;overflow:auto;white-space:nowrap;">
		  	<tree:selNode title="struName" nodeId="struId" nodeValue="struId" collection="treeList" nodeXmlSrc="isTreeLeaf" perImgSrc="perImgSrc" radioData="RadioData" caption="">
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
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
    var nodeId=node.NodeId;
    seltree.xmlsrc="adStruSyn.cmd?method=foradSynchronization&from=jsp&treeNodeId=" + nodeId;       
}
function synchronizedata(obj){
	var returnV=new Array(2);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText(); 
	if(returnV[0]==""){
		alert("请选择一个机构！");
		return ;
	}
	document.forms[0].action="adStruSyn.cmd?method=adStruSynchronization&struId=" + returnV[0];
	document.forms[0].submit();
	obj.disabled=true;
}
function forCancel(){
	var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
	parent.close();
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
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
} 

//定位到指定节点
function openNode(id){
	//alert("openNode--id=" + id);
	var path;
	var d = id.indexOf("\n");
	if(d == 1){
		path = id.substring(2,id.length-2);
	}else{
		path = id;
	}
	//alert("path=" + path);
	seltree.openNodeById(path);
}
init();
function init(){
	var corpId = document.forms[0].all("nowCrop").value;
	openNode(corpId);   
}
</SCRIPT>
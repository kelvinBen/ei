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
    String organName = request.getParameter("organName");
    if(organName == null){
    	organName = "";
    }
%> 
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY  scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form action="">
<widgets:container title="切换机构" >
<table id="tblSearch">
	<tr>
    <td>当前机构：</td><td><%=corporation%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>机构名称：<input type="text" name="organName" value="<%=organName%>" size="26">&nbsp;&nbsp;&nbsp;</td>
		<input type="hidden" name="nowCrop" value="<%=corporationId%>">
		<td><html:button name="chaxun" value="定位" onclick="forTree()"/></td>
	</tr>
</table>
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="切换机构"></widgets:containbutton>
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
    seltree.xmlsrc="subcorporationquery.cmd?method=query&from=jsp&treeNodeId=" + nodeId;       
}
function showcheckdata(){
	var returnV=new Array(2);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText(); 
	if(returnV[0]==""){
		alert("请选择一个机构！");
		return ;
	}
	document.forms[0].action="changecorporation.cmd?method=change&corpId=" + returnV[0];
	document.forms[0].target="_top";
	document.forms[0].submit();
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

//定位
function forTree()
{        
        var struName = document.forms[0].all("organName").value;
        var tStruName = struName.trim();
        if(tStruName == ""){
        	alert("请输入机构名称！");
        	return;
        }
	    var rtnValue = startRequest("changecorporation.cmd?method=forTree&struName="+struName); 
	    var value;
		var d = rtnValue.indexOf("\n");
		if(d == 1){
			value = rtnValue.substring(2,rtnValue.length-2);
		}else{
			value = rtnValue;
		}
		if(value == "输入的机构名称不存在！"){
			alert("输入的机构名称不存在！");
			return;
		}
	    openNode(rtnValue);   
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
	//alert(corpId);
	var rtnValue = startRequest("changecorporation.cmd?method=forNowPath&corpId="+corpId); 
	openNode(rtnValue);   
}
</SCRIPT>
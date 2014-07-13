<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY  scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<html:form action="">
<widgets:container title="选择用户" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="清 除"></widgets:containbutton>

<%}%>
<table width="100%" height="80%">
    <tr>
      <td>
		<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="checkbox" hasRoot="false" rootText="用户列表" style="width:100%;height:400;overflow:auto;white-space:nowrap;">
		  	<tree:selNode title="OBJECTNAME" nodeId="OBJECTID" nodeValue="OBJECTNAME" collection="user_tree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" checkData="CheckData" caption="">
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
function split(node){
  var nodeId=node;
  var arr = new Array(2);
  var i=nodeId.indexOf(',');
  var l=nodeId.length;
  if(i==-1) {
	arr[0]="-1";
	arr[1]="-1";
	return arr;
  }else{
    arr[0]=nodeId.substring(0,i);
    arr[1]=nodeId.substring(i+1,l);
    return arr;
  }
}
seltree.clickImg=function(node)
{
  
  //如果是机构则列出下级  右边变成空白窗口
  //如果是用户则显示用户明细
 if(node.NodeValue!=null){
    var nodeId=node.NodeId;
    var arr=split(nodeId);
    if(arr[1]=="S")
    {
       seltree.xmlsrc="user.cmd?method=getcheckboxnode&OBJECTID="+arr[0];    
    }else if(arr[1]=="N"){
       return;
    }
    }    
}
function showcheckdata(){
	var returnV=new Array(2);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText(); 
	if(returnV[0]==""){
		alert("请选择一条记录！");
		return ;
	}
	window.returnValue=returnV;
	parent.close();
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
</SCRIPT>
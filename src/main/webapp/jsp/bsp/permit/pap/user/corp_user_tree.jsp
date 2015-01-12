<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<%
  String rootId=(String)request.getAttribute("corporationId");
  String corporationName = (String)request.getAttribute("corporationName");
 String isCheckBox = (String)request.getParameter("isCheckBox");
%>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="选择用户" >
<table width="100%" height="80%">
    <tr>
      <%
     	if(isCheckBox!=null&&isCheckBox.equals("1")){
     %>
	  <td>
	   <tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="checkbox" hasRoot="true" rootText="用户列表" style="width:100%;height:384;overflow:auto;white-space:nowrap;">
	     	<tree:selNode title="corporationName" nodeId="corporationId" nodeValue="corporationName" collection="user_tree" nodeXmlSrc="isLeaf" checkData="CheckData" caption="">
	        </tree:selNode>
	   </tree:selTree>
	  </td>
  <%}else{%>
  <td>
<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="radio" hasRoot="true" rootText="用户列表" style="width:100%;height:384;overflow:auto;white-space:nowrap;">
	     	<tree:selNode title="corporationName" nodeId="corporationId" nodeValue="corporationName" collection="user_tree" nodeXmlSrc="isLeaf" radioData="RadioData" caption="">
	        </tree:selNode>
	   </tree:selTree>

	   
	  </td>
	  <%}%>
    </tr>
    <tr><td>
    <p align="center">
 <html:button name="btn.add" value="确定" onclick="showcheckdata()"></html:button>
 <html:button name="btn.del" value="关闭" onclick="forClose()"></html:button>

    </p>
    </td></tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
        seltree.xmlsrc="user.cmd?method=getCorporationUserNode&rootId="+"<%=rootId%>"+"&isCheckBox="+"<%=isCheckBox%>";        
}

function showcheckdata(){
        var returnV=new Array(2);
        returnV[0]=seltree.GetAllCheckNodeId();
        returnV[1]=seltree.GetAllCheckText(); 
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

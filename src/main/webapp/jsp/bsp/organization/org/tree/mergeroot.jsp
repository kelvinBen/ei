<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY onkeydown="forKey()" scroll=no  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<widgets:container title="ѡ�����ϼ�" >
<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="ȷ��"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="�ر�"></widgets:containbutton> 

<%}%>
<table width="100%" height="100%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" collection="functree" nodeXmlSrc="isLeaf" radioData="RadioData"  caption="" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr align="left">
        <td align="left">�����¼�����:<html:select name="hrEventType" property="hrEventType" ><html:options collection="hrEventTypeOptions" labelProperty="typeName" property="eventType"/></html:select><FONT COLOR=#ff0000>*</FONT></td>
       </tr> 
      
       <tr align="left">
        <td  align="left">�����¼���ע:<html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
       </tr> 
 
       <tr align="center"> 
		<%
		    if("BottomCenter".equalsIgnoreCase(button_position)){
		%>
		<td align="center">
		 <html:button name="btn.add" value="ȷ��" onclick="showcheckdata()"></html:button>
		 <html:button name="btn.close" value="�ر�" onclick="forClose()"></html:button>
		 
		</td>
		<%}%> 
       </tr>
 
    </table>  
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
        seltree.xmlsrc="stru.cmd?method=getMergeNode&nevervote=1&parentId="+node.NodeId+"&fromStruId=<%=(String)request.getAttribute("fromStruId")%>";       
}

function showcheckdata(){
var hrEventMemo=document.all.hrEventMemo;
if(!stringLengthCheck(hrEventMemo,250,"�����¼����ͱ�ע���ܳ���250���ַ�!")){
    return false;
}

var key=seltree.GetAllCheckNodeId();
if(key==""){
	alert("��ѡ����֯�����ϼ�.");
	return  ;
}
    var returnV=new Array(1);   
    //returnV[0]="stru.cmd?method=mergeTo&fromStruId=<%=request.getAttribute("fromStruId")%>&toStruId="+seltree.GetAllCheckData();
    returnV[0]="stru.cmd?method=mergeTo&fromStruId=<%=request.getAttribute("fromStruId")%>&toStruId="+seltree.GetAllCheckNodeId()+"&hrEventType="+document.all("hrEventType").value+"&hrEventMemo="+document.all("hrEventMemo").value;
    window.returnValue=returnV;
    parent.close();
}
function forCancel(){
 parent.close();
}
function forClose(){
 parent.close();
}
function forKey(){  
     if(event.keyCode==13)
        return;
        }
</SCRIPT>
</html>
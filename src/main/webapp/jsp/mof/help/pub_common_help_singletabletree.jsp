<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<jsp:useBean id="PubCommonHelpView" type="net.mast.help.view.PubCommonHelpView" scope="request"/>

<HTML>
<HEAD>
<TITLE><%=PubCommonHelpView.getHelpTitle()%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onkeydown="doBodykey()">
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<%
    String button_position=Global.getString("net.mast.help.treehelp.button.position");
	String is_multsel=PubCommonHelpView.getIsMultsel();//�Ƿ������ѡ
	String tree_type="";
	if(is_multsel.equals("0"))tree_type="radio";
	else	tree_type="checkbox";				
%>
<widgets:container title="<%=PubCommonHelpView.getHelpTitle()%>" height="420">
<html:form name="frmList" action="pubcommonhelpsingletabletree.cmd">
<%
    if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="doConfirm()" text="ȷ ��"></widgets:containbutton>
<widgets:containbutton onclick="doClose()" text="�� ��"></widgets:containbutton>
<widgets:containbutton onclick="doClear()" text="�� ��"></widgets:containbutton>
<%}%>
<table width="100%" height="96%">
    <tr><td width="100%">
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="<%=tree_type%>" rootText="<%=PubCommonHelpView.getRootTitle()%>" rootId="<%=PubCommonHelpView.getRootValue()%>" hasRoot="true" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<%
	  	 if(tree_type.equals("radio")){
	  	%>
	  	<tree:selNode title="title" nodeId="nodeId" nodeValue="radioData" collection="tree" caption="caption"  nodeXmlSrc="nodeXmlSrc" radioData="radioData"></tree:selNode>
	  	<%}else{%>
	  	<tree:selNode title="title" nodeId="nodeId" nodeValue="checkData" collection="tree" caption="caption"  nodeXmlSrc="nodeXmlSrc" checkData="checkData"></tree:selNode>
	   	<%}%>
	    
	</tree:selTree>
	</td>
	<td>
    </td>
    </tr>
    </table>
<%
    if("BottomCenter".equalsIgnoreCase(button_position)){
%>
    <div align=center>
    <html:button name="ȷ ��" value="ȷ ��" onclick="doConfirm()"></html:button>
    <html:button name="�� ��" value="�� ��" onclick="doClose()"></html:button>
    <html:button name="�� ��" value="�� ��" onclick="doClear()"></html:button>
    </div> 
<%}%>
</html:form>
</widgets:container>
<SCRIPT LANGUAGE="JavaScript">
seltree.refreshNodeByIdOnce(-1);
<%
HashMap parmsMap = (HashMap)request.getAttribute("PUBCOMMONHELP_PARMS_MAP");

java.util.Iterator it=parmsMap.keySet().iterator();
String parms="";
while(it.hasNext())
{
	String parm_name=(String)it.next();
	String parm_value=(String)parmsMap.get(parm_name);
	parms=parms+"&"+parm_name+"="+parm_value;
}
%>
seltree.clickImg=function(node){
    	
        seltree.xmlsrc="pubcommonhelpsingletabletreesub.cmd?nodeId="+node.NodeId+"<%=parms%>";
}
//˫���¼�
seltree.dblclickText = function(p_oSrcElement){  
	doConfirm();
}
function doConfirm(){
	var lines=seltree.GetAllCheckData();
	  if(lines==""){
	    alert("��ѡ���¼!");
	    return false;
	  }
	 
	 
	 var result = new Array();
	 var LineArray = lines.split(",");//������
	 for(var i=0;i<LineArray.length;i++){
		
		//��Ϊ�ڶ��д�ŵ��Ƿ���������#�ָ�������ֱ�Ӹ���result  
		result[i]=LineArray[i].split("#");
	 }
	parent.returnValue = result;
	parent.close();
}
function doClose(){
	parent.close();
}
function doClear(){
	var result = new Array();
	var lineArray=new Array();
	<%
		String returnField[]=PubCommonHelpView.getReturnField().split(",");
		int ret_line_size=returnField.length;
		for(int i=0;i<ret_line_size;i++)
		{
	%>
		lineArray[<%=i%>]="";
	<%	
		}
	%>
	
	result[0]=lineArray;
	parent.returnValue = result;
	parent.close();	
}
//ע�⣬��IE�в���ͨ����������һЩ�������Maxthon�п��ܻ᲻ִ��
function doBodykey(){
    //�ڴ����а�ESC�رհ�������
    if(window.event.keyCode==27){
        parent.close();  
    }
}
</SCRIPT>
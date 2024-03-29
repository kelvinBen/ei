<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;
    String organType=(String)request.getAttribute("organType");
    String isCheckBox=(String)request.getAttribute("isCheckBox");
    String isIncludeSubCorporation=(String)request.getAttribute("isIncludeSubCorporation");
    String isIncludeStruPath = (String)request.getAttribute("isIncludeStruPath");
    String isExact = (String)request.getParameter("isExact");
    String showOrganType = (String)request.getParameter("showOrganType");
%>
<HTML> 
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>

<html:form action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="选择目标成员" >

<table width="100%" height="80%"> 
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:384;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="nodeValue" collection="functree" nodeXmlSrc="isLeaf" checkData="CheckData" caption="organName" perImgSrc="perImgSrc" >
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    <tr><td><p align="center">
	<html:button name="confirmBtn" value="确定" onclick="showcheckdata()"></html:button>
    <html:button name="cancelBtn" value="取消" onclick="forCancel()"></html:button>
    <html:button name="clearBtn" value="清除" onclick="doCancel()"></html:button>
    <html:button name="insertBtn" value="增加" onclick="showinsertdata()"></html:button>
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
        seltree.xmlsrc="wf_struhelp.cmd?method=getHelpTreeNode&rootId="+node.NodeId+"&organType=<%=organType%>&isCheckBox=<%=isCheckBox%>&isIncludeSubCorporation=<%=isIncludeSubCorporation%>&isIncludeStruPath=<%=isIncludeStruPath%>&isExact=<%=isExact%>&showOrganType=<%=showOrganType%>";        
}
//提供增加按钮，可以在原来的基础上增加选项
//判断点击增加按钮还是确定按钮
var ifInst="false";
function showinsertdata(){
	ifInst="true";
	showcheckdata();
}
function showcheckdata(){
	var result = new Array();
	var ids = new Array();
	ids = seltree.GetAllCheckData().split(",");
	var names = new Array();
	names = seltree.GetAllCheckText().split(",");
	var len=ids.length;
	for(var i=0;i<len;i++){
		var ret = new Array();
			ret["primary-value"]=ids[i];
		 	ret["display-str"]=names[i];
		 	ret["display-url"]='<%=MatrixHref.getUrl("Organ")%>'+ids[i];	
		 	
		 	result[i]=ret;
		
	}   
	   		result.type="<%=isCheckBox%>";
			result.insert=ifInst;
			ifInst="false";
	        window.returnValue=result;
	        parent.close();
	}
function forCancel(){
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
</SCRIPT>

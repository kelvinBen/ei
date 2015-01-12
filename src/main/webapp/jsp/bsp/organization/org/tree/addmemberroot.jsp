<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;
String isLeaf = (String)request.getAttribute("is_leaf");%>
<HTML>
<HEAD>
<TITLE>选择下级成员</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</HEAD>
<BODY scroll=no topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>

<html:form action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="选择下级成员" >
<widgets:containbutton onclick="showcheckdata()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton> 

<table width="100%" height="400">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" checkData="CheckData"  caption="" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    <tr>
	<td><p align="center">
	 <html:button name="btn.add" value="确定" onclick="showcheckdata()"></html:button>
	 <html:button name="btn.close" value="关闭" onclick="forClose()"></html:button>
	</p>
	</td>
	</tr>
    </table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
        seltree.xmlsrc="stru.cmd?method=getAddMemberNode&nevervote=1&parentId="+node.NodeId+"&fromStruId=<%=(String)request.getAttribute("parentId")%>"; 
}

function showcheckdata(){
// window.location.href ="stru.cmd?method=add&parentId=<%=request.getAttribute("parentId")%>&primaryKey="+seltree.GetAllCheckData();

var returnV=new Array(1);
returnV[0]="stru.cmd?method=add&parentId=<%=request.getAttribute("parentId")%>&primaryKey="+seltree.GetAllCheckData();
//returnV[0]="stru.cmd?method=add&parentId=<%=request.getAttribute("parentId")%>&primaryKey="+seltree.GetAllCheckNodeId();
if(seltree.GetAllCheckData()==""){
   alert("请选择下级!");
   return false;
}
window.returnValue=returnV;
parent.close();
}
function forCancel(){
    var returnV=new Array(1);
    returnV[0]="";
    window.returnValue=returnV;
    parent.close();
}

function forClose(){
    parent.close();
}
</SCRIPT>

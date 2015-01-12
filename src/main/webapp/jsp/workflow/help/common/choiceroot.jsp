<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;
    String type=(String)request.getAttribute("type");
    String title=request.getParameter("title");
    if(title==null){
    	title="选择目标成员";
    }
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</SCRIPT>
</head>
<BODY scroll=no topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<widgets:container title="<%=title%>" >
<table width="100%" height="100%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" collection="functree" nodeXmlSrc="isLeaf" radioData="RadioData"  caption="organName" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr>
	<td>
  <p align="center">
  <button name="alldata" onclick="showcheckdata()" class="advbutton">确定</button>
  <button name="alldata" onclick="forCancel()" class="advbutton">取消</button>
 <button name="alldata" onclick="doCancel()"  class="advbutton">清除</button>
 </p>
 </td>
    </tr>
    </table>
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
       seltree.xmlsrc="struhelp.cmd?method=getChoiceNode&parentId="+node.NodeId+"&reqtype=<%=type%>";       
}

function showcheckdata(){
	var returnV=new Array(3);
	returnV[0]=seltree.GetAllCheckData(MatrixCol);
	returnV[1]=seltree.GetAllCheckText(MatrixCol);
	returnV[2]=seltree.GetAllCheckNodeId(MatrixCol);
	 if(returnV[2]==""){
           alert("你还没选择！");
           return ;
        }
	window.returnValue=returnV;
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
</html>
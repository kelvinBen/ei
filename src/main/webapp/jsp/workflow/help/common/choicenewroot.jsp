<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;
    String organType=(String)request.getAttribute("organType");
    String isCheckBox=(String)request.getAttribute("isCheckBox");
     String isIncludeSubCorporation=(String)request.getAttribute("isIncludeSubCorporation");
     String isIncludeStruPath = (String)request.getAttribute("isIncludeStruPath");
     String isExact = (String)request.getParameter("isExact");
     String showOrganType = (String)request.getParameter("showOrganType");

     String title=request.getParameter("title");
    if(title==null){
    	title="选择目标成员";
    }
    String clearButtonVisible = request.getParameter("clearButtonVisible");
    if (clearButtonVisible != null && clearButtonVisible.equals("false")) {
		;
    } else {
    	clearButtonVisible = "true";
    }
%> 
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY scroll=no topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<widgets:container title="<%=title%>" >
<table width="100%" height="80%">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:384;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" radioData="RadioData"  caption="organName">
	    </tree:selNode>
	</tree:selTree>
    
	</td>
    </tr>
    <tr>
    <td>
   <p align="center">
 <button name="alldata" onclick="showcheckdata()" class="advbutton">确定</button>
 <button name="alldata" onclick="forCancel()" class="advbutton">取消</button>
<%
	if (clearButtonVisible.equals("true")) {
%>
		<button name="alldata" onclick="doCancel()" class="advbutton">清除</button>
<%
	}
%>
 </p>
    </td>
    </tr>
    </table>
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
       seltree.xmlsrc="struhelp.cmd?method=getHelpTreeNode&rootId="+node.NodeId+"&organType=<%=organType%>&isCheckBox=<%=isCheckBox%>&isIncludeSubCorporation=<%=isIncludeSubCorporation%>&isIncludeStruPath=<%=isIncludeStruPath%>&isExact=<%=isExact%>&showOrganType=<%=showOrganType%>";       
}

function showcheckdata(){
	var returnV=new Array(5); 
	returnV[0]=seltree.GetAllCheckData(MatrixCol);
	returnV[1]=seltree.GetAllCheckText(MatrixCol);
	returnV[2]=seltree.GetAllCheckNodeId(MatrixCol);
         if(returnV[2]==""){
           alert("你还没选择！");
           return ;
        }
	var arr = seltree.GetAllCheckNodeValue();
        var s = arr.split("$");
        var organCode = s[0];
        var note = s[1];
        returnV[3] = organCode;
        returnV[4] = note;
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
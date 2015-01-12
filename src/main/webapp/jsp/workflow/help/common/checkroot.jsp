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
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

<html:form action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="<%=title%>" >

<table width="100%" height="400">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" checkData="CheckData" caption="organName" perImgSrc="perImgSrc">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    <tr><td><p align="center">
<button name="alldata" onclick="showcheckdata()" class="advbutton">确定</button>
<button name="alldata" onclick="forCancel()" class="advbutton">取消</button>
<button name="alldata" onclick="doCancel()" class="advbutton">清除</button>
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
        seltree.xmlsrc="struhelp.cmd?method=getCheckNode&parentId="+node.NodeId+"&reqtype=<%=type%>";        
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

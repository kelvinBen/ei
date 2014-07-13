<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<sotower:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<sotower:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" class=”treePageCss” text="#000000" >
<widgets:container title="选择属性域" >
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="清 除"></widgets:containbutton>  
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="desc" nodeId="categoryId" nodeValue="type" radioData="pmradio" collection="treedata" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
</table>
</widgets:container>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{	
	var bb = node.NodeValue;
	if(bb=="0"){
		//在模型上按下鼠标	
    	seltree.xmlsrc="soacategory.cmd?method=getModel&parentid="+node.NodeId+"&rtnpath=pmnode&modelType=1"; 
    } else {
    	seltree.xmlsrc="";
    }  
}
function showcheckdata(){
	var returnV=new Array(4); 
	returnV[0]=seltree.GetAllCheckNodeId();
	var node = seltree.GetNodeById (returnV[0]);
	returnV[1]=seltree.GetAllCheckText();
	if(returnV[0]==""||returnV[0]==null||returnV[0]=="null"){
           alert("请选择一条记录！");
           return ;
    }
	window.returnValue=returnV;
	parent.close();
}
function forCancel(){
    var returnV=new Array(4);
    returnV[0]="";
    returnV[1]=""; 
    window.returnValue=returnV;
	parent.close();
}
function forClose(){
    parent.close();
}
seltree.openRootNode();
</SCRIPT>


<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<widgets:container title="角色信息" >
<html:form action="">
<html:hidden name="primaryKey" value=""/>

<table width="100%">
    <tr ><td>
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false" type="radio" hasRoot="false" rootText="角色列表" style="width:180;height:400;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="roleAlias" nodeId="roleId" nodeValue="roleId" collection="role_tree" nodeXmlSrc="isLeaf" radioData="RadioData" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
	<tr>
	<td align="center">
	<button name="btnClose" onclick="showcheckdata()"  class="advbutton">确 定</button><button name="btnClose" onclick="forCancel()"  class="advbutton">关 闭</button>
	</td>
	</tr>
	</table>
</html:form>
</widgets:container>
</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
        seltree.xmlsrc="role.cmd?method=choicenode";        
}

function showcheckdata(){
		var value = new Array();
		value[0]=seltree.GetAllCheckNodeId();
		value[1]=seltree.GetAllCheckText();
		
		window.returnValue=value;
        parent.close();
}
function forCancel(){ 
	parent.close();
}
</SCRIPT>

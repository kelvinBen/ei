<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
</head>
<%
	String groupId = String.valueOf(request.getAttribute("groupId"));
%>
<BODY>
<div class="btnareaCss">
	<html:button onclick="forInsert()" name="btn_insert" value="保存"></html:button>
</div>
<html:form  name="frmList"  action="">
<bsp:container title="组织树" >
<table width="100%" cellpadding="0" height="90" cellspacing="0"  border="0">
    <tr><td>
    <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="radio" hasRoot="false"  style="width:100%;height:400;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" collection="functree" nodeXmlSrc="isLeaf"  radioData="RadioData"  caption="organName">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
</bsp:container>
</html:form>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{
   
        seltree.xmlsrc="mailaddress.cmd?method=impOrgToTeamNode&nevervote=1&parentId="+node.NodeId;        
}
function forInsert(){
	var returnV=new Array(2);
	returnV[0]=seltree.GetAllCheckData();
	returnV[1]=seltree.GetAllCheckText();
	
	if(returnV[0]=="")
	{
		alert("请选择一个部门后保存！");
	}
	else
	{
		document.forms[0].action="mailaddress.cmd?method=forInsertOrganToMailAddressGroup&addressGroupId=<%=groupId%>&struId="+returnV[0].substring(returnV[0].indexOf(",")+1)+"&organName="+returnV[1];
		document.forms[0].submit();
	}
}

</SCRIPT>
</html>
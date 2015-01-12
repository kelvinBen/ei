<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	String refresh = (String)request.getAttribute("refresh");
	if(refresh == null || refresh==""){
		refresh = "0";
	}
%>
<HTML>
<HEAD>
<TITLE>系统菜单明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="系统菜单明细" >
<bsp:containbutton action="menusys.cmd?method=forUpdateMenuType" text="修改" onclick="forUpdateMenuType()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">菜单代码：</td>
      <td class="tdRight"><html:hidden name="typeId" property="typeId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">菜单名称：</td>
      <td class="tdRight"><html:hidden name="typeName" property="typeName" write="true"/></td>
    </tr>
  	<html:hidden name="isCurrent" property="isCurrent" write="false"/>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function forUpdateMenuType(){
	var typeId = trim(document.forms[0].typeId.value);
	document.forms[0].action ="menusys.cmd?method=forUpdateMenuType&typeId="+typeId;
  	document.forms[0].submit();	
}
function init(){
	var refresh = "<%=refresh%>";
	if(getTreeFrame().seltree!=null){
		if(refresh=="1"){
			getTreeFrame().seltree.refreshNodeById("00"); 
		}
	}
}
init();
</script>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>个性化菜单</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<bsp:container title="个性化菜单" >
<bsp:containbutton action="permenudefine.cmd?method=getMenuStruRootPer" onclick="clickOk()" text="确定"></bsp:containbutton>
<bsp:containbutton onclick="forCancel()" text="取消"></bsp:containbutton>

<html:messages></html:messages>
<html:form name="frmList" action="permenudefine.cmd?method=getMenuStruRootPer">
<table  width="100%" height="350">
您还没有定义个性化菜单,请确认是否定义?
</table>
</html:form>
</bsp:container>
<script language="javascript">
function clickOk(){
  document.forms[0].action ="permenudefine.cmd?method=getMenuStruRootPer";    
  document.forms[0].submit();	
}
function forCancel(){
	getMainFrame().location.href = "jsp/content.jsp";	
}
 
 
 
</script>
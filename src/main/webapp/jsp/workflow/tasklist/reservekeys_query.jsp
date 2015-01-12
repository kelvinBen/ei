<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>保留域查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px" onload="setTitleInTreeBar('工作流－保留域列表')">

<%
	String processtype=(String)request.getSession().getAttribute("tasklist_processtype");
	
%>
<div class="btnareaCss">
<html:button name="保存" onclick="forSave()" value="保存"></html:button>&nbsp;<html:button name="返回" onclick="forReturn()" value="返回"></html:button>
</div>

<html:form name="frmList" action="reservekeysquery.cmd">

<input type="hidden" name="processtype" value="<%=processtype%>">

<grid:grid name="grid" property="tempLines" type="edit" height="300">			
		<grid:checkboxCol property="isChecked" name="isChecked" caption="选择" index="1"  width="100"></grid:checkboxCol>		
		<grid:textCol property="fieldid" name="fieldid" caption="字段id" readonly="true" index="2"  width="100"></grid:textCol>		
		<grid:textCol property="title" name="title" caption='名称' readonly="true" index="3" width="100"></grid:textCol>
        <grid:textCol property="index" name="index" caption='序号' index="5" width="100"></grid:textCol>
        <grid:textCol property="htmlstyle" name="htmlstyle" caption='样式表' index="6" width="100"></grid:textCol>
</grid:grid>
</html:form>
<script language="javascript">
grid.show();
function forSave(){
  if(!getSelect()) return;
  document.forms[0].action ="tasklist.cmd?method=insertReservKeys";    
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="tasklistquery.cmd";
  document.forms[0].submit();	
}
function getSelect(){
	var rowcount = grid.returnRowCount();
	for(var i=1;i<=rowcount;i++){
		if(grid.getCellObject(i,1).checked){
			return true;
		}
	}
	alert("请选择一条记录！");
	return false;
}
</script>
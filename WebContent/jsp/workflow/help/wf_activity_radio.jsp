<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.workflow.api.client.wfClientExtend.WFDocument"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
<HEAD>
<TITLE>选择环节</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</HEAD>

<BODY topmargin="10px">
<%
	String processId = request.getParameter("processId");
	List returnList = new ArrayList();
	try {
	
		returnList = WFDocument.newInstance().getAllActivitiesDef(processId);
	
	} catch (Exception e) {
		throw new RuntimeException("获取流程的环节列表异常!",e);
	}
	request.setAttribute("flexgrid.data", returnList);
%>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<br>
<div class="btnareaCss">
	<html:button name="确定" value="确定" onclick="forConfirm()"></html:button>
	<html:button name="取消" value="取消" onclick="forCancels()"></html:button>&nbsp;
</div>

<flex:flexgrid name="grid" height="200" action="" isSubmit="false" >
     <flex:radioCol name="activityDefId" caption='选择' width="50" property="activityDefId" sortName="taskinfo.actDefId"  canSort="false"></flex:radioCol>
     <flex:flexCol name="activityDefId" caption='环节定义ID' width="100" property="activityDefId" sortName="taskinfo.actDefId" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol name="actDefName" caption='环节名称' width="300" property="activityDefName" sortName="taskinfo.actDisName" canSort="true"></flex:flexCol>
</flex:flexgrid>

</BODY>
</HTML>
<script language="javascript">
grid.show();
grid.setSumText("");
//setGridHeight("grid",0.4);
/**取消*/
function forCancels(){
	window.close();
}

function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择环节!");
    return false;
  }
  return true;
}
function forConfirm(){
	if(!getSelect())
		return ;

	window.returnValue=grid.getCheckLine();
	window.close();
}

</script>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px" >
<div class="btnareaCss">

<html:button onclick="forReturn()" name="btn_return" value="返回"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String processId=(String)request.getAttribute("processId");
if(processId==null)processId="";
String activityId=(String)request.getAttribute("activityId");
if(activityId==null)activityId="";
%>
<html:form name="frmList" action="">

<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="wfactId" value="<%=activityId%>">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="选择" width="35" property="resKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='处理人' width="100" property="userName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='类型' width="100" property="resType" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='处理人类型' width="100" property="newTypeName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='开始时间' width="100" property="createTime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='发送人' width="100" property="previousResName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='发送人类型' width="100" property="oldType" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='发送人类型' width="100" property="oldTypeName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='是否接受' width="100" property="isAcceptName" sortName="a.b"></flex:flexCol>
                          

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-已结束环节委派列表");
grid.show();
grid.setSumText("");
//setGridHeight("grid",0.5);

function forReturn(){
	window.history.back();
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
</script>
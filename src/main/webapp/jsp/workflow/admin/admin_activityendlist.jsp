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

%>
<html:form name="frmList" action="">

<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="wfactId" value="">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="选择" width="35" property="actKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='环节名称' width="150" property="actName" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='环节名称' width="100" property="actName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='开始时间' width="100" property="createTime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='活动时间' width="100" property="activatedTime" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='结束时间' width="100" property="stateTime" sortName="a.b"></flex:flexCol>
                         <flex:flexCol caption='环节key' width="100" property="actKey" sortName="a.b" style="display:none"></flex:flexCol>
                          
                          <flex:flexCol caption='说明' width="100" property="description" sortName="a.b"></flex:flexCol>

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-已结束环节实例列表");
grid.show();
//setGridHeight("grid",0.5);
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var wfactId=grid.getCellValue(i, 1);
		var actName=grid.getCellValue(i, 2);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:getAssignmentList('"+wfactId+"')\">"+actName+"</a></span>";
								
}
function getAssignmentList(wfactId){
	document.all("wfactId").value=wfactId;
  document.forms[0].action ="wfadminquery.cmd?method=getAssignmentEndList";  
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processendadminquery.cmd?clear=true";  
  document.forms[0].submit();	
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
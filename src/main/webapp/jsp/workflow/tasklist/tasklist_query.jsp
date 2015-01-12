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
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE>任务列表查询</TITLE>
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
<BODY topmargin="10px" onload="init();">

<%
	String  processtype = (String)request.getSession().getAttribute("tasklist_processtype");
	
%>
<div class="btnareaCss">
<html:button name="增加" onclick="forInsert()" value="增加"></html:button>&nbsp;<html:button name="修改" onclick="forUpdate()" value="修改"></html:button>&nbsp;<html:button name="明细" onclick="forDetail()" value="明细"></html:button>&nbsp;<html:button  name="删除" onclick="forDelete()" value="删除"></html:button>&nbsp;<html:button name="返回" onclick="forReturn()" value="返回"></html:button>
</div>
<html:form name="frmList" action="tasklistquery.cmd">
<input type="hidden" name="processtype" value="<%=processtype%>">
<support:flexgrid name="grid" height="260" action="" isSubmit="true">
                          <flex:checkboxCol caption="选择" width="50" property="field-id"  name="tasklistPK" sortName="process.field-id" canSort="false"></flex:checkboxCol>
                          <flex:flexCol caption='字段id' width="250" property="field-id" sortName="tasklist.field-id" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='标题' width="300" property="title" sortName="tasklist.title" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='顺序' width="100" property="index" sortName="tasklist.index" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='是否保留域' width="100" property="isReserved" sortName="tasklist.isReserved" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='html样式' width="100" property="html-style" sortName="tasklist.html-style" style="display:none" canSort="false"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="tasklistquery.cmd" >
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
//setGridHeight("grid",0.5)
grid.show();
grid.setSumText("");
setTitleInTreeBar('工作流－任务列表定制');
}

function forInsert(){
  document.forms[0].action ="tasklist.cmd?method=getReservekeys";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="tasklist.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="tasklist.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="tasklist.cmd?method=delete";    
  document.forms[0].submit();	
}
function forReturn(){
  window.location.href ="processtypequery.cmd?clear=true";

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
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>表单打印模板查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<% 
    String formId = request.getParameter("formId");
	if (formId==null){
	  formId="";
	}
    String processType = request.getParameter("processType");
	if (processType==null){
	  processType="";
	}
%>
<div class="btnareaCss">
	<html:button onclick="forInsert()" name="btn_insert" value="增加"></html:button>&nbsp;<html:button onclick="forUpdate()" name="btn_update" value="修改"></html:button>&nbsp;<html:button onclick="forDetail()" name="btn_detail" value="明细"></html:button>&nbsp;<html:button onclick="forDelete()" name="btn_delete" value="删除"></html:button>&nbsp;<html:button onclick="forReturn()" name="btn_delete"  value="返回"></html:button>
</div>
<html:messages/>
<html:form name="frmList" action="formprinttempletquery.cmd">
<INPUT type="hidden" name="formId" value="<%=formId%>">
<INPUT type="hidden" name="processType" value="<%=processType%>">
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
	<flex:checkboxCol caption="选择" width="100" property="ID"  name="primaryKey" sortName="FORMPRINTTEMPLET.ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("FormPrintTemplet.TEMPLETNAME")%>' width="300" property="TEMPLETNAME" sortName="FORMPRINTTEMPLET.TEMPLETNAME"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="formprinttempletquery.cmd" >
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar('表单打印模板查询');
//setGridHeight("grid",0.5)
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="formprinttemplet.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="formprinttemplet.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="formprinttemplet.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="formprinttemplet.cmd?method=delete";    
  document.forms[0].submit();	
}
function forReturn(){
//  document.forms[0].action ="workformmanagerquery.cmd";
//  document.forms[0].submit();	
  location.href="workformmanagerquery.cmd?clear=true";
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
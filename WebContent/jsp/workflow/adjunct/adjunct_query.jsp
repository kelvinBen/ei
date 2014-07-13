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
<%
	String dataId = request.getParameter("dataId");
	if(dataId==null){
		dataId = (String)request.getAttribute("dataId");
	}
	String isEdit = request.getParameter("isEdit");
	if(isEdit == null){
		isEdit = (String)request.getAttribute("isEdit");
	}
%>

<HTML>
<HEAD>
<TITLE>附件查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">
<%if(isEdit.equals("1")){%>
<html:button onclick="forDelete();" name="btn_delete"  value="删除"></html:button>
<%} %>
</div>
<html:messages/>
<html:form name="frmList" action="adjunctquery.cmd">
<input type="hidden" name="dataId" value="<%=dataId%>"/>
<input type="hidden" name="isEdit" value="<%=isEdit%>">
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
						<%
							if(isEdit.equals("1")){
						%>
                          <flex:checkboxCol caption="选择" width="50" property="ID"  name="primaryKey" sortName="adjunct.id"></flex:checkboxCol>
                         <%}else{%>
                         <flex:flexCol caption='id' width="50" property="ID" name="primaryKey" sortName="adjunct.id" style="display:none"></flex:flexCol>
                         <%}%>
                          <flex:flexCol caption='标题' width="150" property="TITLE" sortName="adjunct.title" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='用户' width="80" property="USERNAME" sortName="adjunct.userName" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='加入时间' width="150" property="SUBTIME" sortName="adjunct.subTime" canSort="false"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="adjunctquery.cmd" >
</flex:pagePolit>
</html:form>
<iframe name="fujian" style="display:none"></iframe>
<script language="javascript">
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var tmpid=grid.getCellValue(i, 1);
		var tmptitle=grid.getCellValue(i, 2);

		grid.getCell(i, 2).innerHTML ="<span noWrap='true'><a href=\"javascript:forDetail('"+tmpid+"')\">"+tmptitle+"</a></span>";
								
}
function forDetail(tmpid){
  window.location.href="adjunct.cmd?method=detail&dataId="+document.all("dataId").value+"&primaryKey="+tmpid;  
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="adjunct.cmd?method=delete";    
  document.forms[0].submit();
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